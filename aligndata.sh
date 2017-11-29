# Exit this script on any error.
set -euo pipefail

# This keeps track of the messages printed during execution.
RUNLOG=runlog.txt
echo "Run by `whoami` on `date`" > $RUNLOG

# Create output folder
mkdir -p bam1

# The index determines what the data is aligned against.
IDXSRR=srr/SRR.fa


#Align Control 1 Sample
R1=rawdata/SRR5001851_1.fastq.gz
R2=rawdata/SRR5001851_2.fastq.gz
BAM=bam1/C_1.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

#Align Control 2 Sample
R1=rawdata/SRR5001848_1.fastq.gz
R2=rawdata/SRR5001848_2.fastq.gz
BAM=bam1/C_2.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

#Align Control 3 Sample
R1=rawdata/SRR5001850_1.fastq.gz
R2=rawdata/SRR5001850_2.fastq.gz
BAM=bam1/C_3.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

#Align T2 Sample 1
R1=rawdata/SRR5001849_1.fastq.gz
R2=rawdata/SRR5001849_2.fastq.gz
BAM=bam1/T2_1.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

#Align T2 Sample 2
R1=rawdata/SRR5001845_1.fastq.gz
R2=rawdata/SRR5001845_2.fastq.gz
BAM=bam1/T2_2.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

#Align T2 Sample 3
R1=rawdata/SRR5001843_1.fastq.gz
R2=rawdata/SRR5001843_2.fastq.gz
BAM=bam1/T2_3.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

#Align T4 Sample 1
R1=rawdata/SRR5001844_1.fastq.gz
R2=rawdata/SRR5001844_2.fastq.gz
BAM=bam1/T4_1.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

#Align T4 Sample 2
R1=rawdata/SRR5001847_1.fastq.gz
R2=rawdata/SRR5001847_2.fastq.gz
BAM=bam1/T4_2.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

#Align T4 Sample 3
R1=rawdata/SRR5001846_1.fastq.gz
R2=rawdata/SRR5001846_2.fastq.gz
BAM=bam1/T4_3.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

ls
