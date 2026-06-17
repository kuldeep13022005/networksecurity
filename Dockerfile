FROM python:3.10-slim-buster

WORKDIR /app

# Install git or compile tools if needed by setup.py or package installations
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY . /app

# Install packages
RUN pip install --no-cache-dir -r requirements.txt

# Install the application package
RUN pip install -e .

# Expose port
EXPOSE 8000

# Set environment variable defaults
ENV PORT=8000

# Start application
CMD ["python", "app.py"]
