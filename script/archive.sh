#/bin/bash

CONDA_INIT_PATH="$1"
OUTPUT_DIR="$2"
PALARREL=$3

mkdir "$OUTPUT_DIR/law_data"

mv $OUTPUT_DIR/bam $OUTPUT_DIR/fastaq $OUTPUT_DIR/fastaq_trim \
$OUTPUT_DIR/fastqc $OUTPUT_DIR/multiqc $OUTPUT_DIR/reference_genome \
$OUTPUT_DIR/sam $OUTPUT_DIR/sra \
-t $OUTPUT_DIR/law_data

source $CONDA_INIT_PATH
conda activate bio

zip -r -m $OUTPUT_DIR/law_data.zip $OUTPUT_DIR/law_data