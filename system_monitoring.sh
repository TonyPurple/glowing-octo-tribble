#!/bin/bash

# Check disk usage and alert if usage is above 90%
df -h | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print $1 " " $5}' | while read output; do
    USAGE=$(echo $output | awk '{print $2}' | sed 's/%//g')
    PARTITION=$(echo $output | awk '{print $1}')
    if [ $USAGE -gt 90 ]; then
        echo "WARNING: Partition $PARTITION usage is above 90%! Current usage: $USAGE%"
    fi
done

if [[ $? -eq 0 ]]; then
  echo "No partitions found with usage above 90%."
fi
