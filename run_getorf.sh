#!/bin/bash

# Input and output directories
input_dir="./input"
output_dir="./orfs"

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Loop through all FASTA files in the input directory
for fasta in "$input_dir"/*.fa; do
    # Get sample name without path
    sample_name=$(basename "$fa" .fa)

    # Run getorf (minimum 150 amino acids = 450 bp)
    getorf -sequence "$fasta" \
           -outseq "$output_dir/${sample_name}_orfs.fa" \
           -minsize 450 \
           -find 1 \
           -auto

    echo "ORFs extracted for $sample_name"
done
