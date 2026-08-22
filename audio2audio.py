"""Local audio-to-audio with Stable Audio 3 Small-SFX.

Takes a source audio file plus a text prompt and renders a new, modified file.
Runs fully offline once the model is cached (~/.cache/huggingface).

Example:
    python audio2audio.py -i input.wav -p "metallic robotic version" -o out.wav --noise 0.75
"""

import argparse

import torch
import torch.nn.functional as F
import soundfile as sf
from stable_audio_3 import StableAudioModel

def main() -> None:
    ap = argparse.ArgumentParser(description="Stable Audio 3 Small-SFX audio-to-audio")
    ap.add_argument("-i", "--input", required=True, help="Source audio file to modify")
    ap.add_argument("-p", "--prompt", required=True, help="Prompt describing the target sound")
    ap.add_argument("-o", "--output", default="out.wav", help="Output file path")
    # Lower keeps more of the original; higher follows the prompt more freely.
    ap.add_argument("--noise", type=float, default=0.4, help="Init noise level 0.0-1.0 (default 0.4)")
    ap.add_argument("--duration", type=float, default=None, help="Output seconds (default: input length)")
    ap.add_argument("--steps", type=int, default=8, help="Diffusion steps (default 8)")
    ap.add_argument("--cfg-scale", type=float, default=1.0, help="CFG scale (default 1.0)")
    ap.add_argument("--seed", type=int, default=-1, help="Random seed (-1 = random)")
    ap.add_argument("--normalize", action="store_true", help="Peak-normalize output to prevent clipping")
    ap.add_argument("--device", default="cpu", choices=["cpu", "cuda"], help="Device to use: cpu (default) or cuda")
    ap.add_argument("--max-tail", type=float, default=2.0, help="Maximum extra tail seconds (default 2.0)")
    ap.add_argument("--tail-silence", type=float, default=0.1, help="Silence that ends a tail (default 0.1s)")
    args = ap.parse_args()

    if args.max_tail < 0 or args.tail_silence < 0:
        ap.error("--max-tail and --tail-silence must be non-negative")

    audio_data, sr = sf.read(args.input, always_2d=True)

    waveform = torch.from_numpy(audio_data.T).float()
    duration = args.duration if args.duration is not None else waveform.shape[-1] / sr
    generation_duration = max(duration, 5.0)

    # Make sure CUDA is actually available if the user requested it.
    if args.device == "cuda" and not torch.cuda.is_available():
        raise RuntimeError(
            "CUDA was requested, but PyTorch cannot see a CUDA-capable GPU."
        )

    print(f"Using device: {args.device}")
    print("Loading small-sfx...")

    model = StableAudioModel.from_pretrained(
        "small-sfx",
        device=args.device,
    )

    if generation_duration != duration:
        print(
            f"Using {generation_duration:.1f}s generation context for the "
            f"{duration:.2f}s source to avoid short-clip instability."
        )
    print(f"Modifying '{args.input}' -> '{args.output}' (noise={args.noise}, {duration:.2f}s)")
    audio = model.generate(
        prompt=args.prompt,
        duration=generation_duration,
        steps=args.steps,
        cfg_scale=args.cfg_scale,
        seed=args.seed,
        sample_size=model.model_config["sample_size"],
        init_audio=(sr, waveform),
        init_noise_level=args.noise,
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
        silence_samples = round(args.tail_silence * model.model.sample_rate)
        tail_limit = min(
            generated.shape[-1],
            window_end + round(args.max_tail * model.model.sample_rate),
        )
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
    if args.normalize:
        peak = out.abs().max()
        if peak > 0:
            out = out / peak

    sf.write(
        args.output,
        out.cpu().numpy().T,
        model.model.sample_rate,
    )
    print(f"Saved: {args.output}")


if __name__ == "__main__":
    main()
