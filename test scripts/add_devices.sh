#!/bin/bash

# List of device names (you can modify this as needed)
device_names=("Brendon's Phone")

# Loop through each device name
for name in "${device_names[@]}"
do
  # Make a POST request using curl
  curl -X 'POST' \
    'http://localhost:8000/devices/' \
    -H 'accept: application/json' \
    -H 'Content-Type: application/json' \
    -d "{\"name\": \"$name\"}"

  # Optional: add a sleep delay between requests
  sleep 1
done
