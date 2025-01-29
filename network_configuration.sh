#!/bin/bash

# Display the system's IP address and ping Google's DNS server to check internet connectivity
IP_ADDRESS=$(hostname -I | awk '{print $1}')
echo "System IP Address: $IP_ADDRESS"
ping -c 4 8.8.8.8 > /dev/null
if [ $? -eq 0 ]; then
    echo "Internet connectivity is working."
else
    echo "Internet connectivity is down."
fi
nslookup google.com > /dev/null
if [ $? -eq 0 ]; then
    echo "DNS resolution is working."
else
    echo "DNS resolution is down."
fi
