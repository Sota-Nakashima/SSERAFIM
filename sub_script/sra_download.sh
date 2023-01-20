#!/bin/bash

#prepare for "conda activate" in shellscript
source ~/miniforge3/etc/profile.d/conda.sh
conda activate bio

OUTPUT_DIR="$1/sra"
mkdir $OUTPUT_DIR

#prefetch  --option-file $2