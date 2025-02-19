#!/bin/bash

set -euo pipefail

. ./day01/day01.sh
. ./day02/day02.sh
. ./day03/day03.sh

echo "AOC 2015:"
printf "%s\n" "$(day01_part01 "print")"
printf "%s\n" "$(day01_part02 "print")"
printf "%s\n" "$(day02_part01 "print")"
printf "%s\n" "$(day02_part02 "print")"
printf "%s\n" "$(day03_part01 "run")"
