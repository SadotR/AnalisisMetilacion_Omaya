#!/bin/bash
# To review the quality of the sequences and any adapters that may still in the reads
# Run fastqc

# my initials vars

INDIR=$1
OUTDIR="FastQC_PreOv"
MULTIQC_OUTDIR="MultiQC"
LOGFILE="outdir.log"
PATH=$PATH:/LUSTRE/apps/bioinformatica/FastQC_v0.11.7/

#Processing fastqc

if [ \( -d "$INDIR" \) -a \( ! -z "$INDIR" \) ]; then
    mkdir $OUTDIR


export PATH=$PATH:/LUSTRE/apps/bioinformatica/FastQC_v0.11.7/

module load gcc-7.2.0

    for FRQ in $INDIR/*.gz; do
        fastqc $FRQ -o $OUTDIR -t 6 | tee $LOGFILE
    done

    #notice of processing completed
    echo "Processing completed in $OUTDIR..."

    # Run multiqc on the generated files
    echo "Running multiqc..."

    module load conda-2023

    multiqc $OUTDIR/*.zip -o $MULTIQC_OUTDIR --data-format tsv --export --title "Ovario 24 y 30"
    echo "MultiQC completed."

else
    echo "Invalid input directory."
fi
