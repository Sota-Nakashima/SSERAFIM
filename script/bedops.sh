#!/bin/bash

CONDA_INIT_PATH="$1"
OUTPUT_DIR="$2"
OUTPUT_DIR_BED="$2/result/bed"
SRA_LIST_PATH="$3"
PARALLEL=$4

#matching parallel number to prefetch
if [[ $((PARALLEL)) -gt 10 ]]; then
    PARALLEL=10
fi

source $CONDA_INIT_PATH

conda activate bio

mkdir $OUTPUT_DIR_BED

export OUTPUT_DIR
export OUTPUT_DIR_BED
export PARALLEL

# if os error by memory leak, rewrite --max-mem option.
# https://www.biostars.org/p/95496/
make_bed_format()
{
    gtf2bed --max-mem 500M --sort-tmpdir=${OUTPUT_DIR_BED} \
    < $OUTPUT_DIR/result/gtf/$1.gtf > $OUTPUT_DIR_BED/$1.bed
}

export -f make_bed_format

cat $SRA_LIST_PATH | xargs -P $PARALLEL -L 1 -I {} bash -c "make_bed_format {}"