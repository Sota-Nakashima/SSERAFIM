#!/bin/bash

CONDA_INIT_PATH="$1"
OUTPUT_DIR="$2"
OUTPUT_DIR_RESULT="$2/result"
SRA_LIST_PATH="$3"
GENOME_ANNOTATION_PATH="$4"
PARALLEL=$5

if [[ $((PARALLEL)) -lt 6 ]] ; then
    KWORKERS=1
else
    KWORKERS=$(($PARALLEL / 3))
    PARALLEL=$(($PARALLEL / $KWORKERS))
fi

mkdir $OUTPUT_DIR_RESULT

export CONDA_INIT_PATH
export OUTPUT_DIR
export OUTPUT_DIR_RESULT
export GENOME_ANNOTATION_PATH
export PARALLEL
export KWORKERS

stringtie_parallel()
{
    source $CONDA_INIT_PATH
    conda activate bio
    stringtie "$OUTPUT_DIR/bam/$1.bam" -e \
    -G "$GENOME_ANNOTATION_PATH" \
    -o "$OUTPUT_DIR_RESULT/gtf/$1.gtf" \
    -A "$OUTPUT_DIR_RESULT/tsv/$1.tsv" \
    -b "$OUTPUT_DIR_RESULT/Ballgown/$1" \
    -p "$PARALLEL"
}

export -f stringtie_parallel

cat $SRA_LIST_PATH | xargs -P $KWORKERS -L 1 -I {} bash -c "stringtie_parallel {}"