## Differential Expression Analysis (DEA)

$model here$

The realization of model fitting can be achieved with several R packages, such as DEseq2 [3], limma [4], edgeR [1], etc. Each of the packages assumes different statistical distributions of the gene expression levels measured by RNA sequencing and takes different input of the count matrix. Of note, DESeq2 takes the input of raw counts and models the outcomes as negative binomial distributions and assumes that most of the genes are not differentially expressed, whereas the limma package requires the log-normal distributions in the normalized count matrix and corrected for the over-dispersion of variance (voom method) while fitting the models. A recent investigation on the comparison of limma and DEseq2 performances showed that the two packages had about 90% of the overlaps in finding significantly differentially expressed genes. However, limma, with its few advantages in correcting systematic bias in the count matrix, was able to detect differentially expressed genes more accurately[5].  Additionally, it is shown that DEseq2 and edgeR methods produced inflated type 1 error and even controlled for false discovery rate (FDR)[6]. The additional advantage of the limma package is that it has the option to fit a linear mixed effect model and accommodate the random effect.

In respect of the intention from the protocol and consideration of the performance, we would like to purpose to investigate DEA with limma package. A log transformation will be made on the normalized count matrix before model fitting. The contrast will be made between the two time points. The primary interest of the test coefficient is β_t, which corresponds to the contrast of the expression levels at two time points.

## Determination of the statistically significant level
Approximately 15k ~ 20k genes will be investigated in the DEA. The Benjamini-Hochberg procedure for multiple testing correction will be used to control the False Discovery Rate (FDR) for each contrast implemented. We will keep the genome-wide false discovery rate to be less than 5%. This corresponds to the adjusted p-value being less than 0.05 for each test. In the scenario of type I error inflation, a local FDR will be implemented to control false positive discoveries more stringently [7].

Note that statistical significance is not the only criteria to determine the genes to be selected for signature construction[8].  Based on the power calculation, we will further examine the effect sizes (fold changes) with the consideration of the downstream analyses for the signature development. A threshold of 2 times of fold change will be applied as the criteria for defining differentially expressed genes. This threshold is subject to change and can be adapted according to the needs. However, we recommend that the threshold should be no less than 1.91 at CV = 0.2 according to the detection range based on the power calculation.
## Visualization of test results
To assist the decision-making for selecting gene candidates to be considered in the gene signature list, a few plots are proposed.  The sets of plots with the intention for inspections of test results are listed in Table 3:

Table X - List of plots for visualization of test results

|Set of plots|List of Plots|Objectives|
|------------|-------------|------------------|
|Distribution of p values| Histogram,Q-Q plot (against uniform distribution)|Inspect inflation of type 1 error
|Effect size and statistical significance|-Volcano plot, Fold change vs. mean-expression plot, MA plot|Inspection of outliers of the contrast coefficients|
|Gene expression levels|Heatmap, Boxplot of changes of expression levels or boxplot of gene expression levels before and after treatment among the top 10 statistically significant genes|Inspection of expression patterns|


For each comparison a results file will be prepared which contains the following information for each gene:
- Gene identifier (Ensembl or NCBI)
- Mean of expression levels
- Beta estimate for the variables of interest (effect size, Fold change, or difference in fold change)
- Standard error
- P-value
- adjusted P-value


## Reference
1.Chen, Y., et al., edgeR: differential analysis of sequence read count data  User's Guide. p. 119.
2.Leek, J.T., et al., The sva package for removing batch effects and other unwanted variation in high-throughput experiments. Bioinformatics, 2012. 28(6): p. 882-883.
3.Love, M.I., W. Huber, and S. Anders, Moderated estimation of fold change and dispersion for RNA-seq data with DESeq2. Genome Biology, 2014. 15(12): p. 550.
4.Ritchie, M.E., et al., limma powers differential expression analyses for RNA-sequencing and microarray studies. Nucleic Acids Research, 2015. 43(7): p. e47.
5.Tong, Y., The comparison of limma and DESeq2 in gene analysis. E3S Web of Conferences, 2021. 271: p. 03058.
6.Li, Y., et al., Exaggerated false positives by popular differential expression methods when analyzing human population samples. Genome Biology, 2022. 23(1): p. 79.
7.Efron, B., Large-Scale Simultaneous Hypothesis Testing. Journal of the American Statistical Association, 2004. 99(465): p. 96-104.
8.Halsey, L.G., et al., The fickle P value generates irreproducible results. Nature Methods, 2015. 12(3): p. 179-185
