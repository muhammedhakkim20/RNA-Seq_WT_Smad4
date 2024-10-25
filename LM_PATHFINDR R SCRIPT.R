#Setting up environment ===================================================

# Clean environment
rm(list = ls(all.names = TRUE)) # will clear all objects including hidden objects
gc() # free up memory and report the memory usage

# Set options
options(max.print = .Machine$integer.max, scipen = 999, stringsAsFactors = FALSE, dplyr.summarise.inform = FALSE) # avoid truncated output in R console and scientific notation

Sys.setenv(JAVA_OPTIONS = "-Xmx4g")


# Load necessary library
library(pathfindR)
library(pathfindR,data)
library(org.Mm.eg.db)
library(dplyr)
# Set working directory
setwd('D:/RNA Seq raw data/RNA_Seq/WTvsS4KO/Hakkim/pathway_analysisR_pathfindR')

# Set input and output paths
in_path <- "D:/RNA Seq raw data/RNA_Seq/WTvsS4KO/Hakkim/pathway_analysisR_pathfindR/inputs/" # input path, where your data is located
out_path <- "D:/RNA Seq raw data/RNA_Seq/WTvsS4KO/Hakkim/pathway_analysisR_pathfindR/outs/" # output path, where you want your results exported to


#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#importiing deseq2 file

input_LMdf = read.csv(paste0(in_path, 'deseq_LM_TAG_padj.csv'), row.names = 1)
knitr::kable(head(input_LMdf))

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
#for LMdf
# Check for NA values in P_VALUE column and handle them ===================================================
if(any(is.na(input_LMdf$FDR_p))) {
  # Assign NA p-values to 1
  input_LMdf$FDR_p[is.na(input_LMdf$FDR_p)] <- 1
}


# Ensure input data has required columns
required_cols <- c("Gene_symbol", "logFC", "FDR_p")
if(!all(required_cols %in% colnames(input_LMdf))) {
  stop("Input data frame must contain the following columns: Gene_symbol, logFC, FDR_p")
}
#--------------------------------------------------------------------------------------------------------------------------------------------
# filtering step

filtered_data_LM <-  input_LMdf%>%
  filter(FDR_p < 0.1 & (logFC > 1 | logFC < -1))

write.csv(filtered_data_LM, paste0(out_path,  'LM_pathway_TAG_filtered_padjvalue_0.1&log1_outputdf.csv'), row.names = FALSE)

#----------------------------------------------------------------------------------------------------------------------------------------------

# Run pathfindR to get bubble plot showing enriched pathways

LM_output <- run_pathfindR(filtered_data_LM, output_dir=out_path,
                           gene_sets = "mmu_KEGG",
                           pin_name_path = "Biogrid",
                           iterations=25,
                           list_active_snw_genes=TRUE)
#for saving output file

write.csv(LM_output, paste0(out_path,  'LM_pathway_TAG_adjpvalue_0.1 log 1 & -1_outputdf.csv'), row.names = FALSE)

#-------------------------------------------------------------------------------------------------------------------------------------------------

#for LM termgene heatmap

term_gene_heatmap(result_df = LM_output, use_description = TRUE)

#-------------------------------------------------------------------------------------------------------------------------------------------------

#for LM term_gene graph

term_gene_graph(result_df = LM_output, use_description = TRUE)

#-------------------------------------------------------------------------------------------------------------------------------------------------

#for LM Upset plot

UpSet_plot(LM_output, use_description = TRUE)

#------------------------------------------------------#THE END-------------------------------------------------------------------------------------