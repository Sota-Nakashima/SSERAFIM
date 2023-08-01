#!/bin/bash

CONDA_INIT_PATH="$1"
OUTPUT_DIR="$2/sra"
SRA_LIST_PATH="$3"
PARALLEL=$4

#matching parallel number to prefetch
if [[ $((PARALLEL)) -gt 10 ]]; then
    PARALLEL=10
fi

mkdir -p $OUTPUT_DIR

#export var and function
##############################
export CONDA_INIT_PATH
export OUTPUT_DIR
export PARALLEL

sra_download()
{
    source $CONDA_INIT_PATH
    conda activate sserafim
    prefetch --output-directory $OUTPUT_DIR "$1"
}

export -f sra_download
##############################

#sra download
#note:prefetch  --output-directory "$OUTPUT_DIR" --option-file $SRA_LIST_PATH
cat $SRA_LIST_PATH | xargs -P $PARALLEL -L 1 -I {} bash -c "sra_download {}"