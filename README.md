# RNA-Seq_WT_Smad4
RNA seq data analysis of wild-type and Smad4 deficient CD8 T cells using RNA Seq data analysis pipelines. (DGE analysis using DESeq2 &amp; Pathway Analysis using PathfindR package in R programming language)

➢ In this study, bacterial infection caused by listeria monocytogenes & viral infection caused by influenza virus.

➢ Smad4 is a gene which regulates gene expression & influencing immune response in CD8 T cells during infections.

➢ In order to study the effect of Smad4 in bacterial & viral infections, differential expression analysis (DEA) & Pathway Analysis (PEA) performed.

➢ Differential gene expression analysis (DEA): To identify genes that are differently expressed in between two conditions. 
control(WT) & smad4 knockouts(S4KO)
DESeq2 is a tool used for DEA.

➢ Pathway Enrichment Analysis (PEA): To identify signaling pathways that were enriched during bacterial & viral infections.
PathfindR is a R package used for PEA.

![FLOW CHART_page-0001](https://github.com/user-attachments/assets/498714fe-bd6e-48e0-9022-184ac1ee8c3a)

# OBJECTIVES

1. To understand the effect of SMAD4 on CD8 T cell immune
response during bacterial & viral infections.

2. To understand the differentially expressed genes & signaling pathways
involved in bacterial & viral infections.

# METHODS

➢ Data Preprocessing
➢ Essential step before performing differential expression analysis
➢ Ensures data is clean, filtered, organized and ready for analysis

Quality Analysis:
Tools: FASTQC, Trimmomatic, Sickle.

Read Alignment:
Tool: RNA STAR.
Mapped the reads to mm39 reference genome.

Quantification:
Tool: feature Counts.
Generated gene count files.

Differential Gene Expression Analysis:
Tool: DESeq2.
Generated DGE results.

Key Packages :
pheatmap: For generating Heatmap
PathfindR: For active subnetworks and pathway enrichment analysis.

Pathway Enrichment Analysis:
Tool: PathfindR.
Generated PEA results.

Key Packages :

# RESULTS

# Effect of Smad4 in Bacterial infections(LM)

DEA:

➢Identified 26,264 differentially expressed genes (DEGs)
PEA:

➢ Identified 25 enriched signaling pathways
➢ Top pathways: TGF-beta signaling(high), JAK-STAT signaling(more genes), Th17 cell
differentiation.

Comparison: WT vs. SMAD4KO CD8 T cells
Key Finding: TGF-beta pathway regulates, SMAD4 downregulated
Effect: Impaired CD8 T cell differentiation, function, proliferation, and survival

![GITHUB_pages-to-jpg-0001](https://github.com/user-attachments/assets/6cc86e71-c55e-4c47-8ee7-ab862b9612d1)
![GITHUB_pages-to-jpg-0002](https://github.com/user-attachments/assets/3e678942-5be8-4cb6-ab2f-9e7fb12c2595)

# Effect of Smad4 in Viral infections(FLU)

DEA:

➢Identified 26,264 differentially expressed genes (DEGs)

PEA:

➢ Identified 57 enriched signaling pathways
➢ Top pathways: TGF-beta signaling(high), B cell receptor signaling.

Comparison: WT vs. SMAD4KO CD8 T cells
Key Finding: TGF-beta pathway regulates, SMAD4 downregulated
Effect: Weakened antiviral response, altered memory formation

![GITHUB_pages-to-jpg-0003](https://github.com/user-attachments/assets/eb10d8d9-06a7-4fca-8853-1f5583826327)
![GITHUB_pages-to-jpg-0004](https://github.com/user-attachments/assets/edaef3a3-cc17-43ef-83b7-3a32273ca764)

# Pathways regulating Bacterial & Viral infections(WT OF LM & FLU)

DEA:

➢Identified 5770 differentially expressed genes (DEGs)
PEA:

➢ Identified 144 enriched signaling pathways
➢ Top pathways: Polycomb Repressive Complex (highest significance), ATP-dependent Chromatin
Remodeling.

Comparison: WT of LM vs. WT of FLU CD8 T cells
Key Finding: Polycomb Repressive Complex regulates
Effect: The regulatory role of the Polycomb repressive complex further highlights the distinct
genetic and epigenetic mechanisms shaping CD8 T cell responses to different types of infections.

![GITHUB_pages-to-jpg-0005](https://github.com/user-attachments/assets/f80e3f53-40c1-442e-8cfe-52d1840240a4)
![GITHUB_pages-to-jpg-0006](https://github.com/user-attachments/assets/49ec2b44-e8cd-4b63-99d5-e1db99e10fc4)

