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

part02() {
  local input=$1
  local count=0
  local output=1795

  if [[ $input == "run" ]]; then
    output=0
    local floors=$(get-input "./day01/input.txt")
    for floor in $floors; do
      ((output++))
      if [[ $count -ne -1 ]]; then
        if [[ $floor == "(" ]]; then
          ((count++))
        else
          ((count--))
        fi
      fi

      # Break when count first equals -1
      if [[ $count -eq -1 ]]; then
        break
      fi
    done
  fi

  printf "Day 01, Part 02: %s\n" "${output}"
}
