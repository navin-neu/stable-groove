# StableGroove

**StableGroove** is a real-time, AI-powered drum machine instrument designed for live performance and effortless flow state. Where typical AI audio tools break your momentum with long render times and static exports, StableGroove combines a classic sample-based step sequencer with real-time audio generation powered by [Stable Audio](https://huggingface.co/stabilityai/stable-audio-3-small-sfx). By hot-swapping newly generated samples in perfect sync on the measure downbeat, it transforms generative AI from a slow render tool into an immediate, playable instrument, letting you manipulate, sculpt, and perform live without ever dropping a beat.

## Key features

- **Classic Step Sequencer**: Familiar, intuitive pattern grid for real-time tempo changes, step editing, and rhythm design.

- **On-the-Fly AI Sound Sculpting**: Describe the modification characteristics you want (e.g., "rounder", "reverby", "bitcrushed"), set the Divergence amount, and let the model synthesize new audio elements on demand.

- **Measure-Quantized Hot-Swapping**: Generated samples are seamlessly queued and hot-swapped at the end of the current measure. Your groove stays completely locked while live sound updates trigger in perfect synchronization.

- **CUDA-Accelerated**: Leverages GPU hardware acceleration if available for ultra-fast sample synthesis during live performance (<1 second).

- **Compatible**: Runs standalone on modest hardware. Generates samples with the CPU in a matter of seconds on lower-end hardware.