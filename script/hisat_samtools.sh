#!/bin/bash

CONDA_INIT_PATH="$1"
REFERENCE_DIR="$2/reference_genome"
OUTPUT_DIR="$2"
OUTPUT_DIR_SAM="$2/sam"
OUTPUT_DIR_BAM="$2/bam"
PARALLEL=$3
SRA_LIST_PATH=$4

mkdir $OUTPUT_DIR_SAM $OUTPUT_DIR_BAM

#change IFS and input sra quary
IFS=$'\n'
file=(`cat "$SRA_LIST_PATH"`)
#return IFS default
IFS=$' \t\n'

source $CONDA_INIT_PATH
conda activate bio

for line in "${file[@]}"; do
    hisat2 -x $REFERENCE_DIR/gene_idx \
    -U "$OUTPUT_DIR/fastaq_trim/${line}_trimmed.fq.gz" \
    -p "$PARALLEL" \
    -S "$OUTPUT_DIR_SAM/${line}.sam"
    samtools sort "$OUTPUT_DIR_SAM/${line}.sam" \
    -@ "$PARALLEL" \
    -O bam \
    -o "$OUTPUT_DIR_BAM/${line}.bam"
    samtools index "$OUTPUT_DIR_BAM/${line}.bam" \
    -@ "$PARALLEL"
done
