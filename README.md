This repository provides a modular bioinformatics workflow for identifying orthologous genes and estimating rates of nonsynonymous (Ka) and synonymous (Ks) substitutions among single-copy genes (SCGs) using transcriptome data from multiple samples and species.

The pipeline is designed to detect orthologous genes potentially evolving under positive selection by combining orthology inference, codon-aware alignment, substitution rate estimation, and optional functional annotation. It begins with the extraction of open reading frames (ORFs) from assembled transcriptomes using the EMBOSS tool GetORF, selecting coding sequences longer than 150 amino acids. These sequences are then translated into protein sequences using Transeq.

Protein datasets from different samples are processed with OrthoFinder, a robust tool for orthogroup inference, using DIAMOND for fast homology searches and MAFFT for multiple sequence alignments. From the resulting orthogroups, single-copy orthologs shared across species are extracted for downstream analysis.

Codon-level alignments are generated with ParaAT, which aligns coding sequences based on the aligned protein sequences, preserving reading frame accuracy. Substitution rates (Ka, Ks, and Ka/Ks ratios) are calculated using KaKs_Calculator v2.0 under the YN model (Yang & Nielsen). Orthologs are filtered to remove potential false positives based on alignment quality and Ks thresholds. Genes with Ka/Ks ratios greater than 1 are considered candidates for positive selection.

An optional functional enrichment analysis of candidate genes under selection can be performed using tools such as ClusterProfiler in R, allowing interpretation of the biological significance of selective pressures.

The repository includes scripts for preprocessing, alignment, rate calculation, and environment configuration. A Conda environment file is also provided to ensure reproducibility and ease of installation, including dependencies such as EMBOSS, OrthoFinder, DIAMOND, MAFFT, ParaAT, and KaKs_Calculator.

This workflow is intended for comparative transcriptomics and evolutionary genomics studies across non-model organisms and is adaptable to a wide range of species and experimental designs.



