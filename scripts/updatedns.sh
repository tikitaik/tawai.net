#!/bin/bash

export $(grep -v '^#' $HOME/Projects/tawai.net/.env | xargs)

# Full paths
CURL="/usr/bin/curl"
JQ="/usr/bin/jq"

# Actual value of the public IP
IP=$(curl -s ifconfig.me)

# Cloudflare API endpoint
CLOUDFLARE_API_ENDPOINT="https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$DNS_RECORD_ID"

# Get IP Listed in Cloudflare record
current_ip=$($CURL -s -X GET "$CLOUDFLARE_API_ENDPOINT" \
    -H "Authorization: Bearer $CLOUDFLARE_API_TOKEN" \
    -H "Content-Type: application/json" | $JQ -r '.result.content')

# Check if match with current IP
if [[ "$IP" == "$current_ip" ]]; then
    echo "No updated needed. IP address is unchanged: $IP"
else
    echo "IP address has changed from $current_ip to $IP. Updating record..."

    response=$($CURL -s -X PUT $CLOUDFLARE_API_ENDPOINT \
        -H "Authorization: Bearer $CLOUDFLARE_API_TOKEN" \
        -H "Content-Type: application/json" \
        --data '{
            "type": "'"$DNS_RECORD_TYPE"'",
            "name": "'"$DNS_RECORD_NAME"'",
            "content": "'"$IP"'",
            "ttl": 120,
            "proxied": false
        }')

    # Check if the update was successful
    if [[ $response == *"\"success\":true"* ]]; then
        echo "Successfully updated DNS record from $current_ip to $IP"
    else
        echo "Failed to update DNS record from $current_ip to $IP"
    fi
fi

