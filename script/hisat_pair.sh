#!/bin/bash

CONDA_INIT_PATH="$1"
REFERENCE_DIR="$2/reference_genome"
OUTPUT_DIR="$2"
OUTPUT_DIR_SAM="$2/sam"
PARALLEL=$3
REFERENCE_GENOME_PATH=$4
SRA_LIST_PATH=$5

source $CONDA_INIT_PATH
conda activate bio

mkdir $REFERENCE_DIR $OUTPUT_DIR_SAM

ln -s $REFERENCE_GENOME_PATH $REFERENCE_DIR/reference_alias

hisat2-build $REFERENCE_DIR/reference_alias $REFERENCE_DIR/gene_idx -p $PARALLEL

#change IFS and input sra quary
IFS=$'\n'
file=(`cat "$SRA_LIST_PATH"`)
#return IFS default
IFS=$' \t\n'

for line in "${file[@]}"; do
    hisat2 -x $REFERENCE_DIR/gene_idx \
    -1 $OUTPUT_DIR/fastaq_trim/${line}_1_trimmed.fq.gz \
    -2 $OUTPUT_DIR/fastaq_trim/${line}_2_trimmed.fq.gz \
    -p "$PARALLEL" \
    -S "$OUTPUT_DIR_SAM/${line}.sam" \
    --dta --rna-strandness FR
done