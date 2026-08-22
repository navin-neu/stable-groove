"""Local audio-to-audio with Stable Audio 3 Small-SFX.

Takes a source audio file plus a text prompt and renders a new, modified file.
Runs fully offline once the model is cached (~/.cache/huggingface).

Example:
    python audio2audio.py -i input.wav -p "metallic robotic version" -o out.wav --noise 0.75
"""

import argparse

import torchaudio
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
    ap.add_argument("--device", default=None, help="cpu / mps / cuda (auto if omitted)")
    args = ap.parse_args()

    waveform, sr = torchaudio.load(args.input)
    duration = args.duration if args.duration is not None else waveform.shape[-1] / sr

    print("Loading small-sfx...")
    model = StableAudioModel.from_pretrained("small-sfx", device=args.device)

    print(f"Modifying '{args.input}' -> '{args.output}' (noise={args.noise}, {duration:.2f}s)")
    audio = model.generate(
        prompt=args.prompt,
        duration=duration,
        steps=args.steps,
        cfg_scale=args.cfg_scale,
        seed=args.seed,
        sample_size=model.model_config["sample_size"],
        init_audio=(sr, waveform),
        init_noise_level=args.noise,
    )

    out = audio[0].cpu()
    if args.normalize:
        peak = out.abs().max()
        if peak > 0:
            out = out / peak

    torchaudio.save(args.output, out, model.model.sample_rate)
    print(f"Saved: {args.output}")


if __name__ == "__main__":
    main()
