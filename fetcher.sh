#!/bin/bash

# Check if file_url is provided as a command-line argument
if [ -z "$1" ]; then
  echo "Error: file_url argument is not provided."
  exit 1
fi

# URL of the file to download
file_url="$1"

# File name after downloading
file_name="downloaded_file"

# Download the file using curl
curl -o "$file_name" "$file_url"

# Base64 encode the file content saving it to a temp file
base64 "$file_name" > base64_content.txt

# Generate JSON data using jq with input from the file
json_data=$(jq -n --rawfile base64_content base64_content.txt \
            '{ "resourceType": "Parameters", "parameter": [ { "name": "npmContent", "valueBase64Binary": $base64_content }]}')


echo "$json_data" > parameters.json
