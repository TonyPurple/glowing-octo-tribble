#!/bin/bash

# parser.sh
# Script to parse Apache access logs and extract specific fields.

# Define the log line regex pattern (POSIX-compliant for BASH)
LOG_LINE_REGEX='^([0-9]{1,3}(\.[0-9]{1,3}){3})[[:space:]].*\[([^]]+)\][[:space:]]"([A-Z]+)[[:space:]]([[:alnum:]\/\.\-]+)[[:space:]]+([[:alnum:]\/\.\-]+)"[[:space:]]([0-9]{3})[[:space:]]([0-9]+).*'

# Read from stdin line by line
while read -r line; do
    # Debug: Show the line being processed
    echo "Processing line: $line" >&2
    if [[ $line =~ $LOG_LINE_REGEX ]]; then
        # Extract captured groups
        IP="${BASH_REMATCH[1]}"
        TIMESTAMP="${BASH_REMATCH[3]}"
        VERB="${BASH_REMATCH[4]}"
        PATH="${BASH_REMATCH[5]}"
        PROTOCOL="${BASH_REMATCH[6]}"
        STATUS_CODE="${BASH_REMATCH[7]}"
        RESPONSE_SIZE="${BASH_REMATCH[8]}"

        # Output in a dictionary-like format
        echo "{'IP': '$IP', 'timestamp': '$TIMESTAMP', 'verb': '$VERB', 'path': '$PATH', 'protocol': '$PROTOCOL', 'status_code': '$STATUS_CODE', 'response_size': '$RESPONSE_SIZE'}"
    else
        # Inform about unmatched lines
        echo "No match found for line: $line" >&2
    fi
done






