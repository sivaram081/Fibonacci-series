#!/bin/bash

# Test script for fibonacci_series.sh
# Author: <your_name>
# Purpose: Automated testing of Fibonacci script for Jenkins pipeline

FIB_SCRIPT="./fibonacci_series.sh"
PASS_COUNT=0
FAIL_COUNT=0

# Function to run a single test
run_test() {
    local input=$1
    local expected_output=$2
    local test_name=$3

    echo "Running test: $test_name"
    
    # Run the fibonacci script non-interactively (using printf for input)
    actual_output=$(printf "%s\n" "$input" | bash "$FIB_SCRIPT" | grep -v "Enter the number")
    
    # Extract just the Fibonacci numbers (ignore first line with label)
    actual_numbers=$(echo "$actual_output" | grep -E '^[0-9]+$')

    if [[ "$actual_numbers" == "$expected_output" ]]; then
        echo "✅ PASS: $test_name"
        ((PASS_COUNT++))
    else
        echo "❌ FAIL: $test_name"
        echo "Expected:"
        echo "$expected_output"
        echo "Got:"
        echo "$actual_numbers"
        ((FAIL_COUNT++))
    fi
    echo "--------------------------------------"
}

# === Test cases ===

# 1. Test for 1 term
run_test 1 "0" "Single term (n=1)"

# 2. Test for 5 terms
run_test 5 $'0\n1\n1\n2\n3' "Five terms (n=5)"

# 3. Test for 10 terms
run_test 10 $'0\n1\n1\n2\n3\n5\n8\n13\n21\n34' "Ten terms (n=10)"

# 4. Test for invalid input (0)
run_test 0 "Please provide a positive integer for the number of terms." "Invalid input (n=0)"

# Summary
echo "======================================"
echo "Tests Passed: $PASS_COUNT"
echo "Tests Failed: $FAIL_COUNT"
echo "======================================"

# Exit with failure if any tests failed
if (( FAIL_COUNT > 0 )); then
    exit 1
else
    exit 0
fi

