######script for using  DESeq to detect DEGs.################## 
library("DESeq2")
library("RColorBrewer")
library("gplots")
countsTable <- read.delim( "merged_table.txt", header=T, stringsAsFactors=TRUE )
rownames( countsTable ) <- countsTable$gene
countsTable <- round(countsTable[ , 2:5 ])
colData <- data.frame(condition=factor(c( "KO","KO","WT","WT")))
dds<-DESeqDataSetFromMatrix(countsTable,colData, formula(~condition)) 
dds <- estimateSizeFactors(dds)
dds <- DESeq(dds)
res <- results(dds)
resOrdered <- res[order(res$padj),]

pdf("RNAseqRai1_cortex_NM.pdf")

plotMA(dds, main="Rai1_KO RNA seq  cortex", ylim=c(-2,2))
write.table(as.data.frame(resOrdered),"RaiKO_DESeq_refGene_NM.txt", row.name=T,sep="\t",quote=F)
rld <-rlogTransformation(dds)
vsd <- varianceStabilizingTransformation(dds)
rlogMat <- assay(rld)
vstMat <- assay(vsd)
hmcol <- colorRampPalette(brewer.pal(9, "GnBu"))(100)
distsRL <- dist(t(assay(rld))) 
mat <- as.matrix(distsRL)
samples<-c("Nestin-Cre-A","Nestin-Cre-B","WT-A","WT-B")
rownames(mat) <- colnames(mat) <- with(colData(dds), paste(condition, samples, sep=" : "))
heatmap.2(mat, trace="none", col = rev(hmcol), margin=c(13, 13))
print(plotPCA(rld, intgroup=c("condition")))

dev.off()

