## Single-cell RNA (scRNA) sequencing data

Single-cell RNA sequencing data should be preprocessed from FASTQ files and pass the quality control before passing transferring to statistical analysis. The scRNA sequencing output should be provided as a barcode-gene count matrix. The incorporation of unique molecular identifier (UMI) into the cell library construction protocol should be indicated along with the count data. The quality control procedure will examine potential outliers or doublet based on the number of counts per barcode, the number of genes per barcode and the fractions of counts from mitochondrial genes per barcode. The potential doublet should be filtered out. At the transcriptomic level, genes not expressed in a few cells should be kept out. The threshold for the filtering should not be prefixed at a certain level and should be based on downstream analysis such as cell cluster annotation and decided iteratively.

Upon QC, the count data should be cell normalized before analysis. A variety of normalization methods were developed to mitigate the sampling effect and obtain correct gene expression abundance between cells. Depending on the laboratory conditions such as the number of experiments and batches, linear or non-linear normalization methods can be applied[20] [21].  Log-transformation will be applied to cell-normalized counts.

 A wide range of software packages is available in R or Python for scRNA seq preprocessing such as scanpy[22], f-scLVM[23], Seurat[24], MAST[25], etc.
 
# Reference
 20.	Büttner, M., et al., A test metric for assessing single-cell RNA-seq batch correction. Nature Methods, 2019. 16(1): p. 43-49.

21.	Cole, M.B., et al., Performance Assessment and Selection of Normalization Procedures for Single-Cell RNA-Seq. Cell Systems, 2019. 8(4): p. 315-328.e8.

22.	Wolf, F.A., P. Angerer, and F.J. Theis, SCANPY: large-scale single-cell gene expression data analysis. Genome Biology, 2018. 19(1): p. 15.

23.	Buettner, F., et al., f-scLVM: scalable and versatile factor analysis for single-cell RNA-seq. Genome Biology, 2017. 18(1): p. 212.

24.	Hao, Y., et al., Integrated analysis of multimodal single-cell data. Cell, 2021. 184(13): p. 3573-3587.e29.

25.	Finak, G., et al., MAST: a flexible statistical framework for assessing transcriptional changes and characterizing heterogeneity in single-cell RNA sequencing data. Genome Biology, 2015. 16: p. 278.
