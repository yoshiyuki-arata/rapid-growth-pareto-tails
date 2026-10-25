# Replication Files for Rapid Growth and the Emergence of Pareto Tails

This folder contains supplementary materials for the paper *Rapid Growth and the Emergence of Pareto Tails*, including the computational code used in the empirical analysis and code for generating the simulated data needed to run it.
These materials document the procedures for data processing, sample selection, calculation of statistics, estimation, and production of figures and tables in the empirical analysis, with the aim of improving the transparency of the analytical methods and computational workflow.

Because the firm-level data used in the paper's empirical analysis cannot be made publicly available, these materials generate a synthetic firm panel from random numbers, with the variables, data structure, and units required as inputs to the analysis code.
Using these simulated data in place of the empirical data allows users to run the computational procedures used in the actual analysis and examine the complete workflow, from data generation to estimation and the output of figures and tables.
The estimates, figures, and tables obtained from the simulation do not reproduce the numerical results, figures, or tables reported in the paper.

Overviews of each analysis, along with links to the corresponding computational code (QMD) and execution results (HTML), are provided in [Firm sales](firm_sales/00_summ_Zipf.qmd) and [Individual income](individual_income/00_summ_income.qmd).

## Requirements

R (version 4.1 or later), RStudio, Quarto, and the following R packages are required.

```r
install.packages(c(
  "knitr", "rmarkdown", "tidyverse", "pins", "qs2", "kableExtra", 
  "hrbrthemes", "corrr", "scattermore", "matrixStats", "ReIns"
))
```

To run 12 as well, also install `data.table` and `latex2exp`.
