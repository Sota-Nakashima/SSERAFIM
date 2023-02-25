SSERAFIM
====
[![Version](https://img.shields.io/badge/stable-main-gree)](https://github.com/Sota-Nakashima/SSERAFIM)
[![Version](https://img.shields.io/badge/OS-Linux-gree)](https://github.com/Sota-Nakashima/SSERAFIM)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/Sota-Nakashima/SSERAFIM/blob/main/LICENCE)
#  Overview
High-performance bioinfo tool.  
Easy analysis of gene expression.  

![img](https://github.com/Sota-Nakashima/SSERAFIM/blob/images/RNAseq.png)  

cited by https://bi.biopapyrus.jp/rnaseq/

## Description
This tool simplifies and automates the workflow of gene expression analysis.
It estimates the expression level of each gene based on the SRR-List downloaded from [SRA](https://www.ncbi.nlm.nih.gov/sra), reference genome, and annotation data.
Although this tool only supports a single species, it can be used to analyze multiple species if it combinates with [AESPA](https://github.com/Sota-Nakashima/AESPA), which is being developed separately.  

## Demo
1. Prepare SRR-List, Reference Genome, and Annotation Data  
   - SRR List can be download from [SRA Run Selector](https://0-www-ncbi-nlm-nih-gov.brum.beds.ac.uk/Traces/study/)  
   - Reference Genome can be download from [Ensemble](http://asia.ensembl.org/index.html)  
   - Annotation Data can be download from [Ensemble](http://asia.ensembl.org/index.html)

   Of course, you can use the file format from other sites as long as the file formats match. However, please make sure that the chromosome information match between the Reference Genome and the Annotation Data.

2. Run SSERAFIM
   ```bash:usage.sh
   sserafim -t ~/SSR_List.txt -g ~/Homo_sapiens.GRCh38.dna.toplevel.fa.gz　-a ~/Homo_sapiens.GRCh38.109.gtf.gz -@ 20
   ```
## Requirement
SSERAFIM works on conda, [conda-forge](https://github.com/conda-forge) and [bioconda](https://github.com/bioconda).  

SSERAFIM strongly depends mainly on the following libraries.  
* [sra-tools](https://github.com/ncbi/sra-tools)
* [fastp](https://github.com/OpenGene/fastp)
* [TrimGalore](https://github.com/FelixKrueger/TrimGalore)
* [FastQC](https://github.com/s-andrews/FastQC)
* [MultiQC](https://github.com/ewels/MultiQC)
* [hisat2](https://github.com/DaehwanKimLab/hisat2)
* [samtools](https://github.com/samtools/samtools)
* [stringtie](https://github.com/gpertea/stringtie)
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

## Output
```
OUTPUT_DIR
│
├─── result
│       ├─── ballgrown
│       ├─── bam
│       ├─── gff
│       ├─── multiqc
│       └─── tsv
├─── (caution_report_multiqc.tsv)
├─── report.log
└─── law_data.tar.gz 
```
* Size of law_data.tar.gz is very large. Please warn when decompressing.
* If fasta file quality is not good, sserafim output "caution_report_multiqc.tsv".Please check when you analyze results.
## Install
1. create virtual environment in conda by using 
2. use docker (still getting ready)

## Benchmark
still getting ready
## Acknowledgements
[Evolutionary Genetics Lab](http://www.biology.kyushu-u.ac.jp/~kteshima/), [Kyushu Univ.](https://www.kyushu-u.ac.jp/en/)
## Licence

[MIT](https://github.com/Sota-Nakashima/SSERAFIM/blob/main/LICENCE)

## Author

[Sota Nakashima](https://github.com/Sota-Nakashima)