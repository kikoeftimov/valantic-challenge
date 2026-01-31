#!/bin/bash

# Define the log file
LOG_FILE="build.log"

# Function to log messages with timestamp
log() {
  echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

if [ ! -f VERSION ]; then
  log "Error: VERSION file does not exist!"
  echo "Error: VERSION file does not exist!"
  exit 1
fi

# Get version from VERSION file
VERSION=$(sort -V VERSION | tail -n 1)
log "Version: $VERSION"

if [ -z "$VERSION" ]; then
  log "Error: VERSION file is empty!"
  echo "Error: VERSION file is empty!"
  exit 1
fi

echo $VERSION
