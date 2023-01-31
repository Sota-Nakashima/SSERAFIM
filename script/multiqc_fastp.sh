#!/bin/bash

CONDA_INIT_PATH="$1"
OUTPUT_DIR="$2/multiqc"

source $CONDA_INIT_PATH
conda activate bio

mkdir $OUTPUT_DIR

multiqc $2/fastaq_trim/json -o $OUTPUT_DIR