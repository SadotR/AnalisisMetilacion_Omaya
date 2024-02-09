#!/bin/bash

#-----------------------Initials_vars----------------------------
INPUT_DIR=$1
OUTPUT_DIR="trimmed_fastq"

# Create the output directory
if [ -d "$OUTPUT_DIR" ]; then
    echo "Removing last $OUTPUT_DIR directory"
    rm -rf $OUTPUT_DIR
fi

# Make new directory
echo "Creating new dir: $OUTPUT_DIR"
mkdir $OUTPUT_DIR

# Conda Env activate 
conda activate RefGenome

# Loop through input files
for IN in $INPUT_DIR/*_1*.fq.gz; do
    # Generate the corresponding second file name dynamically
    IN2="${IN/_1/_2}"

    # Check if the corresponding second file exists before running trim_galore
    if [ -f "$IN2" ]; then
        # Run trim_galore with the paired files
        trim_galore --rrbs --paired $IN $IN2 --output_dir $OUTPUT_DIR 
    else
        echo "Error: Corresponding second file not found for $IN. Skipping."
    fi
done
