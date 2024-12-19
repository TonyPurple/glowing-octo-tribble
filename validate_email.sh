#!/bin/bash

# Email Validation Script Using Enhanced Bash Built-in Regex

# Function to display usage instructions
usage() {
    echo "Usage: $0 <email_address>"
    exit 1
}

# Check if exactly one argument is provided
if [ $# -ne 1 ]; then
    echo "Error: No email address provided."
    usage
fi

EMAIL="$1"

EMAIL_REGEX='^[A-Za-z0-9]+([._%+-][A-Za-z0-9]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*\.[A-Za-z]{2,}$'

# Perform regex matching using Bash's built-in capabilities
if [[ "$EMAIL" =~ $EMAIL_REGEX ]]; then
    echo "The email address '$EMAIL' has a valid format."
    exit 0
else
    echo "The email address '$EMAIL' does not have a valid format."
    exit 1
fi


