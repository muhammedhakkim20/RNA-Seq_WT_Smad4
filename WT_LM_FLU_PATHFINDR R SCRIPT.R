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

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#IMPORTING DESEQ2 FILE OF WT_LM_FLU

input_WT_LM_FLUdf = read.csv(paste0(in_path, 'deseq_res_fe count sorted rawdata index789_wt_lm_flu.csv'), row.names = 1)
knitr::kable(head(input_WT_LM_FLUdf))

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#for WT OF LM & FLUdf

# Check for NA values in P_VALUE column and handle them ===================================================
if(any(is.na(input_WT_LM_FLUdf$FDR_p))) {
  # Assign NA p-values to 1
  input_WT_LM_FLUdf$FDR_p[is.na(input_WT_LM_FLUdf$FDR_p)] <- 1
}


# Ensure input data has required columns
required_cols <- c("Gene_symbol", "logFC", "FDR_p")
if(!all(required_cols %in% colnames(input_WT_LM_FLUdf))) {
  stop("Input data frame must contain the following columns: Gene_symbol, logFC, FDR_p")
  
  #--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
  # filtering step
  
  filtered_data_input_WT_LM_FLUdf <-  input_WT_LM_FLUdf%>%
    filter(FDR_p < 0.05 & (logFC >  2 | logFC < -2))
  
  write.csv(filtered_data_input_WT_LM_FLUdf, paste0(out_path,  'filtered_rawdata_fe sorted_p_0.05_log_2_WT_LM_FLU.csv'), row.names = FALSE)
  
  #---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  # Run pathfindR to get bubble plot showing enriched pathways
  
  input_WT_LM_FLUdf_output <- run_pathfindR(filtered_data_input_WT_LM_FLUdf, output_dir=out_path,
                                            gene_sets = "mmu_KEGG",
                                            pin_name_path = "Biogrid",
                                            iterations = 25,
                                            list_active_snw_genes=TRUE)
  
  
  write.csv(input_WT_LM_FLUdf_output, paste0(out_path,  'WT_LM_FLU_rawdata_index789FEcounts_pvalue_0.05_log_2_outputdf.csv'), row.names = FALSE)
  
  #---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
  #for wt of lm & flu termgene heatmap
  
  term_gene_heatmap(result_df = input_WT_LM_FLUdf_output, use_description = TRUE)
  
  #---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
  #for wt of lm & flu term_gene graph
  
  term_gene_graph(result_df = input_WT_LM_FLUdf_output, use_description = TRUE)
  
  #---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
  #for wt of lm & flu Upset plot
  
  UpSet_plot(input_WT_LM_FLUdf_output, use_description = TRUE, num_terms = 8)
  
  #-----------------------------------------------------#THE END--------------------------------------------------------------------------------------------------------------------