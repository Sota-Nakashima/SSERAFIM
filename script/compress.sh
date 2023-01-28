#!/bin/bash

CONDA_INIT_PATH="$1"
FILE_PATH="$2"
PALARREL=$3

source $CONDA_INIT_PATH
conda activate bio

pigz $FILE_PATH -p $PALARREL
