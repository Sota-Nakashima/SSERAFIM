#!/bin/bash

CONDA_INIT_PATH="$1"
OUTPUT_DIR="$2/fastaq"
SRA_DIR="$2/sra/*"
PARALLEL=$3

source $CONDA_INIT_PATH
conda activate bio

mkdir $OUTPUT_DIR

#convert sra to fastaq (-e options mean multithlead)
for filepath in $SRA_DIR; do
    fasterq-dump -p -e "$PARALLEL" $filepath -O "$OUTPUT_DIR"
done

pigz -r "$OUTPUT_DIR" -p "$PARALLEL"