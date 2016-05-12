# RNAseq
Rough pipeline for RNAseq

 
2. 1_fastqc.sh :
 Example the sequencing quality. 

3. 2_trimming_adaptor.sh
Trimming if there is any adaptor sequencing 

3. 3_tophap.sh 
 Mapping RNAseq(trimmed if neccessary) to genome reference 
4. 4_bam2bed.sh 
Formate alignment file from bam 2 bed. 

5. 5_bed2exp.sh
Count reads for genes according to annotation file using DEGseq package. 
Longest isform were choosen.  Both raw count and RPKM were reported.

6. 6_DESseq.sh
Differential expression gene test using DESeq package 

7. refGene.txt.addsymbol.formate
Example of gene annotation file(a little modification from UCSC refGene.txt)
8. sam2bed_DEGseq.pl 
In house script used in 5_bam2bed.sh
