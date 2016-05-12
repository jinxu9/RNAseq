for file in `ls */*_R1_001.fastq.gz.trimmed.gz`

do

dir=`echo $file|awk -F\_ '{print $1"-"$2}' `
echo $file
echo $dir
file2=`echo $file|sed 's/R1/R2/g'`
echo $file2

mkdir  $dir
tophat2  -o $dir -p 14 -G /home/jinxu/Backup/Rai1-KO/RNA-seq/Annotation/genes.gtf -I 1000000 --max-coverage-intron 1000000 --max-segment-intron 1000000  --no-coverage-search --b2-very-sensitive   --microexon-search /home/jinxu/DB/mmu9/mm9_UCSC_genome/mm9_chr  $file $file2  1> $dir/tophat.log 2>$dir/tophat.err 

done
