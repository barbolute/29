# This script that fully automates the downloading of all data and hisat2 indexing in this study.
#

# Stop on any error.
set -ueo pipefail

# Create output folders
mkdir -p srr

# This is the reference genome.
REFSRR=srr/SRR.fa*

# The names for the index.
IDXSRR=srr/SRR.fa

# The files containint genomic coordinate.
GFFSRR=srr/SRR.gff*

# Download and unpack the raw RNA-Seq Data for the DE part of experiment
#from spleen
#control
fastq-dump --gzip --split-files -O rawdata SRR5001851
fastq-dump --gzip --split-files -O rawdata SRR5001848
fastq-dump --gzip --split-files -O rawdata SRR5001850

#2 DPI
fastq-dump --gzip --split-files -O rawdata SRR5001849
fastq-dump --gzip --split-files -O rawdata SRR5001845
fastq-dump --gzip --split-files -O rawdata SRR5001843

fastq-dump --gzip --split-files -O rawdata SRR5001849
fastq-dump --gzip --split-files -O rawdata SRR5001845
fastq-dump --gzip --split-files -O rawdata SRR5001843
ls

#4 DPI
fastq-dump --gzip --split-files -O rawdata SRR5001844
fastq-dump --gzip --split-files -O rawdata SRR5001847
fastq-dump --gzip --split-files -O rawdata SRR5001846

# Download and unpack the short read reference genome and gff file.
URL1=ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/151/805/GCF_000151805.1_Taeniopygia_guttata-3.2.4/GCF_000151805.1_Taeniopygia_guttata-3.2.4_genomic.fna.gz
echo "*** Downloading: $URL1"
curl -s $URL1 > srr/SRR.fa.gz
gunzip $REFSRR

URL2=ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/151/805/GCF_000151805.1_Taeniopygia_guttata-3.2.4/GCF_000151805.1_Taeniopygia_guttata-3.2.4_genomic.gff.gz
echo "*** Downloading: $URL2"
curl -s $URL2 > srr/SRR.gff.gz
gunzip $GFFSRR


# Build the indices
echo "*** Building hisat indices: $IDXSRR and $IDXLRR"
hisat2-build -p 14 $REFSRR $IDXSRR

ls
