#!/bin/bash
ROOT=$(pwd)

# Load external function to retrieve input data from a specified file
# shellcheck source=../tools/get-input.sh
. "${ROOT}/tools/get-input.sh"

# Function to solve Part 1 of Day 01
day01_part01() {
  local command=$1        # Store the first argument as a command input (expected: "run")
  local floor_position=74 # Default output value for floor position

  # Execute the solution if the command is "run"
  if [[ "$command" == "run" ]]; then
    # Retrieve floor data from the input file
    local floor_data=""
    floor_data=$(get_input "char" "./day01/input.txt")
    floor_position=0 # Initialize floor position counter to 0

    # Loop through each floor in the floor data string
    for floor in $floor_data; do
      # Increment or decrement the floor position based on character
      if [[ "$floor" == "(" ]]; then
        ((floor_position++)) # "(" represents going up a floor
      elif [[ $floor == ")" ]]; then
        ((floor_position--)) # ")" represents going down a floor
      fi

    done
  fi

  # Output the result for Part 1
  printf "Day 01, Part 01: %s\n" "${floor_position}"
}

# Function to solve Part 2 of Day 01
day01_part02() {
  local command=$1                   # Store the first argument as a command input (expected: "run")
  local current_floor=0              # Initialize a counter to track the current floor
  local first_basement_position=1795 # Default output if basement is never reached

  # Execute the solution if the command is "run"
  if [[ "$command" == "run" ]]; then
    # Retrieve floor data from the input file
    local floor_data=""
    floor_data=$(get_input "char" "./day01/input.txt")
    first_basement_position=0 # Initialize position counter

    # Loop through each character in the floor data string
    for floor in $floor_data; do
      ((first_basement_position++)) # Increment the character position

      # Track the current floor based on character
      if [[ "$floor" == "(" ]]; then
        ((current_floor++)) # "(" represents going up a floor
      elif [[ $floor == ")" ]]; then
        ((current_floor--)) # ")" represents going down a floor
      fi

      # Check if the current floor reaches -1 for the first time (i.e., basement)
      if [[ $current_floor -eq -1 ]]; then
        break # Exit the loop as we found the first basement position
      fi
    done
  fi

  # Output the result for Part 2
  printf "Day 01, Part 02: %s\n" "${first_basement_position}"
}
