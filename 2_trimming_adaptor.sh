for file1 in `ls */*R1_001.fastq.gz`
do
{
file2=`echo $file1|sed 's/R1/R2/g'`
echo $file1
echo $file2
/home/jinxu/Software/cutadapt-1.6/bin/cutadapt -b CTGTCTCTTATACACATCTCCGAGCCCACGAGA  -m 25   -o $file1.tmp.fq  -p $file2.tmp.fq  $file1 $file2
/home/jinxu/Software/cutadapt-1.6/bin/cutadapt -b CTGTCTCTTATACACATCTGACGCTGCCGACGA  -m 25   -o $file2.trimmed.gz  -p $file1.trimmed.gz   $file2.tmp.fq $file1.tmp.fq
rm $file1.tmp.fq
rm $file2.tmp.fq
}&
done
