@echo off
setlocal enabledelayedexpansion

cd /d "%~dp0"

if not exist "venv\Scripts\activate.bat" (
    echo [SETUP] Creating virtual environment...
    python -m venv venv
)

call venv\Scripts\activate.bat

:: Verify CUDA status
python -c "import torch; assert torch.cuda.is_available()" 2>nul
if errorlevel 1 (
    echo [SETUP] CUDA PyTorch not detected or needs repair. Setting up environment...
    
    :: Upgrade build tools to prevent metadata mismatches
    python -m pip install --upgrade pip setuptools wheel

    :: Install general dependencies first so they don't override CUDA torch later
    pip install python-dotenv soundfile pytorch-lightning stable-audio-tools
    pip install "numpy<2.0.0" --force-reinstall

    :: Force install CUDA 12.1 PyTorch last
    pip uninstall -y torch torchaudio torchvision
    pip install torch torchaudio --index-url https://download.pytorch.org/whl/cu121
)

echo [INFO] Running on GPU via CUDA...

:: Forward CLI arguments directly to python script if provided
if not "%~1"=="" (
    python audio2audio.py %*
    exit /b %ERRORLEVEL%
)

:: Interactive fallback prompt if run without arguments
echo No arguments provided. Enter parameters or press Enter to run defaults:
echo.

set /p INPUT_FILE="Input file path [..\samples\test.wav]: "
if "%INPUT_FILE%"=="" set "INPUT_FILE=..\samples\test.wav"

set /p PROMPT_TEXT="Text prompt [funky bassline groove]: "
if "%PROMPT_TEXT%"=="" set "PROMPT_TEXT=funky bassline groove"

set /p OUTPUT_FILE="Output file path [out.wav]: "
if "%OUTPUT_FILE%"=="" set "OUTPUT_FILE=out.wav"

python audio2audio.py ^
    -i "%INPUT_FILE%" ^
    -p "%PROMPT_TEXT%" ^
    -o "%OUTPUT_FILE%" ^
    --steps 8 ^
    --normalize

pause