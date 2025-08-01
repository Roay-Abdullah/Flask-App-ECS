# Flask Web App with Docker - ECS

A simple Flask web application packaged in a Docker container. This app has basic endpoints (`/` and `/health`) and can be used to demonstrate how to set up a Flask app in Docker with support for production deployment using Gunicorn. The Docker setup uses **multi-stage builds** to minimize the final image size and optimize the app for production.


## Technologies Used

* **Flask** – Web framework for building the app.
* **Docker** – Containerization for easier deployment and isolation.
* **Gunicorn** – WSGI HTTP server for running the app in production.
* **Werkzeug** – Flask's underlying utility library for handling HTTP requests.
* **Multi-stage Docker Build** – Optimizes the image by separating the build and runtime environments to reduce the final image size.

---

## Prerequisites

Ensure you have the following tools installed:

* [Docker](https://www.docker.com/get-started)
* [Python](https://www.python.org/downloads/) (for development purposes)

If you're running the app locally for development, also make sure you have `pip` (Python's package installer) installed.

---

## Setup

Clone this repository to your local machine:

```bash
git clone https://github.com/Roay-Abdullah/Flask-App-ECS.git
cd Flask-App-ECS
```

### Install Dependencies

Make sure to install the necessary dependencies:

```bash
pip install -r requirements.txt
```

---

## Running the App

### Development Mode (with Flask's built-in server)

To run the app in development mode, run the following command:

```bash
python run.py
```

This will start the Flask development server at `http://localhost:80` (accessible via your browser). Debug mode will be enabled in this case for easier development.

### Production Mode (with Gunicorn)

For production environments, it is recommended to run the app with **Gunicorn** instead of the Flask development server.

1. **Build the Docker image**:

   ```bash
   docker build -t flask-app .
   ```

2. **Run the container**:

   ```bash
   docker run -p 80:80 flask-app
   ```

This will start the app inside a Docker container, binding it to port `80` on your machine.

### Multi-stage Docker Build

The Dockerfile utilizes **multi-stage builds** to optimize the final image size. Here's how it works:

1. **Stage 1** (Build Stage): The Python dependencies are installed in a larger base image (`python:3.7`). This stage is responsible for installing all the necessary libraries and dependencies.
2. **Stage 2** (Runtime Stage): A much smaller base image (`python:3.7-slim`) is used for the final image. This reduces the size of the production container by excluding unnecessary build tools and files. Only the required runtime dependencies are copied from the first stage.

This approach results in a much smaller Docker image compared to using a single stage for both building and running the app.

---

## Folder Structure

```
/your-repository-name
├── Dockerfile          # Instructions for building the Docker image (multi-stage build)
├── app.py              # Main Flask application
├── requirements.txt    # Python dependencies (Flask, Werkzeug, etc.)
└── run.py              # Entry point to start the Flask app
```

---

## Environment Variables

You can set environment variables for different environments (e.g., development, production) using the `FLASK_ENV` variable.

* **Development**: `FLASK_ENV=development`
* **Production**: `FLASK_ENV=production`

### Setting Environment Variables in Docker

To set `FLASK_ENV` when running the container, use the `-e` flag:

```bash
docker run -e FLASK_ENV=production -p 80:80 flask-app
```

---

Feel free to update the "Technologies Used" and "Folder Structure" sections with more details specific to your project as it grows. You can also enhance the README by adding any other useful information like troubleshooting tips or contribution guidelines!

---
