#!/bin/bash

CONDA_INIT_PATH="$1"
OUTPUT_DIR="$2/sra"
SRA_LIST_PATH="$3"
PARALLEL=$4

#matching parallel number to prefetch
if [[ $((PARALLEL)) -gt 8 ]]; then
    PARALLEL=8
fi

mkdir $OUTPUT_DIR

source $CONDA_INIT_PATH
conda activate bio

#export var and function
##############################
export OUTPUT_DIR
export PARALLEL

sra_download()
{
    prefetch --output-directory $OUTPUT_DIR "$1"
}

export -f sra_download
##############################

#sra download
#note:prefetch  --output-directory "$OUTPUT_DIR" --option-file $SRA_LIST_PATH
cat $SRA_LIST_PATH | xargs -P $PARALLEL -L 1 -I {} bash -c "sra_download {}"