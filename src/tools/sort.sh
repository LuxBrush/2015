#!/bin/bash

# Function to sort a list of numbers in ascending order.
# Arguments:
#   Any number of numerical arguments (space-separated).
# Outputs:
#   The sorted numbers, one per line.
sort_numbers() {
  # Store the input arguments in a local array
  local numbers=("$@")

  # Use printf and sort to sort the numbers in ascending order
  printf "%s\n" "${numbers[@]}" | sort -n
}
