"""Local audio-to-audio with Stable Audio Open / Small-SFX.

Takes a source audio file plus a text prompt and renders a new, modified file.
Runs fully offline once the model is cached or loaded locally.
Auto-checks and installs CUDA-enabled PyTorch if missing.
"""

import argparse
import json
import os
import random
import subprocess
import sys
from pathlib import Path


def ensure_cuda_pytorch() -> None:
    """Checks for CUDA support in PyTorch.

    If missing or non-functional, uninstalls CPU variants and installs pure CUDA 12.1 binaries,
    then restarts the Python process so C-extensions load properly.
    """
    try:
        import torch

        if torch.cuda.is_available():
            return
        print("[WARN] Installed PyTorch lacks CUDA support. Repairing environment...")
    except ImportError:
        print("[INFO] PyTorch not found. Installing PyTorch with CUDA 12.1 support...")

    # 1. Upgrade build tools to prevent metadata mismatches
    subprocess.check_call(
        [sys.executable, "-m", "pip", "install", "--upgrade", "pip", "setuptools", "wheel"]
    )

    # 2. Force uninstall existing CPU binaries
    print("[INFO] Removing CPU versions of PyTorch...")
    subprocess.call(
        [sys.executable, "-m", "pip", "uninstall", "-y", "torch", "torchaudio", "torchvision"]
    )

    # 3. Direct install CUDA 12.1 wheels ONLY (no extra-index-url)
    cmd = [
        sys.executable,
        "-m",
        "pip",
        "install",
        "torch",
        "torchaudio",
        "--index-url",
        "https://download.pytorch.org/whl/cu121",
    ]
    print(f"Running: {' '.join(cmd)}")
    subprocess.check_call(cmd)
    print("[SUCCESS] PyTorch with CUDA installed. Restarting script process...\n")

    # 4. Restart process to bind CUDA DLLs cleanly into memory
    os.execv(sys.executable, [sys.executable] + sys.argv)


# Ensure CUDA PyTorch environment prior to main imports
ensure_cuda_pytorch()

from dotenv import load_dotenv  # noqa: E402
import torch  # noqa: E402
import torchaudio  # noqa: E402

# Load environment variables from .env if present
load_dotenv()

# SCRIPT_DIR is .../stable-groove
SCRIPT_DIR = Path(__file__).resolve().parent
# Target default local folder: .../stable-audio-open-small
DEFAULT_MODEL_PATH = (SCRIPT_DIR.parent / "stable-audio-open-small").resolve()


def load_local_or_hf_model(model_path_str: str):
    """Loads a model from a local directory (config + weights) or from HF Hub."""
    from stable_audio_tools import get_pretrained_model
    from stable_audio_tools.models.factory import create_model_from_config
    from stable_audio_tools.models.utils import load_ckpt_state_dict

    path = Path(model_path_str).resolve()

    is_local_path = (
        path.exists()
        or "/" in model_path_str
        or "\\" in model_path_str
        or ".." in model_path_str
    )

    if is_local_path:
        if not path.exists():
            raise FileNotFoundError(
                f"[ERROR] Target model directory does not exist on disk:\n  {path}\n"
                f"Verify the folder name next to 'stable-groove' matches 'stable-audio-open-small' "
                f"or check if MODEL_PATH in your .env file points to a missing folder."
            )

        config_path = path / "model_config.json"
        if not config_path.exists():
            raise FileNotFoundError(f"[ERROR] Could not find 'model_config.json' inside: {path}")

        ckpt_path = None
        for ext in ("*.safetensors", "*.ckpt", "*.pth", "*.pt"):
            matches = list(path.glob(ext))
            if matches:
                ckpt_path = matches[0]
                break

        if not ckpt_path:
            raise FileNotFoundError(
                f"[ERROR] No weights file (.safetensors, .ckpt, .pth) found inside: {path}"
            )

        print(f"Loading local config from: {config_path}")
        with open(config_path, "r") as f:
            model_config = json.load(f)

        print(f"Loading local weights from: {ckpt_path.name}")
        model = create_model_from_config(model_config)
        model.load_state_dict(load_ckpt_state_dict(str(ckpt_path)))
        return model, model_config
    else:
        return get_pretrained_model(model_path_str)


def main() -> None:
    ap = argparse.ArgumentParser(description="Stable Audio audio-to-audio")
    ap.add_argument("-i", "--input", required=True, help="Source audio file to modify")
    ap.add_argument("-p", "--prompt", required=True, help="Prompt describing the target sound")
    ap.add_argument("-o", "--output", default="out.wav", help="Output file path")
    ap.add_argument(
        "--model-path",
        default=os.getenv("MODEL_PATH", str(DEFAULT_MODEL_PATH)),
        help="Path to local model folder or HF ID",
    )
    ap.add_argument("--noise", type=float, default=0.4, help="Init noise level 0.0-1.0 (default 0.4)")
    ap.add_argument("--duration", type=float, default=None, help="Output seconds (default: input length)")
    ap.add_argument("--steps", type=int, default=8, help="Diffusion steps (default 8)")
    ap.add_argument("--cfg-scale", type=float, default=1.0, help="CFG scale (default 1.0)")
    ap.add_argument("--seed", type=int, default=-1, help="Random seed (-1 = random)")
    ap.add_argument("--normalize", action="store_true", help="Peak-normalize output to prevent clipping")
    ap.add_argument("--device", default=None, help="cpu / mps / cuda (auto if omitted)")
    args = ap.parse_args()

    try:
        from stable_audio_tools.inference.generation import generate_diffusion_cond
    except ImportError:
        print("[ERROR] 'stable-audio-tools' is not installed in active environment.")
        sys.exit(1)

    device = args.device
    if device is None:
        device = "cuda" if torch.cuda.is_available() else "cpu"

    input_path = Path(args.input).resolve()
    if not input_path.exists():
        alt_input = (SCRIPT_DIR / args.input).resolve()
        if alt_input.exists():
            input_path = alt_input
        else:
            raise FileNotFoundError(f"[ERROR] Input audio file not found at: {input_path}")

    waveform, sr = torchaudio.load(str(input_path))
    duration = args.duration if args.duration is not None else waveform.shape[-1] / sr

    print(f"Loading model onto {device}...")
    model, model_config = load_local_or_hf_model(args.model_path)
    model = model.to(device)

    print(f"Modifying '{input_path.name}' -> '{args.output}' (noise={args.noise}, {duration:.2f}s)")

    conditioning = [{"prompt": args.prompt, "seconds_start": 0, "seconds_total": duration}]
    seed = args.seed if args.seed != -1 else random.randint(0, 2**31 - 1)

    output = generate_diffusion_cond(
        model,
        steps=args.steps,
        cfg_scale=args.cfg_scale,
        conditioning=conditioning,
        sample_size=model_config["sample_size"],
        sigma_min=0.3,
        sigma_max=500,
        init_audio=(sr, waveform),
        init_noise_level=args.noise,
        seed=seed,
        device=device,
    )

    out = output[0].cpu()
    if args.normalize:
        peak = out.abs().max()
        if peak > 0:
            out = out / peak

    torchaudio.save(args.output, out, model_config["sample_rate"])
    print(f"Saved: {args.output}")


if __name__ == "__main__":
    main()