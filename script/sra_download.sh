#!/bin/bash

CONDA_INIT_PATH="$1"
OUTPUT_DIR="$2/sra"
SRA_LIST_PATH="$3"
PARALLEL=$4

#matching parallel number to prefetch
if [[ $((PARALLEL)) -gt 5 ]]; then
    PARALLEL=5
fi

mkdir $OUTPUT_DIR

source $CONDA_INIT_PATH
conda activate bio

#sra download
#prefetch  --output-directory "$OUTPUT_DIR" --option-file $SRA_LIST_PATH

#parallel
sort -u $SRA_LIST_PATH | parallel -j "$PARALLEL" "prefetch --output-directory $OUTPUT_DIR {}"