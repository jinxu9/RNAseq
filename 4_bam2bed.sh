ref_size="/home/jinxu/DB/mmu9/mm9_UCSC_genome/mm9_all.chrsize"
for file in `ls *.bam`
do
echo $file
samtools view -b -f 0x2   $file | samtools sort - $file.sort 
samtools view $file.sort.bam |perl /home/jinxu/bin/sam2bed_DEGseq.pl   -  > $file.sort.bed

genomeCoverageBed -bg -split -ibam $file.sort.bam  -g $ref_size > $file.bedGraph 
norm_bedGraph.pl $file.bedGraph $file.bedGraph.norm
bedGraphToBigWig $file.bedGraph.norm $ref_size  $file.norm.bw 

done 
