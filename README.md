# Build package - Valantic challenge

## Overview
This repository contains a shell script designed to run on Linux and macOS systems. The script builds a tarball containing Node(.js), Python(.py) and Shell(.sh) files. Each execution of the script creates a new build and removes the previous one.

The development follows a feature-based Git workflow, with each feature implemented in its own branch. The repository contains four branches (each one building a separate feature) and one tag, which was created from the latest commit on the main branch.

---

## Prerequisites
- **Operating System:** Linux or macOS
- **Tools:**
  - Git (https://github.com/git-guides/install-git)
  - Bash-compatible shell (the default one)
- Ensure the script (build_package.sh) has execute permissions.

---

## How to Run the Script
1. Clone the repository:
   ```bash
   git clone https://github.com/kikoeftimov/valantic-challenge.git
   cd valantic-challenge
   chmod +x build_package.sh
   ./build_package.sh

---

## Possible production improvements
This project includes several production-focused improvements to make development, deployment, and releases more reliable and consistent.

### 1. Environment Configuration

The application should use environment variables to manage configuration across multiple environments.

- Each environment (local/dev, staging, production) should have its own `.env` file

### 2. Use GitHub Actions

GitHub Actions should be used because it automates testing, builds, and deployments directly in the repository, reducing the manual work. It ensures consistent, repeatable workflows so code is always validated the same way before being merged, released or deployed to production.

### 3. Push tags based on versions

Pushing tags based on versions ensures that the GitHub tag, release, and packaged artifacts/tarballs reference the exact same version. This creates a single and reliable source for releases, making builds reproducible and releases easier to track. The GitHub Action should be responsible for creating and deploying the tag to guarantee this consistency automatically.

### 4. Docker Compose for managing the applications

At the moment, both the Python and Node.js applications are running inside a single Docker container.
This approach is used to:

- Keep the setup simple

- Avoid managing multiple containers at this stage

- Run both services together as a single deployable unit

The shell script is used as the container entry point, because the Docker container can only define one startup command. This script (start_servers.sh) is responsible for starting both applications when the container launches.

All required system dependencies (Python, Node.js, and related tools) are installed during the image build phase, ensuring the runtime environment is fully prepared before the container starts.

While this setup works and is valid for early development, as the project evolves, the applications should be split into separate containers and managed with Docker Compose to improve isolation, scalability, and observability. This setup would include a separate Dockerfile for each application (building it's own dependencies and running the service), combined into Docker Compose. 