#!/bin/bash

# IP Address Finder Script

# Function to display usage instructions
usage() {
    echo "Usage: $0 <log_file_path>"
    exit 1
}

# Check if exactly one argument is provided
if [ $# -ne 1 ]; then
    echo "Error: No log file path provided."
    usage
fi

LOG_FILE="$1"

# Check if the provided file exists and is readable
if [ ! -f "$LOG_FILE" ] || [ ! -r "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' does not exist or is not readable."
    exit 1
fi

IPv4 Address Validation
IP_REGEX='([0-9]{1,3}\.){3}[0-9]{1,3}'

# Extract, sort, and count unique IP addresses
IP_ADDRESSES=$(grep -oE "$IP_REGEX" "$LOG_FILE" | sort | uniq -c)

# Check if any IP addresses were found
if [ -z "$IP_ADDRESSES" ]; then
    echo "No valid IP addresses found in '$LOG_FILE'."
else
    echo "Unique IP addresses found in '$LOG_FILE':"
    echo "$IP_ADDRESSES"
fi
