#!/bin/bash

INDIR=$1
PATHGENOME=/home/sadotr/RRBS/Bismark/Bisulfite_Genome
OUTPUT_DIR="AlignmentFiles"

# Create the output directory
if [ -d "$OUTPUT_DIR" ]; then
    echo "Removing last $OUTPUT_DIR directory"
    rm -rf $OUTPUT_DIR
fi

# Loop through input files
for IN in $INDIR/*_1_subset_val_1*.fq.gz; do
    # Generate the corresponding second file name dynamically
    IN2=$(echo "$IN" | sed 's/_1_subset_val_1/_2_subset_val_2/')

    # Identify treatment type based on file name
    if [[ $IN == *"H24"* ]]; then
        TREATMENT="H24"
    elif [[ $IN == *"H30"* ]]; then
        TREATMENT="H30"
    else
        echo "Unknown treatment type for file $IN. Skipping..."
        continue
    fi

    # Check if the corresponding second file exists before running bismark
    if [ -f "$IN2" ]; then
        # Use the identified treatment type in the bismark command
        bismark --genome $PATHGENOME -1 $IN -2 $IN2 -n 1 -o $OUTPUT_DIR/$TREATMENT
    else
        echo "Second file $IN2 not found. Skipping..."
    fi
done
