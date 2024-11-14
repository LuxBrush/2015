#!/bin/bash

# Load external functions for reading input and finding minimum values
. ./tools/get-input.sh
. ./tools/min.sh

# Function to solve Part 1 of Day 02
day02-part01() {
	local command=$1                # Store the first argument as a command input (expected: "run")
	local total_square_feet=1586300 # Default output value if not running calculations

	# Execute calculations if the command is "run"
	if [[ $command == "run" ]]; then
		total_square_feet=0 # Reset total square feet if running the calculation

		# Retrieve measurements from input file, one line at a time
		local measurements=$(get-input "line" "./day02/input.txt")

		# Loop through each measurement in the list
		for measurement in $measurements; do
			# Split dimensions by 'x' and read into variables for length, width, and height
			IFS='x' read -r length width height <<<"$measurement"

			# Calculate the areas of the three sides
			local area_lw=$((length * width))
			local area_wh=$((width * height))
			local area_hl=$((height * length))

			# Find the smallest side area to add as extra paper
			local smallest_side_area=$(min $area_lw $area_wh $area_hl)

			# Calculate required square feet for this box (2* each side + smallest side area)
			local square_feet=$((2 * area_lw + 2 * area_wh + 2 * area_hl + smallest_side_area))

			# Add this box's square feet to the total
			((total_square_feet += square_feet))
		done
	fi

	# Output the result for Part 1
	printf "Day 02, Part 01: %s\n" "${total_square_feet}"
}
