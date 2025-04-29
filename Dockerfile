FROM jitesoft/tesseract:latest as tesseract

FROM python:3.9-slim

# Copy Tesseract from the pre-built image
COPY --from=tesseract /usr/bin/tesseract /usr/bin/tesseract
COPY --from=tesseract /usr/share/tesseract-ocr /usr/share/tesseract-ocr
COPY --from=tesseract /usr/lib/x86_64-linux-gnu/libtesseract.so.4 /usr/lib/x86_64-linux-gnu/libtesseract.so.4
COPY --from=tesseract /usr/lib/x86_64-linux-gnu/liblept.so.5 /usr/lib/x86_64-linux-gnu/liblept.so.5

# Set working directory
WORKDIR /app

# Copy requirements first to leverage Docker cache
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose the port
EXPOSE 8000

# Command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"] 