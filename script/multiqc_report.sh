#!/bin/bash

CONDA_INIT_PATH="$1"
OUTPUT_DIR="$2"
SCRIPT_DIR="$3"
REPORT_PATH="$OUTPUT_DIR/multiqc/multiqc_data/multiqc_fastqc.txt"

source $CONDA_INIT_PATH
conda activate bio


python -B $SCRIPT_DIR/script/multiqc_report.py $OUTPUT_DIR $REPORT_PATH