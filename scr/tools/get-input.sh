#!/bin/bash

# Function to read characters from a file, one by one, into an array
get-input() {
  local characters=() # Array to store individual characters from the file

  # Read each character from the specified file, one at a time
  while read -n1 char; do
    characters+=("$char") # Append each character to the array
  done <"$1"              # Read from the file provided as the first argument

  # Output all characters as a single space-separated string
  echo "${characters[@]}"
}
