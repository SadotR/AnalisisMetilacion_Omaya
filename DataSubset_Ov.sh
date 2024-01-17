#!/bin/bash
#SBATCH -p cicese
#SBATCH --job-name=subset
#SBATCH --output=subset-%j.log
#SBATCH --error=subset-%j.err
#SBATCH -N 1
#SBATCH --ntasks-per-node=8
#SBATCH -t 6-00:00:00


#head -n 40000 ./Ov2/H30R2_X5_L3_1.fq.gz > ./Ov2/H30R2Subset_X5_L3_1.fq.gz
head -n 40000 ./Ov2/H30R2_X5_L3_2.fq.gz > ./Ov2/H30R2Subset_X5_L3_2.fq.gz
head -n 40000 ./Ov2/H30R2_X5_L1_1.fq.gz > ./Ov2/H30R2Subset_X5_L1_1.fq.gz
head -n 40000 ./Ov2/H30R2_X5_L1_2.fq.gz > ./Ov2/H30R2Subset_X5_L1_2.fq.gz
head -n 40000 ./Ov3/H30R3_X5_L1_1.fq.gz > ./Ov3/H30R3Subset_X5_L1_1.fq.gz
head -n 40000 ./Ov3/H30R3_X5_L1_2.fq.gz > ./Ov3/H30R3Subset_X5_L1_2.fq.gz
head -n 40000 ./Ov3/H30R3_X5_L3_1.fq.gz > ./Ov3/H30R3Subset_X5_L3_1.fq.gz
head -n 40000 ./Ov3/H30R3_X5_L3_2.fq.gz > ./Ov3/H30R3Subset_X5_L3_2.fq.gz
head -n 40000 ./Ov4/H24R1_X5_L3_1.fq.gz > ./Ov4/H24R1Subset_X5_L3_1.fq.gz
head -n 40000 ./Ov4/H24R1_X5_L3_2.fq.gz > ./Ov4/H24R1Subset_X5_L3_2.fq.gz
head -n 40000 ./Ov4/H24R1_HNX5_L1_1.fq.gz > ./Ov4/H24R1Subset_HNX5_L1_1.fq.gz
head -n 40000 ./Ov4/H24R1_HNX5_L1_2.fq.gz > ./Ov4/H24R1Subset_HNX5_L1_2.fq.gz
head -n 40000 ./Ov4/H24R1_HVX5_L1_1.fq.gz > ./Ov4/H24R1Subset_HVX5_L1_1.fq.gz
head -n 40000 ./Ov4/H24R1_HVX5_L1_2.fq.gz > ./Ov4/H24R1Subset_HVX5_L1_2.fq.gz
head -n 40000 ./Ov5/H24R2_X7_L2_1.fq.gz > ./Ov5/H24R2Subset_X7_L2_1.fq.g
head -n 40000 ./Ov5/H24R2_X7_L2_2.fq.gz > ./Ov5/H24R2Subset_X7_L2_2.fq.gz
head -n 40000 ./Ov5/H24R2_X7_L1_1.fq.gz > ./Ov5/H24R2Subset_X7_L1_1.fq.gz
head -n 40000 ./Ov5/H24R2_X7_L1_2.fq.gz > ./Ov5/H24R2Subset_X7_L1_2.fq.gz 
head -n 40000 ./Ov5/H24R2_X5_L4_1.fq.gz > ./Ov5/H24R2Subset_X5_L4_1.fq.gz
head -n 40000 ./Ov5/H24R2_X5_L4_2.fq.gz > ./Ov5/H24R2Subset_X5_L4_2.fq.gz
head -n 40000 ./Ov6/H24R3_X5_L1_1.fq.gz > ./Ov6/H24R3Subset_X5_L1_1.fq.gz
head -n 40000 ./Ov6/H24R3_X5_L1_2.fq.gz > ./Ov6/H24R3Subset_X5_L1_2.fq.gz
head -n 40000 ./Ov6/H24R3_X5_L3_1.fq.gz > ./Ov6/H24R3Subset_X5_L3_1.fq.gz
head -n 40000 ./Ov6/H24R3_X5_L3_2.fq.gz > ./Ov6/H24R3Subset_X5_L3_2.fq.gz
head -n 40000 ./Ov6/H24R3_X5_L2_1.fq.gz > ./Ov6/H24R3Subset_X5_L2_1.fq.gz
head -n 40000 ./Ov6/H24R3_X5_L2_2.fq.gz > ./Ov6/H24R3Subset_X5_L2_2.fq.gz

exit 0





















exit 0
