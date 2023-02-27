#!/bin/bash

CONDA_INIT_PATH="$1"
FILE_PATH="$2"
PALARREL=$3

source $CONDA_INIT_PATH
conda activate sserafim

a=$(file --mime "$FILE_PATH" | grep "charset=binary")
if [ -n "$a" ]; then 
    unpigz $FILE_PATH -p $PALARREL
    echo ${FILE_PATH%.gz}
else
    echo $FILE_PATH
fi
