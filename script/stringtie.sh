#!/bin/bash

CONDA_INIT_PATH="$1"
OUTPUT_DIR="$2"
OUTPUT_DIR_RESULT="$2/result"
SRA_LIST_PATH="$3"
GENOME_ANNOTATION_PATH="$4"
PARALLEL=$5

source $CONDA_INIT_PATH
conda activate bio

mkdir $OUTPUT_DIR_RESULT

#change IFS and input sra quary
IFS=$'\n'
file=(`cat "$SRA_LIST_PATH"`)
#return IFS default
IFS=$' \t\n'

for line in "${file[@]}"; do
    stringtie "$OUTPUT_DIR/bam/${line}.bam" -e -m 30 \
    -G "$GENOME_ANNOTATION_PATH" \
    -o "$OUTPUT_DIR_RESULT/gtf/${line}.gtf" \
    -A "$OUTPUT_DIR_RESULT/tsv/${line}.tsv" \
    -b "$OUTPUT_DIR_RESULT/Ballgown" \
    -p "$PARALLEL"
done