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

#The getorf program must be available in the environment (installed via conda install -c bioconda emboss)

#The ./input directory must contain the renamed FASTA

#Output will be saved in ./orfs/ with names like ID_orfs.fasta
