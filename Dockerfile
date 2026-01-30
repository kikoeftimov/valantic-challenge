FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Working directory
WORKDIR /app

# Copy the script, Python and Node.js apps
COPY sample-python-script.py sample-node-script.js start-servers.sh /app/

# Make shell script executable
RUN chmod +x /app/start-servers.sh

# Expose ports used by the apps
EXPOSE 3000 8080

# Start both servers when container runs
CMD ["/app/start-servers.sh"]
