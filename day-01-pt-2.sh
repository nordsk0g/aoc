#! /usr/bin/env bash

# dial starts at 50
dial=50
filename='day-01-input.txt'
num_zeroes=0

while IFS=$'\r' read -r line; do
    direction=${line:0:1}
    distance=${line:1}

    case $direction in
	L)
	    ((dial-=distance))
	    while ((dial < 0)); do
		if ((-distance != dial)); then
		    {
			((num_zeroes++))
		    }
		fi
		((dial+=100))
	    done
	    if ((dial == 0)); then
		{
		    ((num_zeroes++))
		}
	    fi
	    ;;
	R)
	    ((dial+=distance))
	    while ((dial >= 100)); do
		((num_zeroes++))
		((dial-=100))
	    done
	    ;;
	*) exit 1 ;;
    esac
done < "$filename"

echo "The total number of zeroes found is: $num_zeroes"


