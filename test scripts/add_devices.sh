#!/bin/bash

# List of device names (you can modify this as needed)
device_names=("Brendan's Phone" "Owen's iPhone" "Quan's iPhone")

# Loop through each device name
for name in "${device_names[@]}"
do
  # Make a POST request using curl
  curl -X 'POST' \
    'http://localhost:8000/devices/' \
    -H 'accept: application/json' \
    -H 'Content-Type: application/json' \
    -d "{\"name\": \"$name\"}"

  sleep 1
done
