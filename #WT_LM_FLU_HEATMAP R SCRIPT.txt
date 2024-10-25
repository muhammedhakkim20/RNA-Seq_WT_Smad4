#WT_LM_FLU_HEATMAP

# Load necessary libraries
library(pheatmap)

setwd('D:/RNA Seq raw data/RNA_Seq/WTvsS4KO/Hakkim/heatmap/pheatmap_inputs/')

# Load DESeq2 results
WT_LM_FLU_deseq2_results <- read.csv("filtered_raw_fe sorted.csv", row.names = 1)

# Load normalized counts
WT_LM_FLU_normalized_counts <- read.csv("normalized_counts_WT_LM_FLU fe sorted rawdata.csv", row.names = 1)


allSig <- merge(WT_LM_FLU_normalized_counts, WT_LM_FLU_deseq2_results, by = 0)

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
         main="Significant genes of WT_LM_FLU with pvalue<0.05",
         fontsize_col= 4,
         fontsize_row = 3 ,
         width = NA,
         height = NA,
         color = colorRampPalette(c("blue","white","red"))(20)