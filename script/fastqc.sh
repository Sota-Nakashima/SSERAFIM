#!/bin/bash

CONDA_INIT_PATH="$1"
OUTPUT_DIR="$2/fastqc"
FASTAQ_DIR="$2/fastaq_trim/*.fq.gz"
PARALLEL=$3

source $CONDA_INIT_PATH
conda activate bio

mkdir $OUTPUT_DIR

for filepath in $FASTAQ_DIR; do
    fastqc -o "$OUTPUT_DIR"  -t "$PARALLEL" $filepath
done