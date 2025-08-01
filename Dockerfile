# Stage 1 Base image 994MB ~ 1.01GB          
FROM python:3.7 AS upper-image

# Create Working directory for container
WORKDIR /app

# Copy src code to container
COPY requirements.txt .

# Run the requirement commands
RUN pip install -r requirements.txt

# --------



# Stage 2 Base image 125MB ~ 142MB
FROM python:3.7-slim

# Create Working directory for container
WORKDIR /app

# Copy packages from upper-image 
COPY --from=upper-image /usr/local/lib/python3.7/site-packages/ /usr/local/lib/python3.7/site-packages/

# Copy src code to container
COPY . .

# Serve the app / run the app (keep it running)
ENTRYPOINT ["python","run.py"]
