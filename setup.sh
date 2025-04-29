#!/bin/bash

# Create and activate virtual environment
python -m venv venv
source venv/bin/activate

# Install Python dependencies
pip install --upgrade pip
pip install -r requirements.txt

# Install system dependencies
apt-get update
apt-get install -y tesseract-ocr libgl1-mesa-glx libglib2.0-0

# Make uvicorn executable
chmod +x venv/bin/uvicorn

# Make the script executable
chmod +x setup.sh 