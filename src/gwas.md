## Model consideration

Each genetic markerwill be assessed using a logistic regression model in the matched case-control study.


$$logit(P(D)) = \alpha + \beta* genetic_marker + covariates +
\epsilon
$$
**Genetic markers**
1) Genotyping data from PharmacoScan array. The additive model is primarily consideredfor SNPs;thegenetic effect is linearly increasedwith each addition of a minor allele.

2) Haplotype from exome sequencing. Haplotypes will be treated as a categorical variable. The effectsof rare haplotypeswill be compared with those of common haplotypes.

**Covariates** The covariates under the matched cased-control designare not foreseen. However, we previewafew situations wherethe adjustmentsby covariatesmight beneeded.Under the scenario of failure of matching cases and controls, the matching variables will be added tothe model. Under the scenario of apparent population stratifications,the first two to ten principal components(PCs)from the principalcomponent analysis (PCA) will be adjusted in the model. The number of PCs for adjustment will be decided based on the eigenvalue plot.

Firth’s bias reduction method (1) willbe applied to mitigate theseparation issue(2)which can occur in the data withsmall sample sizeanda strong genetic effect. P-value will be estimated from the Waldtest(3).

The primary interest ofthis model is $\beta$, which estimates the genetic effect on the risk of having DILI. Under the null hypothesis, $\beta=0$, which corresponds to the odds ratio OR=1.Under the alternative hypothesis,$\beta \ne 0$ or $OR \ne 1$. Confidence limits and p-values will be two-sided.

## Presentation of results

In consideration of the multiplicity issue, afalse discovery rate (FDR)is considered to control false positive findings. For each genetic marker, an estimatefor the oddsratio with 95% confidence intervals, a nominal test p-value, andan FDR-adjustedp-valuefrom the statistical model will be providedin a table.

Table X-List ofplots for genetic analysis result visualization

|Objectives of visualization| Plot names|
|-------|--------------|
|Examine type I error| Histogram of pvalues, Q-Q^[quantile-quantile] plotof p-values|
|Targeting the region|Manhattan plot Locus zoom plot if any signal found|
|Examine the genetic effect (e.g.,additive, dominant, or recessive)|Errorplot of genotypes and probability of having DILI in the most significant markers|
