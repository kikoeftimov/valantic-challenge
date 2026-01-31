#!/bin/bash

# Defining the log file
LOG_FILE="build.log"

# Function to log messages with timestamp
log() {
  echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Log the start of the build process
log "Build process started."

# Path to artifacts script
ARTIFACTS_SCRIPT="scripts/clean_artifacts.sh"

# Clean the old artifacts (Run the script)
chmod +x $ARTIFACTS_SCRIPT
$ARTIFACTS_SCRIPT

# Path to version script
VERSION_SCRIPT="scripts/handle_version.sh"

# Get the version
chmod +x $VERSION_SCRIPT
VERSION=$("./$VERSION_SCRIPT")

# Get the current timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M")

# Set the filename
FILENAME="app-$VERSION-$TIMESTAMP.tgz"
log "Packaging into archive: $FILENAME"

# Path to excluded.list file
EXCLUDED_LIST="lists/excluded.list"

# Check if the excluded list file exists
if [ ! -f "$EXCLUDED_LIST" ]; then
  log "Error: EXCLUDED_LIST file does not exist!"
  echo "Error: $EXCLUDED_LIST not found!"
  exit 1
fi

log "Start packaging process..."

# Package all files into .tar.gz
if tar --exclude-from=$EXCLUDED_LIST -czvf $FILENAME $(find . \( -name '*.js' -o -name '*.py' -o -name '*.sh' \) -type f); then
  log "Packaging successful."
  echo >> "$LOG_FILE"
else
  log "Error: Packaging failed."
  echo >> "$LOG_FILE"
  exit 1
fi

