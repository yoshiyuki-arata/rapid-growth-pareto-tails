# Replication Files for Rapid Growth and the Emergence of Pareto Tails

This folder contains supplementary materials for the paper [*Rapid Growth and the Emergence of Pareto Tails*](https://www.nta.go.jp/about/organization/ntc/kyodokenkyu/kohyo/pdf/250601-02ST.pdf), including the computational code used in the empirical analysis and code for generating the simulated data needed to run it.
These materials document the procedures for data processing, sample selection, calculation of statistics, estimation, and production of figures and tables in the empirical analysis, with the aim of improving the transparency of the analytical methods and computational workflow.

Because the data used in the paper's empirical analysis cannot be made publicly available, we provide code that generates synthetic panel datasets with the variables, data structure, and units required as inputs to the analysis code.
The estimates, figures, and tables obtained from the simulation do not reproduce the numerical results, figures, or tables reported in the paper.

Overviews of each analysis, along with links to the corresponding computational code (QMD) and execution results (HTML), are provided in [Firm sales](https://yoshiyuki-arata.github.io/rapid-growth-pareto-tails/firm_sales/00_summ_Zipf.html) and [Individual income](https://yoshiyuki-arata.github.io/rapid-growth-pareto-tails/individual_income/00_summ_income.html).

## Requirements

R (version 4.1 or later), Quarto, and the following R packages are required.

```r
install.packages(c(
  "knitr", "rmarkdown", "tidyverse", "pins", "qs2", "arrow",
  "kableExtra", "hrbrthemes", "corrr", "scattermore", "matrixStats",
  "ReIns", "data.table", "latex2exp"
))
```
