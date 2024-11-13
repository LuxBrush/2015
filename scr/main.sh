#!/bin/bash

set -euo pipefail

source ./day01/day01.sh
. ./day02/day02.sh

echo "AOC 2015:"
echo "$(part01 "print")"
echo "$(part02 "print")"
echo "$(day02-part01 "run")"
