#!/bin/bash

CONDA_INIT_PATH="$1"
OUTPUT_DIR="$2/fastaq_trim"
FASTAQ_DIR="$2/fastaq/*"
PARALLEL=$3

#matching parallel number to trim_galore
if [[ $((PARALLEL)) -gt 5 ]]; then
    PARALLEL=5
fi

source $CONDA_INIT_PATH
conda activate sserafim

mkdir $OUTPUT_DIR

#trimming and checking the quality RNA-seq data by using trim_galore
files="$FASTAQ_DIR"
for filepath in $FASTAQ_DIR; do
    trim_galore -j "$PARALLEL" $filepath -o "$OUTPUT_DIR"
done

mkdir "$OUTPUT_DIR/report"

mv $OUTPUT_DIR/*.txt $OUTPUT_DIR/report