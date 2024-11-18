# colors-app

This project is a simple Flask application that renders a webpage with a background color. Below are the steps to get started with Docker.

## Prerequisites

- Docker installed on your machine. You can download and install Docker from [here](https://www.docker.com/get-started).

## Running the App with Docker

### 1. Build the Docker image

To build the Docker image for the app, run the following command from the project root directory (where the `Dockerfile` is located):

```bash
docker build -t app:v1 .
```

### 2. Test app locally

To test the Docker image locally, run the following command:

```bash
docker run -d -p 5000:5000 app:v1
```

## GitHub Actions: Build and Push to Amazon ECR

This project uses GitHub Actions for Continuous Integration (CI) to automate the process of building a Docker image and pushing it to Amazon Elastic Container Registry (ECR).

### Workflow Overview
The GitHub Actions pipeline is defined in `.github/workflows/ci.yml`. It contains the following steps:

1. **Checkout code** - The workflow checks out the latest code from the repository.
2. **Log in to Amazon ECR** - The workflow authenticates with ECR using AWS credentials.
3. **Build Docker Image** - The Docker image is built from the Dockerfile in the repository.
4. **Push the image to ECR** - The Docker image is pushed to the specified Amazon ECR repository.