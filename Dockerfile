# Run Base image (OS)          
FROM python:3.7

# Create Working directory for container
WORKDIR /app

# Copy src code to container
COPY . .

# Run the build commands
RUN pip install -r requirements.txt

# Serve the app / run the app (keep it running)
ENTRYPOINT ["python","run.py"]

