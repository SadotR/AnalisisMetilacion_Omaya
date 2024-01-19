#!/bin/bash
# This script takes the first 10, 000 reads from fastq files, and saves it in a new fastq file. 

#my initials vars
DIR="$1"
NUM_LINES="40000"
DIR_FINAL="subset_reads"



if [ -d "$DIR_FINAL" ]; then
	echo "removing last $DIR_FINAL directory"
	rm -rf $DIR_FINAL
	#make dir
	echo "creating new dir"
	mkdir $DIR_FINAL 
fi

# my loop
for IN in $DIR/*_1.fq.gz; do
	IN2="${IN/_1/_2}"
	BASE_NAME_LIB1="${IN#raw_reads//}"
	BASE_NAME_LIB2="${IN2#raw_reads//}"
    BASE_NAME_L1="${BASE_NAME_LIB1%.fq.gz}"
    BASE_NAME_L2="${BASE_NAME_LIB2%.fq.gz}"
    echo "BASE BASE_NAME_LIB1 IS: $BASE_NAME_LIB1"
    echo "BASE_NAME_LIB2 IS:  $BASE_NAME_LIB2"
    echo processing "$BASE_NAME_L1 and $BASE_NAME_L2 files"
    zcat $IN | head -n $NUM_LINES > ${BASE_NAME_L1}_subset.fq
    zcat $IN2 | head -n $NUM_LINES > ${BASE_NAME_L2}_subset.fq 
   	gzip ${BASE_NAME_L1}_subset.fq
    gzip ${BASE_NAME_L2}_subset.fq
    mv ${BASE_NAME_L1}_subset.fq.gz $DIR_FINAL
    mv ${BASE_NAME_L2}_subset.fq.gz $DIR_FINAL
 done
