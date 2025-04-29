#!/bin/bash

# Activate Render's virtual environment
source .venv/bin/activate

# Install Python dependencies
echo "Installing Python dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

# Install system dependencies
echo "Installing system dependencies..."
apt-get update
apt-get install -y tesseract-ocr libgl1-mesa-glx libglib2.0-0

# Verify installations
echo "Verifying installations..."
python -c "import uvicorn; print('Uvicorn version:', uvicorn.__version__)"
python -c "import pytesseract; print('Tesseract path:', pytesseract.get_tesseract_version())"

# Make the script executable
chmod +x setup.sh 