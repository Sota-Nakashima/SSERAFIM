#/bin/bash

CONDA_INIT_PATH="$1"
OUTPUT_DIR="$2"
PALARREL=$3

mkdir "$OUTPUT_DIR/law_data"

mv $OUTPUT_DIR/bam $OUTPUT_DIR/fastaq $OUTPUT_DIR/fastaq_trim \
$OUTPUT_DIR/fastqc $OUTPUT_DIR/reference_genome \
$OUTPUT_DIR/sam $OUTPUT_DIR/sra \
-t $OUTPUT_DIR/law_data

mv $OUTPUT_DIR/multiqc -t $OUTPUT_DIR/result

source $CONDA_INIT_PATH
conda activate bio

cd $OUTPUT_DIR

tar -cvf law_data.tar law_data --remove-files

pigz law_data.tar -p "$PALARREL"