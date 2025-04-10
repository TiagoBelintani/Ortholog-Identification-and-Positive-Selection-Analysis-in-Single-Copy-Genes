#!/bin/bash

# Output directory
output_dir="/home/you_dir"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Iterate over all FASTA files in the current directory
for fasta in *.fasta; do
    # Extract the prefix based on the sample name
    if [[ $fasta == mspinolai* ]]; then
        prefix="ms${fasta//[!0-9]/}"
    elif [[ $fasta == mgarjadoi* ]]; then
        prefix="mg${fasta//[!0-9]/}"
    elif [[ $fasta == mparapatrica* ]]; then
        prefix="mp${fasta//[!0-9]/}"
    else
        echo "File $fasta does not match any expected pattern"
        continue
    fi

    count=1
    output="$output_dir/$fasta"

    # Rewrite the FASTA with headers in the desired format
    awk -v prefix="$prefix" '
    /^>/ {
        print ">" prefix "@" count
        count++
        next
    }
    {
        print
    }' count=1 "$fasta" > "$output"

    echo "File processed: $fasta -> $output"
done
