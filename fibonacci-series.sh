#!/bin/bash

fibonacci() {
    local n=$1
    local a=0
    local b=1

    if ! [[ "$n" =~ ^[0-9]+$ ]] || [ "$n" -le 0 ]; then
        echo "Please provide a positive integer for the number of terms."
        exit 1
    fi

    # Handle the first two terms separately
    if (( n >= 1 )); then
        echo "$a"
    fi
    if (( n >= 2 )); then
        echo "$b"
    fi

    # Generate subsequent terms using a loop
    for (( i=2; i<n; i++ )); do
        local next=$((a + b))
        echo "$next"
        a=$b
        b=$next
    done
}

# Main part of the script
num_terms=$1

if [ -z "$num_terms" ]; then
    echo "Usage: $0 <number_of_terms>"
    exit 1
fi

fibonacci "$num_terms"

