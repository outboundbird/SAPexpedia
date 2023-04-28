# Pathway analysis
Pathway enrichment analysis aims to test the systematic up or down-regulation of a combination of the genes that lie in the same biological process compared to background or randomly selected genes. In this analysis, we will first explore the pathways that contain the statistically significantly differentially expressed genes from the DEA referencing from well-known gene ontology and pathway databases, then the enrichment of these pathways will be investigated in gene set enrichment analysis.

## Pathway exploration
Pathway identification will take place after the DEA. The genes that significantly changes the expression level after the treatment period will be considered as candidates for pathway search.  The selection of genes can be derived from the DEA results. However, it is not recommend using only p-values to be the only selection criteria[8]. The effect sizes and their precisions should also be taken into considerations. Additional procedures for gene selection are encouraged to be attempted. Once candidate genes are defined, they will be annotated with Ensembl gene IDs or gene IDs for the preparation of  gene function and pathway queries from the well-known databases. The suggested databases include but not limited to: Gene ontology (GO), Kyoto Encyclopedia of Genes and Genomes (KEGG) [9],  Molecular Signatures Database (MSigDB)[10], Reactome[11], OmniPath [12]
There exist a variety of online or offline tools for pathway queries, such as DAVID, GOrilla, Enrichr [13], and goseq[14], clusterProfiler [15] R packages. Genes associated with the same pathways will be grouped into the same gene sets. These gene sets are to be tested with enrichment analysis.

## Pathway Enrichment Analysis
A variety of pathway enrichment analysis methods has been developed over the years. We will implement gene set enrichment analysis (GSEA). The objective of GSEA, or pathway enrichment analysis is to test if a group of predefined genes are randomly distributed throughout a ranked list across the genome (in this context, genes are ranked by fold changes or t-statistics) or is it primarily found at the one side of the ranked list [16]. These predefined sets of genes are correlated with the itepekimab effect. The Fisher exact test is used and is based on the hypergeometric distribution. In this context, we will test if the gene sets in the pathways queried from the databases are randomly distributed on the fold change ranked list across the genome.

GSEA is composed of three steps, calculation of enrichment scores (ES) and/or normalized enrichment scores (NES) for each gene set/ pathway, estimation of the significance level of NES, and adjustment for multiple hypothesis testing if testing multiple pathways. The details of the GSEA procedure are well documented elsewhere [16] [17] and will guide through this analysis.
A variety of pathway enrichment analysis tools are ready for use in R and python. The package for analysis is not specified here and can be adapted according to the needs at the analysis.
Of note, GSEA approach does not account for the intercorrelation among genes inside a pathway and is known to produce the inflated of type I errors[18]. Other methods such as camera [18] , romer [4] or roast [19] which circumvent this issue in the significance test are encouraged to be applied as alternatives.

## Visualization analysis results
The following plots are previsioned to assess the analytical results.

Table X - Visualization of pathway enrichment analysis

|Plot name | Description|
|---------|-----------|
|Enrichment score plot  | A random walk plot of the running sum of the enrichment scores.|
|Enrichment Map  | A network representation of associations among the enriched pathways|
|Heatmap| Visualization of gene expression levels in the enriched pathways|


## Reference

1.	Chen, Y., et al., edgeR: differential analysis of sequence read count data  User's Guide. p. 119.
2.	Leek, J.T., et al., The sva package for removing batch effects and other unwanted variation in high-throughput experiments. Bioinformatics, 2012. 28(6): p. 882-883.
3.	Love, M.I., W. Huber, and S. Anders, Moderated estimation of fold change and dispersion for RNA-seq data with DESeq2. Genome Biology, 2014. 15(12): p. 550.
4.	Ritchie, M.E., et al., limma powers differential expression analyses for RNA-sequencing and microarray studies. Nucleic Acids Research, 2015. 43(7): p. e47.
5.	Tong, Y., The comparison of limma and DESeq2 in gene analysis. E3S Web of Conferences, 2021. 271: p. 03058.
6.	Li, Y., et al., Exaggerated false positives by popular differential expression methods when analyzing human population samples. Genome Biology, 2022. 23(1): p. 79.
7.	Efron, B., Large-Scale Simultaneous Hypothesis Testing. Journal of the American Statistical Association, 2004. 99(465): p. 96-104.
8.	Halsey, L.G., et al., The fickle P value generates irreproducible results. Nature Methods, 2015. 12(3): p. 179-185.
9.	Kanehisa, M., et al., KEGG for taxonomy-based analysis of pathways and genomes. Nucleic Acids Research, 2023. 51(D1): p. D587-D592.
10.	Liberzon, A., et al., The Molecular Signatures Database (MSigDB) hallmark gene set collection. Cell systems, 2015. 1(6): p. 417-425.
11.	Gillespie, M., et al., The reactome pathway knowledgebase 2022. Nucleic Acids Research, 2022. 50(D1): p. D687-D692.
12.	Türei, D., T. Korcsmáros, and J. Saez-Rodriguez, OmniPath: guidelines and gateway for literature-curated signaling pathway resources. Nature Methods, 2016. 13(12): p. 966-967.
13.	Chen, E.Y., et al., Enrichr: interactive and collaborative HTML5 gene list enrichment analysis tool. BMC Bioinformatics, 2013. 14: p. 128.
14.	Young, M., goseq: Gene Ontology analyser for RNA-seq and other length biased data. 2022, Bioconductor version: Release (3.15).
15.	Yu, G., et al., clusterProfiler: an R Package for Comparing Biological Themes Among Gene Clusters. OMICS: A Journal of Integrative Biology, 2012. 16(5): p. 284-287.
16.	Subramanian, A., et al., Gene set enrichment analysis: A knowledge-based approach for interpreting genome-wide expression profiles. Proceedings of the National Academy of Sciences, 2005. 102(43): p. 15545-15550.
17.	Reimand, J., et al., Pathway enrichment analysis and visualization of omics data using g:Profiler, GSEA, Cytoscape and EnrichmentMap. Nature Protocols, 2019. 14(2): p. 482-517.
18.	Wu, D. and G.K. Smyth, Camera: a competitive gene set test accounting for inter-gene correlation. Nucleic Acids Research, 2012. 40(17): p. e133.
19.	Wu, D., et al., ROAST: rotation gene set tests for complex microarray experiments. Bioinformatics, 2010. 26(17): p. 2176-2182.

