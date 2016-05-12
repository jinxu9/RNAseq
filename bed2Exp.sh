for file in `ls *.sort.bed`
do
echo "
library(\"DEGseq\")
rc=system.file(package=\"DEGseq\")
rc=file.path(\"$file\")
refFlat=system.file(package=\"DEGseq\")
refFlat=file.path(\"/home/jinxu/DB/mmu9/annotation/brain_tissue/refGene.txt.addsymbol.formate\")
mapResultBatch=c(rc)
output=file.path(\"/home/jinxu/Backup/Rai1-KO/RNA-seq-cortex/bam_all\",\"$file.exp.gene\")
exp=getGeneExp(mapResultBatch,refFlat=refFlat,output=output)
write.table(exp[30:32,],row.names=FALSE)
"> bed2exp_Rscript.R

Rscript bed2exp_Rscript.R 

done
