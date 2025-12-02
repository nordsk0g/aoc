#! /usr/bin/env bash

# dial starts at 50
dial=50
filename='day-01-input.txt'
#filename='test-01.txt'
num_zeroes=0

process() {
    local line=$1
    local direction=${line:0:1}
    local distance=${line:1}

    case $direction in
	L) ((dial-=distance)) ;;
	R) ((dial+=distance)) ;;
	*) echo "Invalid direction: $direction" >&2 ;;
    esac

    ((dial = (dial % 100 + 100) % 100 ))
}

while IFS=$'\r' read -r p; do
    [[ $p ]] || continue

    process "$p"

    (( dial == 0 )) && ((num_zeroes++))
done < "$filename"

echo "The total number of zeroes found is: $num_zeroes"


