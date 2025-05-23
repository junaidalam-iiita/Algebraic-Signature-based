#!/bin/bash

# Find the PID of the process listening on port 22222
PID=$(sudo ss -ltnp | grep ':22222' | awk -F 'pid=' '{print $2}' | awk -F ',' '{print $1}')

# Check if PID is not empty
if [[ -n "$PID" ]]; then
    echo "Killing process with PID: $PID"
    sudo kill -9 "$PID"
    echo "Process killed."
else
    echo "No process found listening on port 22222."
fi
