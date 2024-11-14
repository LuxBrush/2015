#!/bin/bash

. ./tools/get-input.sh
. ./tools/min.sh

day02-part01() {
	local output=1586300
	local input=$1

	if [[ $input == "run" ]]; then
		output=0
		local measurements=$(get-input "line" "./day02/input.txt")
		for m in $measurements; do
			IFS='x' read -r l w h <<<"$m"

			local side01=$((l * w))
			local side02=$((w * h))
			local side03=$((h * l))
			local small_side=$(min $side01 $side02 $side03)

			local square_feet=$((2 * side01 + 2 * side02 + 2 * side03 + small_side))

			((output += $square_feet))
		done
	fi

	printf "Day 02, Part 01: %s" "${output}"
}
