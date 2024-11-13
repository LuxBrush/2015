#!/bin/bash

. ./tools/get-input.sh

day02-part01() {
  local output=0
  local input=$1

  if [[ $input == "run" ]]; then
    output=1
  fi

  printf "Day 02, Part 01: %s" "${output}"
}
