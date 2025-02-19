#!/bin/bash
ROOT=$(pwd)

# Load external functions for reading input and finding minimum values
# shellcheck source=../tools/get_input.sh
. "${ROOT}/tools/get_input.sh"
# shellcheck source=../tools/min.sh
. "${ROOT}/tools/min.sh"
# shellcheck source=../tools/sort.sh
. "${ROOT}/tools/sort.sh"

# Function to solve Part 1 of Day 02
day02_part01() {
  local command=$1                # Store the first argument as a command input (expected: "run")
  local total_square_feet=1586300 # Default output value if not running calculations

  # Execute calculations if the command is "run"
  if [[ $command == "run" ]]; then
    total_square_feet=0 # Reset total square feet if running the calculation

    # Retrieve measurements from input file, one line at a time
    local measurements=""
    measurements=$(get_input "line" "./day02/input.txt")

    # Loop through each measurement in the list
    for measurement in $measurements; do
      # Split dimensions by 'x' and read into variables for length, width, and height
      IFS='x' read -r length width height <<<"$measurement"

      # Calculate the areas of the three sides
      local length_width_area=$((length * width))
      local width_height_area=$((width * height))
      local height_length_area=$((height * length))

      # Find the smallest side area to add as extra paper
      local smallest_side_area=""
      smallest_side_area=$(min $length_width_area $width_height_area $height_length_area)

      # Calculate required square feet for this box (2* each side + smallest side area)
      local square_feet=$((2 * length_width_area + 2 * width_height_area + 2 * height_length_area + smallest_side_area))

      # Add this box's square feet to the total
      ((total_square_feet += square_feet))
    done
  fi

  # Output the result for Part 1
  printf "Day 02, Part 01: %s\n" "${total_square_feet}"
}

# Function to solve Part 2 of Day 02
day02_part02() {
  local command=$1                # Store the first argument as a command input (expected: "run")
  local total_ribbon_feet=3737498 # Default output value if not running calculations

  # Execute calculations if the command is "run"
  if [[ $command == "run" ]]; then
    total_ribbon_feet=0
    # Retrieve box measurements from input file, one line at a time
    local measurements=""
    measurements=$(get_input "line" "./day02/input.txt")

    # Loop through each measurement in the list
    for measurement in $measurements; do
      # Split dimensions by 'x' and read into variables for length, width, and height
      IFS='x' read -r length width height <<<"$measurement"

      # Create an array with the dimensions and sort it to find the two smallest sides
      local dimensions=("$height" "$length" "$width")
      local sorted_dimensions=()
      mapfile -t sorted_dimensions < <(sort_numbers "${dimensions[@]}")
      local smallest_side=${sorted_dimensions[0]}
      local second_smallest_side=${sorted_dimensions[1]}

      # Calculate the ribbon needed to wrap around the smallest perimeter
      local ribbon_feet=$((2 * smallest_side + 2 * second_smallest_side))

      # Calculate the ribbon needed for the bow (volume of the box)
      local bow_feet=$((length * width * height))

      # Add the ribbon and bow lengths for this box
      local total_feet=$((ribbon_feet + bow_feet))

      # Add this box's total ribbon length to the total
      ((total_ribbon_feet += total_feet))
    done
  fi

  # Output the result for Part 2
  printf "Day 02, Part 02: %s\n" "$total_ribbon_feet"
}
