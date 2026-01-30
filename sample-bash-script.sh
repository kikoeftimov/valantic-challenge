#!/bin/bash

MINUTE=$(date +%M)

if (( MINUTE % 2 == 0 )); then
    echo "Even minute ($MINUTE) - running Python"
    python3 sample-python-script.py
else
    echo "Odd minute ($MINUTE) - running Node"
    node sample-node-script.js
fi