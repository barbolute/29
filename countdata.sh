# Stop this script on any error.
set -euo pipefail

# The gene feature file
GTFSRR=srr/SRR.gffmore 

# Collect the output of commands here.
RUNLOG=runlog.txt

echo "*** Counting features with: $GTFSRR"
featureCounts -T 14 -a $GTFSRR -g gene_name -o LRR_Cuffcounts.txt  bam/LRR_C*.bam  bam/LRR_T*.bam 2>> $RUNLOG

featureCounts -T 16 -a merged.gtf -g gene_id -o mergedcounts.txt SRR/bam/SRR_*.bam LRR/bam/LRR_*.bam 


#simple counts
cat LRR_Cuffcounts.txt | cut -f 1,7-12 > simpleLRR_Cuffcounts.txt
