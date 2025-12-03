#!/usr/bin/env bash

accum=0
filename="day-02-input.txt"
#filename=sample-02.txt

input=$(< "$filename")

IFS=',' read -r -a ranges <<< "$input"

for range in "${ranges[@]}"; do
    [[ $range ]] || continue

    IFS='-' read -r low high <<< "$range"

    for (( c=$low; c<=$high; c++ ))
    do
	first=${c:0:${#c}/2}
	second=${c:${#c}/2}

	if (( ${#c} % 2 == 0 )) && [[ "$first" == "$second" ]]; then
	{
		accum=$((accum + c))
	}
	fi
    done
done

echo "Total is $accum"
