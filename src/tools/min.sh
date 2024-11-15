#!/bin/bash

# Function to find the minimum number from a list of arguments
min() {
	local min_value=$1 # Initialize min_value with the first argument
	local numbers="$@" # Store all arguments as a list of numbers

	# Iterate through each number in the list
	for num in $numbers; do
		# Update min_value if the current number is smaller
		if ((num < min_value)); then
			min_value="$num"
		fi
	done

	# Output the minimum value
	echo "$min_value"
}
