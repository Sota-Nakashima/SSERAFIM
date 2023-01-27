#!/bin/bash

CONDA_INIT_PATH="$1"
FILE_PATH="$2"
PALARREL=$3

source $CONDA_INIT_PATH
conda activate bio

a=$(file --mime "$FILE_PATH" | grep "charset=binary")
if [ -n "$a" ]; then 
    unpigz $FILE_PATH -p $PALARREL
else
    pigz $FILE_PATH -p $PALARREL
fi


