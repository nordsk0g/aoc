#! /usr/bin/env bash

accum=0
filename="input.txt"
#filename="sample.txt"

input=$(< "$filename")

IFS=',' read -r -a ranges <<< "$input"

for range in "${ranges[@]}"; do
    [[ $range ]] || continue

    IFS='-' read -r low high <<< "$range"

    for (( num=low; num<=high; num++ )); do 
        len=${#num}

        for (( amount=1; amount<=len/2; amount++ )); do 
            if ((len % amount != 0)); then
                continue
            fi

            reps=$((len / amount)) 
            
            substr=${num:0:amount}
            newstr=''

            for ((i=0; i<reps; i++)); do
                newstr+=$substr
            done

            if ((newstr == num)); then
		echo "HIT! on $num (substring length: $amount, repetitions: $reps)"
                accum=$((accum + num))
		break
            fi
            
        done
    done
done

echo "Total is $accum"
