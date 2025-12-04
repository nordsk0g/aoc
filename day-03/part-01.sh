#! /usr/bin/env bash

filename='input.txt'
#filename='sample.txt'
accum=0

while read -r line; do
    len=${#line}
    tens=(0 0)
    units=(0 0)
    for ((i=0;i<len;i++)); do
	curr=${line:i:1}
	if ((curr > tens[1] && i != len-1)); then
	    tens[0]=$i
	    tens[1]=$curr
	    units[0]=0
	    units[1]=0
	    echo "NEW TENS! <index: ${tens[0]}, value: ${tens[1]}>"
	fi

	if ((i > tens[0] && curr > units[1])); then
	    units[0]=$i
	    units[1]=$curr
	    echo "NEW UNITS! <index: ${units[0]}, value: ${units[1]}>"
	fi
    done

    accum=$((accum + ${tens[1]}${units[1]}))
done < "$filename"

echo "The total is $accum"
