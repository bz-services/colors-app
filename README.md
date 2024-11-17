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
