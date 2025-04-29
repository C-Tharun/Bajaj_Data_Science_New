#!/bin/bash

# Install Python dependencies
pip install --upgrade pip
pip install -r requirements.txt

# Install system dependencies
apt-get update
apt-get install -y tesseract-ocr libgl1-mesa-glx libglib2.0-0

# Create symlink to uvicorn in /usr/local/bin
ln -s ~/.local/bin/uvicorn /usr/local/bin/uvicorn

# Make the script executable
chmod +x setup.sh 