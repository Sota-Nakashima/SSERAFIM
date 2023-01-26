#!/bin/bash

CONDA_INIT_PATH="$1"
OUTPUT_DIR="$2/sra"
SRA_LIST_PATH="$3"

mkdir $OUTPUT_DIR

source $CONDA_INIT_PATH
conda activate bio

#sra download
prefetch  --output-directory "$OUTPUT_DIR" --option-file $SRA_LIST_PATH