#!/bin/bash

CONDA_INIT_PATH="$1"
OUTPUT_DIR="$2"
SRA_LIST_PATH="$3"
PARALLEL=$4
SCRIPT_DIR="$5"
RETRY_SRA_LIST_PATH="${SRA_LIST_PATH/SRR_list\//SRR_list/Retry_}"

source $CONDA_INIT_PATH
conda activate sserafim

#first prefetch
bash $SCRIPT_DIR/script/sra_download.sh $CONDA_INIT_PATH $OUTPUT_DIR $SRA_LIST_PATH $PARALLEL
# Execute the Python script and get the exit code
python -B $SCRIPT_DIR/script/check_retry_sra_download.py $OUTPUT_DIR $SRA_LIST_PATH

for i in {1..3}; do
    # If the exit code is 0 (success), exit the loop
    if [ $? -eq 0 ]; then
        break
    fi

    printf '\n%s\n\n' "Not match SRR List and downloaded SRR List. Retry downloading..."
    bash $SCRIPT_DIR/script/sra_download.sh $CONDA_INIT_PATH $OUTPUT_DIR $RETRY_SRA_LIST_PATH $PARALLEL

    # Execute the Python script and get the exit code
    python -B $SCRIPT_DIR/script/check_retry_sra_download.py $OUTPUT_DIR $SRA_LIST_PATH
done

if [ $? -ne 0 ]; then
    exit 1
fi