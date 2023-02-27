#!/bin/bash

CONDA_INIT_PATH="$1"
OUTPUT_DIR="$2/multiqc"

source $CONDA_INIT_PATH
conda activate sserafim

mkdir $OUTPUT_DIR

multiqc $2/fastqc -o $OUTPUT_DIR