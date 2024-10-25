#LM_HEATMAP

# Load necessary libraries
library(pheatmap)

setwd('D:/RNA Seq raw data/RNA_Seq/WTvsS4KO/Hakkim/heatmap/pheatmap_inputs/')

# Load DESeq2 results

LM_deseq2_results <- read.csv("LM_pathway_TAG_filtered_adjpvalue_0.1_outputdf.csv", row.names = 1)

# Load normalized counts
LM_normalized_counts <- read.csv("normalized_counts_LM_TAG.csv", row.names = 1)


allSig <- merge(LM_normalized_counts, LM_deseq2_results, by = 0)

sigcounts <- allSig[,2:6]
row.names(sigcounts) <- allSig$Row.names

pheatmap(sigcounts,
         cellwidth = 25,
         cellheight = 3,
         scale = "row",
         clustering_distance_rows = "correlation",
         clustering_method = "complete",
         cluster_rows = T,
         cluster_cols = F,
         main="Significant genes of LM with adjp<0.1",
         fontsize_col=4,
         fontsize_row = 3 ,
         width = NA,
         height = NA,
         color = colorRampPalette(c("blue","white","red"))(20)