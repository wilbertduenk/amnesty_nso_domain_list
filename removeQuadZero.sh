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

# Create a temporary file to store the output
temp_file=$(mktemp)

# Read the input file line by line
while read -r line; do
  # Check if the line contains "0.0.0.0"
  if [[ ! "$line" =~ "0.0.0.0" ]]; then
    # If it does not, write the line to the temp file
    echo "$line" >> "$temp_file"
  fi
done < "$1"

# Overwrite the input file with the temp file
mv "$temp_file" "$1"
