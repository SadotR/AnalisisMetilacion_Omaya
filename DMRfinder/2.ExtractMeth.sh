#!/bin/bash

# Define input directories for control (H24) and experimental (H30) treatments
WORKDIR=$1
ALIGDIR_H24="AlignmentFiles/H24"
ALIGDIR_H30="AlignmentFiles/H30"

# Define output directories for control (H24) and experimental (H30) treatments
OUTPUT_DIR_H24="ExtractMeth/H24"
OUTPUT_DIR_H30="ExtractMeth/H30"

# Create the output directories
mkdir -p "$OUTPUT_DIR_H24"
mkdir -p "$OUTPUT_DIR_H30"

# Function to extract methylation counts for a given treatment directory
extract_methylation_counts() {
    local TREATMENT_DIR=$1
    local OUTPUT_DIR=$2

    # Loop through input files in the treatment directory
    for IN in "$TREATMENT_DIR"/*_val_1_bismark_bt2*.bam; do
        # Extract the first 10 characters of the filename (identifier)
        FILENAME=$(basename "$IN" | cut -c1-10)

        # Extract methylation counts and save output file with the identifier
        samtools view -h "$IN" | python extract_CpG_data.py -i - -o "$OUTPUT_DIR/$FILENAME.cov" -v
    done
}

# Extract methylation counts for control (H24) treatment
echo "Extracting methylation counts for H24 treatment..."
extract_methylation_counts "$ALIGDIR_H24" "$OUTPUT_DIR_H24"

# Extract methylation counts for experimental (H30) treatment
echo "Extracting methylation counts for H30 treatment..."
extract_methylation_counts "$ALIGDIR_H30" "$OUTPUT_DIR_H30"

echo "Extraction complete."
