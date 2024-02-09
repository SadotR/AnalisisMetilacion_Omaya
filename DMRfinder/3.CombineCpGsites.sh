#!/bin/bash

# Step 3: Cluster CpG sites into regions

# Define input directories for control (H24) and experimental (H30) treatments
WORKDIR=$1
ALIGDIR_H24="$WORKDIR/ExtractMeth/H24"
ALIGDIR_H30="$WORKDIR/ExtractMeth/H30"

# Define output directory
OUTPUT_DIR="combine_CpG_sites"

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Cluster CpG sites into regions
python combine_CpG_sites.py -v -o "$OUTPUT_DIR/combined.csv" "$ALIGDIR_H24"/*.cov "$ALIGDIR_H30"/*.cov

# Exit with status 0 to indicate successful completion
exit 0
