#gff to gtf file conversion for use with featureCounts
gffread srr/SRR.gff -T -o srr/SRR.gtf

GTFSRR=srr/SRR.gtf

echo "*** Counting features with: $GTFSRR"
featureCounts -T 16 -a $GTFSRR -g gene_name -o srrcounts.txt  bam1/C*.bam  bam1/T2_*.bam bam1/T4_*.bam

#simple counts
cat counts.txt | cut -f 1,7-15 > finalsrrcounts.txt

ls
