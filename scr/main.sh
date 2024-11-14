#!/bin/bash

set -euo pipefail

. ./day01/day01.sh
. ./day02/day02.sh

echo "AOC 2015:"
echo "$(day01-part01 "print")"
echo "$(day01-part02 "print")"
echo "$(day02-part01 "print")"
