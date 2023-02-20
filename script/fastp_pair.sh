#!/bin/bash

CONDA_INIT_PATH="$1"
OUTPUT_DIR="$2"
OUTPUT_DIR_TRIM_FASTQ="$2/fastaq_trim"
OUTPUT_DIR_HTML="$2/fastaq_trim/html"
OUTPUT_DIR_JSON="$2/fastaq_trim/json"
SRA_LIST_PATH="$3"
PARALLEL=$4

source $CONDA_INIT_PATH
conda activate bio

mkdir $OUTPUT_DIR_TRIM_FASTQ $OUTPUT_DIR_HTML $OUTPUT_DIR_JSON

#matching parallel number to fastp
if [[ $((PARALLEL)) -gt 16 ]] ; then
    PARALLEL=16
fi

#change IFS and input sra quary
IFS=$'\n'
file=(`cat "$SRA_LIST_PATH"`)
#return IFS default
IFS=$' \t\n'

for line in "${file[@]}"; do
    fastp  \
    -i "$OUTPUT_DIR/fastaq/${line}_1.fastq.gz" \
    -I "$OUTPUT_DIR/fastaq/${line}_1.fastq.gz" \
    -o "$OUTPUT_DIR_TRIM_FASTQ/${line}_1_trimmed.fq.gz" \
    -O "$OUTPUT_DIR_TRIM_FASTQ/${line}_2_trimmed.fq.gz" \
    -h "$OUTPUT_DIR_HTML/${line}.html" \
    -j "$OUTPUT_DIR_JSON/${line}fastp.json" \
    -w "$PARALLEL"
done