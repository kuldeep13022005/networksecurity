FROM python:3.10-slim

WORKDIR /app

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
