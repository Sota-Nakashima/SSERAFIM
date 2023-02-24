SSERAFIM
====
![Version](https://img.shields.io/badge/version-v0.3.1-blue)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/Sota-Nakashima/SSERAFIM/blob/ver0.3.2/LICENCE)
#  Overview
High-performance bioinfo tool.  
Easy analysis of gene expression.  

![img](https://github.com/Sota-Nakashima/SSERAFIM/blob/images/RNAseq.png)  

cited by https://bi.biopapyrus.jp/rnaseq/

## Description
This tool simplifies and automates the workflow of gene expression analysis.
It estimates the expression level of each gene based on the SRR list downloaded from [SRA](https://www.ncbi.nlm.nih.gov/sra), genome reference, and annotation data.
Although this tool only supports a single species, it can be used to analyze multiple species if it combinates with [AESPA](https://github.com/Sota-Nakashima/AESPA), which is being developed separately.  

## Demo

## Requirement
SSERAFIM works on conda, [conda-forge](https://github.com/conda-forge) and [bioconda](https://github.com/bioconda).
## Usage
```bash:usage.sh
sserafim [OPTION] [-s SRA_LIST_PATH] [-@ 10] [-g GENOME_REFERENCE_PATH] [-a GENOME_ANNOTATION_PATH]
```
```
Mandatory arguments
-s SRA_LIST_PATH    (.txt)                                         
-g REFERENCE_GENOME_PATH (.fasta/fasta.gz)                      
-a GENOME_ANNOTATION_PATH (.gtf or .gtf.gz) 

Default arguments
-o OUTPUT_DIR       Set output directory(default: ./SSERAFIM)
-c CONDA_INIT_PATH  If sserafim printed error "you have to check ...", please reset path.
                    "~/{YOUR CONDA PACKAGE}/etc/profile.d/conda.sh"
-@ PARALLEL (int)   Set using CPU core(default: 1)
-L LIGHT_MODE       Don't make law_data.tar.gz
-P PAIREND_OPTION   Change into pairend mode (default: single-end)
-f TRIM_OPTION      Change trimming software into fastp (default: fastp)
-h HELP             Show help                 
-V VERSION          Show version
```
## Install
1. create virtual environment in conda by using 
2. use docker (still getting ready)
## Acknowledgements
[Evolutionary Genetics Lab](http://www.biology.kyushu-u.ac.jp/~kteshima/), [Kyushu Univ.](https://www.kyushu-u.ac.jp/en/)
## Licence

[MIT](https://github.com/Sota-Nakashima/SSERAFIM/blob/main/LICENCE)

## Author

[Sota Nakashima](https://github.com/Sota-Nakashima)