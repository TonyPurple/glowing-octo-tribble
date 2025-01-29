#!/bin/bash

# Create a backup directory and copy all .log files into it (run script with sudo)
BACKUP_DIR="/var/log/backup"
mkdir -p $BACKUP_DIR
if ls /var/log/*.log > /dev/null 2>&1; then
    cp /var/log/*.log $BACKUP_DIR
    echo "Log files have been backed up to $BACKUP_DIR."
else
    echo "No .log files found in /var/log/."
fi
