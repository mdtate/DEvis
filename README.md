# DEvis

DEvis is a powerful, integrated solution for the analysis of differential expression data. 
This package includes an array of tools for manipulating and aggregating data, as well as a wide range
of customizable visualizations that simplify RNA-Seq analysis and provide a variety of ways of exploring
and analyzing data.

## Installation:
### If using OS X, please ensure that you are using the most up to date version of xcode. 
Instructions for [how to update xcode](https://stackoverflow.com/questions/15417619/how-do-you-update-xcode-on-osx-to-the-latest-version).
```
#Install DESeq2 dependency from bioconductor.
source("https://bioconductor.org/biocLite.R")
biocLite("DESeq2")

#Install devtools to allow installation from GitHub
if (!require("devtools")) install.packages("devtools")

#Install DEvis from GitHub repository.
devtools::install_github("price0416/DEvis/DEvis")

#Load the package.
library(DEVis)
```

## Documentation:

For a complete usage tutorial, [see the vignette](https://github.com/price0416/DEvis/blob/master/DEVis/vignettes/DEVis_vignette.pdf).

For technical specifications, [see the DEvis manual](https://github.com/price0416/DEvis/blob/master/DEVis/man/DEVis.pdf).


