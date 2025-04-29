#!/bin/bash

# Install Python dependencies
pip install -r requirements.txt

# Install system dependencies
apt-get update
apt-get install -y tesseract-ocr libgl1-mesa-glx libglib2.0-0

# Make the script executable
chmod +x setup.sh 