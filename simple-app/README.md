## Dockerized Node.js and Python applications

### This project runs two applications **(Node.js and Python)** inside a single Docker container. A shell script (`.sh`) is used as the container entry point and is responsible for starting both applications.

---

## Overview

- The Docker image contains:
  - A Node.js application
  - A Python application
- A shell script is defined as the container `CMD`
- When the container starts, the shell script launches both the Node and Python processes

---

## Prerequisites

- **Docker installed (https://www.docker.com/) - Docker Desktop or Docker Engine**

Verify Docker installation:

```bash
docker --version
```

## Docker build / Docker run

### Build the image

```bash
docker build -t {image-name} .
```

### Run the container from the previously created Docker image

```bash
docker run -d --name {container-name} -p 8080:8080 -p 3000:3000 {image-name:version}
```
### The ports have the following meaning:
- Left side (8080) - port on host machine
- Right side (8080) - port inside the Docker container

### Validate both applications

```bash
curl localhost:3000 
curl localhost:8080
```

### If the image is build correctly and the container is running, the following responses are expected:
-  Hello from a simple Node.js app!
-  Hello from a simple Python app!