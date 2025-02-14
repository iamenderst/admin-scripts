#!/bin/bash
# maclookup.sh - A simple MAC address lookup tool using macaddress.io API
if [ "$1" == "" ]; then
    echo "Usage: $0 <MAC Address>"
    echo "Example: $0 00:0a:95:9d:68:16"
    echo "Example: $0 00:0A:95:9D:68:16"
    echo "Example: $0 000a.959d.6816"
    exit 1
fi
echo
echo -ne $1 - `wget -qO- "https://api.macaddress.io/v1?apiKey=YOUR_API_KEY_HERE&output=vendor&search=$1"`
echo
echo
exit 0
