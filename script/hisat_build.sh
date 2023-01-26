#!/bin/bash

CONDA_INIT_PATH="$1"
REFERENCE_DIR="$2/reference_genome"
PARALLEL=$3
REFERENCE_GENOME_PATH=$4

source $CONDA_INIT_PATH
conda activate bio

mkdir $REFERENCE_DIR 

ln -s $REFERENCE_GENOME_PATH $REFERENCE_DIR/reference_alias

hisat2-build $REFERENCE_DIR/reference_alias $REFERENCE_DIR/gene_idx -p $PARALLEL