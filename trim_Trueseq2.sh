for file1 in `ls *R1_001.fastq.gz`
do
file2=`echo $file1|sed 's/R1/R2/g'`
echo $file1
echo $file2
/usr/bin/java -Xmx100m -jar /home/jinxu/software/Trimmomatic-0.36/trimmomatic-0.36.jar PE  -threads 8 $file1 $file2 $file1.trimmed  $file1.unpaired $file2.trimmed  $file2.unpaired ILLUMINACLIP:/home/jinxu/software/Trimmomatic-0.36/adapters/TruSeq2-PE.fa:2:30:10

done
