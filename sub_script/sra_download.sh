#!/bin/bash

#prepare for "conda activate" in shellscript
source ~/miniforge3/etc/profile.d/conda.sh
conda activate bio

echo "$1"