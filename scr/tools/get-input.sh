#!/bin/bash

get-input() {
  local output=()
  while read -n1 flor; do
    output+=("$flor")
  done <$1
  echo "${output[@]}"
}
