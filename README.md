# Lab Report Processing API

This project provides a FastAPI service for processing lab report images and extracting test information using OCR.

## Dataset

The lab report images dataset is available at:
https://drive.google.com/file/d/1LzG7oJ-cqGHK9KbwXnWfkWgnQ3xi8Cr9/view?usp=sharing

After downloading:
1. Extract the contents
2. Place the `lab_reports_samples` folder in the project root directory

## Setup

1. Install Tesseract OCR:
   - Windows: Download and install from https://github.com/UB-Mannheim/tesseract/wiki
   - Make sure to add Tesseract to your system PATH

2. Install Python dependencies:
```bash
pip install -r requirements.txt
```

## Running the API

Start the FastAPI server:
```bash
python main.py
```

The API will be available at `http://localhost:8000`

## API Endpoints

### POST /get-lab-tests

Process a lab report image and extract test information.

**Request:**
- Content-Type: multipart/form-data
- Parameter: file (image file)

**Response:**
```json
{
    "is_success": true,
    "data": [
        {
            "test_name": "Test Name",
            "test_value": "123.45",
            "bio_reference_range": "0-100",
            "test_unit": "g/dL",
            "lab_test_out_of_range": true
        }
    ]
}
```

## Project Structure

- `main.py`: FastAPI application and endpoints
- `lab_processor.py`: Core logic for processing lab reports
- `requirements.txt`: Project dependencies
