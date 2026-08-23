import argparse
import queue
import threading
from pathlib import Path

import torch
import torch.nn.functional as F
import soundfile as sf
from stable_audio_3 import StableAudioModel

from osc4py3.as_allthreads import *
from osc4py3 import oscbuildparse
from osc4py3 import oscmethod as osm


def generate_audio(model, input_path: str, prompt: str, output_path: str, noise: float = 0.4, duration: float | None = None, steps: int = 8, cfg_scale: float = 1.0, seed: int = -1, normalize: bool = False, max_tail: float = 2.0, tail_silence: float = 0.1):
    """Generate a transformed audio sample."""

    audio_data, sr = sf.read(input_path, always_2d=True)
    waveform = torch.from_numpy(audio_data.T).float()

    duration = duration if duration is not None else waveform.shape[-1] / sr
    generation_duration = max(duration, 5.0)

    if generation_duration != duration:
        print(f"Using {generation_duration:.1f}s generation context for the {duration:.2f}s source.")

    print(f"Prompt: {prompt}")
    print(f"Noise: {noise}")
    print("Generating...")

    audio = model.generate(prompt=prompt, duration=generation_duration, steps=steps, cfg_scale=cfg_scale, seed=seed, sample_size=model.model_config["sample_size"], init_audio=(sr, waveform), init_noise_level=noise)

    generated = audio[0].cpu()
    output_samples = round(duration * model.model.sample_rate)

    if generated.shape[-1] > output_samples:
        window_stride = max(1, min(output_samples // 20, model.model.sample_rate // 100))
        energy = generated.square().mean(dim=0, keepdim=True).unsqueeze(0)
        window_energy = F.avg_pool1d(energy, output_samples, stride=window_stride)
        window_start = window_energy.argmax().item() * window_stride
        window_end = window_start + output_samples

        frame_samples = max(1, model.model.sample_rate // 100)
        silence_samples = round(tail_silence * model.model.sample_rate)
        tail_limit = min(generated.shape[-1], window_end + round(max_tail * model.model.sample_rate))

        reference_rms = generated[:, window_start:window_end].square().mean().sqrt().item()
        silence_threshold = max(reference_rms * 0.01, 1e-4)

        tail_end = window_end
        silent_run = 0

        for frame_start in range(window_end, tail_limit, frame_samples):
            frame_end = min(frame_start + frame_samples, tail_limit)
            frame_rms = generated[:, frame_start:frame_end].square().mean().sqrt().item()

            if frame_rms >= silence_threshold:
                tail_end = frame_end
                silent_run = 0
            else:
                silent_run += frame_end - frame_start
                if silent_run >= silence_samples:
                    break

        if tail_end > window_end:
            tail_end = min(tail_end + silence_samples, tail_limit)

        out = generated[:, window_start:tail_end]

        print(f"Selected generated audio at {window_start / model.model.sample_rate:.2f}s.")

        if tail_end > window_end:
            tail_duration = (tail_end - window_end) / model.model.sample_rate
            print(f"Retained {tail_duration:.2f}s of generated tail.")
    else:
        out = generated[:, :output_samples]

    clipped = (out.abs() >= 0.999).float().mean().item()

    if clipped > 0.01:
        print(f"Warning: {clipped:.1%} of output samples are clipped; try a lower noise value.")

    if normalize:
        peak = out.abs().max()
        if peak > 0:
            out = out / peak

    sf.write(output_path, out.numpy().T, model.model.sample_rate)
    print(f"Saved: {output_path}")


def main() -> None:
    ap = argparse.ArgumentParser(description="Interactive Stable Audio 3 Small-SFX audio-to-audio with console and OSC control")

    ap.add_argument("--duration", type=float, default=None, help="Output seconds (default: input length)")
    ap.add_argument("--steps", type=int, default=8, help="Diffusion steps (default 8)")
    ap.add_argument("--cfg-scale", type=float, default=1.0, help="CFG scale (default 1.0)")
    ap.add_argument("--seed", type=int, default=-1, help="Random seed (-1 = random)")
    ap.add_argument("--normalize", action="store_true", help="Peak-normalize output")
    ap.add_argument("--device", default="cpu", choices=["cpu", "cuda"], help="Device to use")
    ap.add_argument("--max-tail", type=float, default=2.0, help="Maximum extra tail seconds")
    ap.add_argument("--tail-silence", type=float, default=0.1, help="Silence that ends a tail")
    ap.add_argument("--osc-port", type=int, default=9000, help="UDP port for OSC /generate messages (default 9000)")
    ap.add_argument("--osc-reply-host", default="127.0.0.1", help="Host for OSC /ready messages (default 127.0.0.1)")
    ap.add_argument("--osc-reply-port", type=int, default=9001, help="UDP port for OSC /ready messages (default 9001)")

    args = ap.parse_args()

    if args.max_tail < 0 or args.tail_silence < 0:
        ap.error("--max-tail and --tail-silence must be non-negative")

    if not 1 <= args.osc_port <= 65535 or not 1 <= args.osc_reply_port <= 65535:
        ap.error("OSC ports must be between 1 and 65535")

    if args.device == "cuda" and not torch.cuda.is_available():
        raise RuntimeError("CUDA was requested, but PyTorch cannot see a CUDA-capable GPU.")

    print(f"Using device: {args.device}")
    print("Loading small-sfx...")

    model = StableAudioModel.from_pretrained("small-sfx", device=args.device)

    print("Model loaded.")

    job_queue = queue.Queue()
    sample_number_lock = threading.Lock()
    generation_lock = threading.Lock()
    sample_number = 1

    def get_next_output_path(input_path: str) -> str:
        nonlocal sample_number

        output_dir = Path("output")
        output_dir.mkdir(parents=True, exist_ok=True)

        with sample_number_lock:
            output_path = output_dir / f"out_{sample_number:03d}.wav"
            sample_number += 1

        return str(output_path)

    def queue_generation(input_path: str, prompt: str, noise: float, source: str, track: int | None = None) -> None:
        if not Path(input_path).is_file():
            print(f"[{source}] File not found: {input_path}")
            return

        if not prompt:
            print(f"[{source}] Prompt cannot be empty.")
            return

        try:
            noise = float(noise)
        except (TypeError, ValueError):
            print(f"[{source}] Noise must be a number between 0.0 and 1.0.")
            return

        if not 0.0 <= noise <= 1.0:
            print(f"[{source}] Noise must be between 0.0 and 1.0.")
            return

        output_path = get_next_output_path(input_path)

        print()
        print(f"[{source}] Queued generation:")
        print(f"  Input:  {input_path}")
        print(f"  Prompt: {prompt}")
        print(f"  Noise:  {noise}")
        print(f"  Output: {output_path}")
        print()

        job_queue.put((input_path, prompt, noise, output_path, track))

    def make_osc_handler(track):
        def osc_generate_handler(prompt, input_path, noise):
            print()
            print(f"Received OSC /generate/{track} message.")
            print(f"  Track:  {track}")
            print(f"  Prompt: {prompt}")
            print(f"  Input:  {input_path}")
            print(f"  Noise:  {noise}")
            queue_generation(str(input_path), str(prompt), float(noise), f"OSC Track {track}", track)
        return osc_generate_handler

    osc_startup(execthreadscount=0, writethreadscount=0)
    osc_udp_server("0.0.0.0", args.osc_port, "generate_server")
    osc_udp_client(args.osc_reply_host, args.osc_reply_port, "ready_client")
    for track in range(4):
        osc_method(f"/generate/{track}", make_osc_handler(track))
        
    print(f"OSC listening on 0.0.0.0:{args.osc_port}")
    print("OSC endpoints: /generate/0 through /generate/3")
    print(f"OSC /ready replies sent to {args.osc_reply_host}:{args.osc_reply_port}")
    print()
    print("Interactive audio transformation mode.")
    print("Type 'q' to quit.")
    print()

    def generation_worker() -> None:
        while True:
            job = job_queue.get()

            if job is None:
                job_queue.task_done()
                break

            input_path, prompt, noise, output_path, track = job

            try:
                with generation_lock:
                    generate_audio(model=model, input_path=input_path, prompt=prompt, output_path=output_path, noise=noise, duration=args.duration, steps=args.steps, cfg_scale=args.cfg_scale, seed=args.seed, normalize=args.normalize, max_tail=args.max_tail, tail_silence=args.tail_silence)

                if track is not None:
                    output_file_path = Path(output_path).resolve().as_posix()
                    ready_message = oscbuildparse.OSCMessage("/ready", None, [track, output_file_path])
                    osc_send(ready_message, "ready_client")
                    print(f"Sent OSC: /ready {track} {output_file_path}")
            except Exception as e:
                print()
                print(f"Generation failed: {e}")
                print()
            finally:
                job_queue.task_done()

    worker = threading.Thread(target=generation_worker, daemon=True)
    worker.start()

    try:
        while True:
            input_path = input("Original file path: ").strip().strip('"')

            if input_path.lower() in ("q", "quit", "exit"):
                print("Exiting.")
                break

            if not Path(input_path).is_file():
                print(f"File not found: {input_path}")
                print()
                continue

            prompt = input("Transformation prompt: ").strip()

            if prompt.lower() in ("q", "quit", "exit"):
                print("Exiting.")
                break

            if not prompt:
                print("Prompt cannot be empty.")
                print()
                continue

            noise_text = input("Noise level (0.0-1.0): ").strip()

            try:
                noise = float(noise_text)
            except ValueError:
                print("Noise must be a number between 0.0 and 1.0.")
                print()
                continue

            if not 0.0 <= noise <= 1.0:
                print("Noise must be between 0.0 and 1.0.")
                print()
                continue

            queue_generation(input_path, prompt, noise, "Console")

            print("-" * 60)
            print()

    except KeyboardInterrupt:
        print()
        print("Exiting.")

    finally:
        osc_terminate()
        job_queue.put(None)
        worker.join()


if __name__ == "__main__":
    main()