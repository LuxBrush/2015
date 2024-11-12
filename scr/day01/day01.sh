#!/bin/bash

. "./tools/get-input.sh"

part01() {
  local input=$1
  local output=74
  if [[ "$input" == "run" ]]; then
    local floors=$(get-input "./day01/input.txt")
    ((output = 0))

    for floor in $floors; do
      if [[ "$floor" == "(" ]]; then
        ((output++))
      else
        ((output--))
      fi
    done
  fi

  printf "Day 01, Part 01: %s\n" "${output}"
}
