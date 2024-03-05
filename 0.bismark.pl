#!/bin/bash

#script to run bismark mapping 
#my input vars
CORES="50"
GENOME_FOLDER_PATH="${PWD}"
#DIR_WHERE_LIBS="$1"
CONVERTED_GENOME_PATH="${PWD}"

#first step, creating bam files for each paired library
for LIBS in $GENOME_FOLDER_PATH/*_1*.fq.gz; do
        REV="${LIBS//_1/_2}"
        LIBS="${LIBS#$GENOME_FOLDER_PATH/}"
        REV="${REV#$GENOME_FOLDER_PATH/}"
        echo "files used for -1 and -2 are $LIBS and $REV"
        bismark --multicore $CORES $CONVERTED_GENOME_PATH -1 $LIBS -2 $REV
        #getting cov file from previosly generated bam file
        BASE_NAME_LIBS="${LIBS#$GENOME_FOLDER_PATH/}"
        BASE_NAME_L1="${BASE_NAME_LIBS%.fq.gz}"
        echo "the base name of the bam file is: $BASE_NAME_L1"
        bismark_methylation_extractor --scaffolds --multicore $CORES --bedGraph ${BASE_NAME_L1}_bismark_bt2_pe.bam
        rm ${BASE_NAME_L1}_bismark_bt2_pe.bam
        mv *.cov.gz cov_files_supp
        mv *_report.txt bt2_files
        rm *bt2*
done
