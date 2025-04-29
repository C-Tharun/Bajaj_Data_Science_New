from fastapi import FastAPI, UploadFile, File
from fastapi.middleware.cors import CORSMiddleware
from typing import List, Dict, Any
import uvicorn
from lab_processor import LabReportProcessor
import logging
import os

# Configure logging
logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

app = FastAPI(title="Lab Report Processing API")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

lab_processor = LabReportProcessor()

@app.get("/healthz")
async def health_check():
    logger.info("Health check endpoint called")
    return {"status": "healthy"}

@app.post("/get-lab-tests")
async def process_lab_report(file: UploadFile = File(...)) -> Dict[str, Any]:
    try:
        logger.debug(f"Received file: {file.filename}")
        contents = await file.read()
        logger.debug(f"File size: {len(contents)} bytes")
        
        result = lab_processor.process_report(contents)
        logger.debug(f"Processing result: {result}")
        
        return {
            "is_success": True,
            "data": result
        }
    except Exception as e:
        logger.error(f"Error processing file: {str(e)}")
        return {
            "is_success": False,
            "error": str(e)
        }

@app.get("/")
async def root():
    logger.info("Root endpoint called")
    return {"message": "Lab Report Processing API is running. Use POST /get-lab-tests to process lab reports."}

if __name__ == "__main__":
    port = int(os.getenv("PORT", 8000))
    logger.info(f"Starting server on port {port}")
    uvicorn.run(
        "main:app",
        host="0.0.0.0",
        port=port,
        log_level="debug",
        reload=False
    ) 