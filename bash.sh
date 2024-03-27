#!/bin/bash

# Initialize the display
display=""

# Function to clear the display
clear_display() {
    display=""
}

# Function to handle invalid input
handle_syntax_error() {
    echo "SYNTAX ERROR"
    clear_display
}

# Function to handle division by zero
handle_math_error() {
    echo "MATH ERROR"
    clear_display
}

# Main loop
while true; do
    # Read user input
    read -p ">> " input

    # Check for EXIT command
    if [[ "$input" == "EXIT" ]]; then
        break
    fi

    # Evaluate the input
    result=$(echo "$input" | bc -l 2>/dev/null)

    # Check for valid result
    if [[ $? -eq 0 ]]; then
        # Round non-integer results to 2 decimal places
        result=$(printf "%.2f" "$result")
        echo "$result"
        clear_display
    else
        # Handle invalid input
        if [[ "$input" == *"/"* ]]; then
            handle_math_error
        else
            handle_syntax_error
        fi
    fi
done
