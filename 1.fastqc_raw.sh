#!/bin/bash
############################################################
#RUN FASTQC

INDIR=$1
OUTDIR="FastQC_embryo_trim"
LOGFILE="outdir.log"


if [ \( -d "$INDIR" \) -a \( ! -z "$INDIR" \) ]; then

        mkdir $OUTDIR

        for FRQ in $INDIR/*.gz; do

        fastqc $FRQ -o $OUTDIR -t 3 | tee $LOGFILE

        done

else
