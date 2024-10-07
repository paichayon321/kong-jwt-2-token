#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <iss> <exp_in_minutes> <secret>"
    exit 1
fi

# Read arguments
iss="$1"
exp_in_minutes="$2"
secret="$3"

# Get the current time and add the expiration time (exp_in_minutes)
seconds=$(date -d "$exp_in_minutes minutes" +%s)

# Sample data for header
header='{"alg": "HS256", "typ": "JWT"}'
payload="{\"iss\":\"$iss\",\"exp\":$seconds}"

# Function to perform base64Url encoding
base64UrlEncode() {
    echo -n "$1" | openssl base64 -e | tr '+/' '-_' | tr -d '=' | tr -d '\n'
}

# Encode header and payload
encoded_header=$(base64UrlEncode "$header")
encoded_payload=$(base64UrlEncode "$payload")

# Concatenate encoded header and payload with a period
message="$encoded_header.$encoded_payload"

# Generate HMAC SHA256 signature and then encode it in base64Url format
signature=$(echo -n "$message" | openssl dgst -sha256 -hmac "$secret" -binary | openssl base64 | tr '+/' '-_' | tr -d '=' | tr -d '\n')

# Create the JWT
jwt_token="$message.$signature"

# Output the JWT
echo "JWT: $jwt_token"
