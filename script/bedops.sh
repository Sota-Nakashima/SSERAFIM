#!/bin/bash

CONDA_INIT_PATH="$1"
OUTPUT_DIR="$2"
OUTPUT_DIR_BED="$2/result/bed"
SRA_LIST_PATH="$3"

source $CONDA_INIT_PATH

conda activate bio

mkdir $OUTPUT_DIR_BED

#change IFS and input sra quary
IFS=$'\n'
file=(`cat "$SRA_LIST_PATH"`)
#return IFS default
IFS=$' \t\n'

for line in "${file[@]}"; do
    gtf2bed < $OUTPUT_DIR/result/gtf/${line}.gtf > $OUTPUT_DIR_BED/${line}.bed
done
