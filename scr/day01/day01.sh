#!/bin/bash

part01() {
	local input=$1
	local output=0
	if [[ $input == "run" ]]; then
		output=1
	fi

	printf "Day 01, Part 01: %s\n" "${output}"
}
