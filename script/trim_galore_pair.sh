#!/bin/bash

CONDA_INIT_PATH="$1"
OUTPUT_DIR="$2/fastaq_trim"
FASTAQ_DIR="$2/fastaq"
PARALLEL=$3
SRA_LIST_PATH=$4

#matching parallel number to trim_galore
if [[ $((PARALLEL)) -gt 8 ]]; then
    PARALLEL=8
fi

source $CONDA_INIT_PATH
conda activate sserafim

#change IFS and input sra quary
IFS=$'\n'
file=(`cat "$SRA_LIST_PATH"`)
#return IFS default
IFS=$' \t\n'

mkdir $OUTPUT_DIR

for line in "${file[@]}"; do
    trim_galore --paired  \
    $FASTAQ_DIR/${line}_1.fastq.gz \
    $FASTAQ_DIR/${line}_2.fastq.gz \
    -o $OUTPUT_DIR -j "$PARALLEL"
done

rename val_1 trimmed $OUTPUT_DIR/*.fq.gz
rename val_2 trimmed $OUTPUT_DIR/*.fq.gz

mkdir "$OUTPUT_DIR/report"

mv $OUTPUT_DIR/*.txt $OUTPUT_DIR/report