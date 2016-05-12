# RNAseq
Rough pipeline for RNAse q

1. 
2. 1_fastqc.sh :
2.  Example the sequencing quality. 

3. 2_trimming_adaptor.sh
Trimming if there is any adaptor sequencing 

3. 3_tophap.sh 
4. Mapping RNAseq(trimmed if neccessary) to genome reference 
 
4 bam2bed.sh 
Formate alignment file from bam 2 bed. 

5. bed2exp.sh
Count reads for genes according to annotation file using DEGseq package. 
Longest isform were choosen.  Both raw count and RPKM were reported.

6. 6_DESseq.sh
Differential expression gene test using DESeq package 
