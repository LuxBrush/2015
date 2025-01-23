#!/bin/bash

# Function to read content from a file either as lines or individual characters,
# and store the content in an array for output.
get_input() {
  local mode=$1     # Mode to determine if reading by "line" or "char"
  local filename=$2 # File to read from
  local content=()  # Array to store lines or characters from the file

  # Check if both arguments are provided
  if [[ -z $mode || -z $filename ]]; then
    echo "Usage: get-input <line|char> <filename>"
    return 1
  fi

  # If mode is "line", read file line by line
  if [[ $mode == "line" ]]; then
    while read -r line; do
      content+=("$line") # Append each line to the array
    done <"$filename"    # Read from specified file
    # Output all lines as newline-separated items
    printf "%s\n" "${content[@]}"
  fi

  # If mode is "char", read file character by character
  if [[ $mode == "char" ]]; then
    while read -r -n1 char; do
      content+=("$char") # Append each character to the array
    done <"$filename"    # Read from specified file
    # Output all characters as a space-separated string
    echo "${content[@]}"
  fi
}
