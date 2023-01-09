#!/bin/bash

# Check if a file was provided as an argument
if [ -z "$1" ]; then
  echo "Error: No file provided."
  exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
  echo "Error: File does not exist."
  exit 1
fi

# Create an empty output file
output_file="output.txt"
echo "" > "$output_file"

# Loop through each domain in the input file
while read -r domain; do
  # Get the IP address for the domain
  ip_address=$(dig +short "$domain")

  # Append the IP address to the output file
  echo "$ip_address" >> "$output_file"
done < "$1"
