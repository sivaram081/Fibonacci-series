#!/bin/bash

# Function to generate Fibonacci series
fibonacci() {
    local n=$1 # Number of terms to generate
    local a=0  # First Fibonacci number
    local b=1  # Second Fibonacci number

    # Input validation
    if (( n < 1 )); then
        echo "Please provide a positive integer for the number of terms."
        return 1
    fi

    echo "Fibonacci Series up to $n terms:"

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
read -p "Enter the number of Fibonacci terms to generate: " num_terms

# Call the fibonacci function with user input
fibonacci "$num_terms"
