#/bin/bash

CONDA_INIT_PATH="$1"
OUTPUT_DIR="$2"
PALARREL=$3
LIGHT_MODE=$4

mkdir "$OUTPUT_DIR/law_data"

#move law_data and result
mv  $OUTPUT_DIR/fastaq $OUTPUT_DIR/fastaq_trim \
$OUTPUT_DIR/fastqc $OUTPUT_DIR/reference_genome \
$OUTPUT_DIR/sam $OUTPUT_DIR/sra \
-t $OUTPUT_DIR/law_data

mv $OUTPUT_DIR/multiqc $OUTPUT_DIR/bam -t $OUTPUT_DIR/result

if [[ "$LIGHT_MODE" == "off" ]] ; then

    printf '\n%s\n\n' "LIGHT_MODE: off"
    source $CONDA_INIT_PATH
    conda activate bio

    cd $OUTPUT_DIR
    #archive
    tar -cvf law_data.tar law_data --remove-files
    #compress
    pigz law_data.tar -p "$PALARREL"

else
    printf '\n%s\n\n' "LIGHT_MODE: on"
    rm -rf $OUTPUT_DIR/law_data
    echo "remove law_data."
fi