FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    nodejs \
    npm \
    cron \
    && rm -rf /var/lib/apt/lists/*

# Working directory
WORKDIR /app

# Copy files
COPY sample-bash-script.sh sample-python-script.py sample-node-script.js /app/

# Make shell script executable
RUN chmod +x /app/sample-bash-script.sh

# Create log file
RUN touch /var/log/app.log

# Add cron job
RUN echo "* * * * * /app/sample-bash-script.sh >> /var/log/app.log 2>&1" > /etc/cron.d/app-cron \
    && chmod 0644 /etc/cron.d/app-cron \
    && crontab /etc/cron.d/app-cron

# Run cron in foreground
CMD ["cron", "-f"]

