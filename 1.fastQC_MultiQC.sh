#!/bin/bash
#To review the quality of the sequences and any adapters that may still in the reads


export PATH=$PATH:/LUSTRE/apps/bioinformatica/FastQC_v0.11.7/:$PATH

#quality analysis of readings with FASTQC

module load gcc-7.2.0

fastqc /LUSTRE/bioinformatica_data/genomica_funcional/Sadot/RawData/Raw_Data/subset_reads/*.fq.gz -t 8 -o ../../FastQC_Pre/Ov

#FastQC file compilation in MultiQC

module load conda-2023

multiqc ../Ov/*.zip -o ./MultiQC --data-format tsv --export --title "Ovario 24 y 30"

 done

