import argparse
from pathlib import Path

import torch
import torch.nn.functional as F
import soundfile as sf
from stable_audio_3 import StableAudioModel


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

    audio = model.generate(
        prompt=prompt,
        duration=generation_duration,
        steps=steps,
        cfg_scale=cfg_scale,
        seed=seed,
        sample_size=model.model_config["sample_size"],
        init_audio=(sr, waveform),
        init_noise_level=noise,
    )

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
        print(f"Warning: {clipped:.1%} of output samples are clipped; try a lower --noise value.")

    if normalize:
        peak = out.abs().max()
        if peak > 0:
            out = out / peak

    sf.write(output_path, out.numpy().T, model.model.sample_rate)
    print(f"Saved: {output_path}")


def main() -> None:
    ap = argparse.ArgumentParser(description="Interactive Stable Audio 3 Small-SFX audio-to-audio")

    ap.add_argument("--noise", type=float, default=0.4, help="Init noise level 0.0-1.0 (default 0.4)")
    ap.add_argument("--duration", type=float, default=None, help="Output seconds (default: input length)")
    ap.add_argument("--steps", type=int, default=8, help="Diffusion steps (default 8)")
    ap.add_argument("--cfg-scale", type=float, default=1.0, help="CFG scale (default 1.0)")
    ap.add_argument("--seed", type=int, default=-1, help="Random seed (-1 = random)")
    ap.add_argument("--normalize", action="store_true", help="Peak-normalize output")
    ap.add_argument("--device", default="cpu", choices=["cpu", "cuda"], help="Device to use")
    ap.add_argument("--max-tail", type=float, default=2.0, help="Maximum extra tail seconds")
    ap.add_argument("--tail-silence", type=float, default=0.1, help="Silence that ends a tail")

    args = ap.parse_args()

    if args.max_tail < 0 or args.tail_silence < 0:
        ap.error("--max-tail and --tail-silence must be non-negative")

    if args.device == "cuda" and not torch.cuda.is_available():
        raise RuntimeError("CUDA was requested, but PyTorch cannot see a CUDA-capable GPU.")

    print(f"Using device: {args.device}")
    print("Loading small-sfx...")

    model = StableAudioModel.from_pretrained("small-sfx", device=args.device)

    print("Model loaded.")
    print()
    print("Interactive audio transformation mode.")
    print("Type 'q' to quit.")
    print()

    sample_number = 1

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

        output_path = Path(input_path).parent / f"out_{sample_number:03d}.wav"

        try:
            generate_audio(
                model=model,
                input_path=input_path,
                prompt=prompt,
                output_path=str(output_path),
                noise=args.noise,
                duration=args.duration,
                steps=args.steps,
                cfg_scale=args.cfg_scale,
                seed=args.seed,
                normalize=args.normalize,
                max_tail=args.max_tail,
                tail_silence=args.tail_silence,
            )
        except Exception as e:
            print()
            print(f"Generation failed: {e}")
            print()

        sample_number += 1

        print()
        print("-" * 60)
        print()


if __name__ == "__main__":
    main()