# RNP-Int

This repository contains the data and codes used in the paper.

## Simulation

`simulation data generation.nb` is used to generate simulation data. There are 200 covariates, four scenarios of y and three types of random errors. The survival data has an extra column indicates whether y is censored.

In `simulation data fitting.nb`, `SparseAdditiveModelFit` and `SparseAcceleratedFailureTimeModelFit` are two main functions. They have same inputs, but fit different models. The inputs and their meaning are as follows.
| Input | Meaning |
|---|---|
| data | Simulation data. |
| yType | 1, 2, 3, 4 correspond to different scenarios. |
| errorType | 1 for normal error, 2 for mixed error, 3 for Cauchy error. |
| methodType | 1 for NP-Int, 2 for NP-Meta, 3 for NP-Pool, 4 for P-Int. |
| lossType | 0 for robust loss function(R), 2 for non-robust loss function(NR). |
| q | Number of nodes.                                             |
| ν | Step length. |
| T | Number of iterations. |
| λ1 | Penalty parameter for unequal coefficients. |
| λ2 | Penalty parameter for non-zero coefficients. |

`simulation data prediction.nb` and `simulation data table.nb` are used to evaluate the performance of the fit.

## Practice

We uses the lung adenocarcinoma (LUAD), the lung squamous-cell carcinoma (LUSC) and the glioblastoma (GBM) data, which are downloaded using cgdsr package in R.

`TCGA/preprocess.r` is used to convert `*.RData` to `*.csv`.

For LUAD and LUSC, the covariates are gene expression values, the response is FEV1 percent ref prebroncholiator, and we assign each observation to several data sets according to its AJCC pathologic tumor stage. Because more than half of the responses of LUAD and LUSC data are missing (54% and 63%), and they both belong to non-small cell lung cancer, accounting for about 70% of all lung cancers, we may wish to take the intersection of their covariates and combine they as one data. There are 10 kinds of values for AJCC pathologic tumor stage. To simplify matters, Stage I, Stage IA, and Stage IB are merged into the first category; Stage II, Stage IIA and Stage IIB are merged into the second category; Stage III, Stage IIIA, Stage IIIB, and Stage IV are merged into the third category.

For GBM, the covariates are gene expression values, the response is logarithm of survival time, and we assign each observation to two data sets according to its sex. Male is the first category; female is the second category. The following censoring indicators are used: 0 represents no censoring (deceased during the observation period) and 1 represents right censoring (still living at the end of the observation period).

The covariates' outliers, whose value are less than $mean - 3 sd$ or greater than $mean + 3 sd$, are replaced with mean. The responses are standardized, but outliers are not processed.

For each covariate with more than 30 different values, we fit a one-dimensional model, then select 200 covariates with the smallest residual sum of squares.

`LU data preprocessing.nb` and `GBM data preprocessing.nb` are used to complete the above work.

`LU data prediction.nb` and `GBM data prediction.nb` are used to evaluate the performance of the fit.

`LU variable screening.nb` and `GBM variable screening.nb` are used to select covariates whose coefficients are not zero at least once in 20 rounds. At last, We fit the model with those covariates and all the data.

## `Others`

More information can be found in the paper. If you have any problems when using it, please open an issue.

