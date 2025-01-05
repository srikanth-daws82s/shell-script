#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 input_file"
    exit 1
fi

# Assign input file
input_file=$1

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' does not exist."
    exit 1
fi

# Find palindromic words
echo "Palindromic words in '$input_file':"
grep -oE '\w+' "$input_file" | awk '{
    word = $0
    rev_word = ""
    for (i = length(word); i > 0; i--) {
        rev_word = rev_word substr(word, i, 1)
    }
    if (tolower(word) == tolower(rev_word)) {
        print word
    }
}' | sort -u
