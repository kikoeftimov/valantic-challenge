#!/bin/bash

LOG_FILE="build.log"

# Function to log messages with timestamp
log() {
  echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Path to artifacts.list file
ARTIFACTS_LIST="lists/artifacts.list"

# Check if the artifacts list file exists
if [ ! -f "$ARTIFACTS_LIST" ]; then
  log "Error: ARTIFACTS_LIST file does not exist!"
  echo "Error: $ARTIFACTS_LIST not found!"
  exit 1
fi

# Process artifacts file
while read -r a; do
  [ -z "$a" ] && continue
  
  # Remove the artifact
  rm -rf 'release/'$a
done < "$ARTIFACTS_LIST"
log "Old artifacts cleaned!"
