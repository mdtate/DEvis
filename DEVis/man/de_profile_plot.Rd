% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DE_expr_plots.R
\name{de_profile_plot}
\alias{de_profile_plot}
\title{Visualize gene-wise expression of differentially expressed genes.}
\usage{
de_profile_plot(res_list, filename = "de_profile_plot.pdf",
  sort_choice = "max", specific_genes = "", numGenes = 50,
  theme = 1, customLabels = FALSE, returnData = FALSE)
}
\arguments{
\item{res_list}{A list of DESeq result sets. Results can be calculated individually using DESeq's results() function.
Lists of results can be created by creating a list(result1, result2 ... result_N).}

\item{filename}{Filename for output plot.  Valid extensions are ".pdf" and ".png".
File generation can be turned off using set_output_mode("screen").
Output will be written to the /DE/profile_plots/ directory.}

\item{sort_choice}{Gene selection is based on sorting method in cases where not all genes are displayed.
sort_choice options are: "max", "min", "variance", "max_mean", "min_mean".
"max" sorts genes based on the highest expression level of any single gene in a result set.
In contrast, "max_mean" first calculates mean expression across all result sets and subsequently sorts by maximum mean values.
Min and min_mean function similarly.  Variance sorts genes by highest gene-wise variance in expression,
displaying genes that showed the highest variability across all samples.}

\item{specific_genes}{A character vector of gene names can be passed to this parameter to plot the genes specified. This overrides sorting
and numGene parameters.}

\item{numGenes}{The number of genes to include in this plot.}

\item{theme}{Theme for the layout and color scheme for the plot.  Valid selections are integers between 1-6.}

\item{customLabels}{If customLabels is set to TRUE, the user will be prompted to provide a custom label for each label.}

\item{returnData}{Boolean.  Determines if this visualization should return data used to generate the visualization. Default=FALSE.}
}
\value{
If returnData is true, this function will return a data frame for sort-selected differentially expressed genes
containing gene names and log2 fold-change values relative to the experimental control condition.
}
\description{
This function plots log2 fold-change values for differentially expressed genes for each contrast in
a result set.  The set of genes displayed can be selected by means of several sorting methods.  This makes
it possible to view expression differences from a variety of perspectives.  This function can be applied to
a single or multiple result sets, making it possible to compare expression changes in specific genes across
different experimental conditions.
}
\examples{
\dontrun{

 #This example assumes an experimenal design of ~Condition_Time.

#Prepare a result list.
res.day1 <- results(dds, contrast=c("Condition_Time", "day1_disease", "day1_control"))
res.day2 <- results(dds, contrast=c("Condition_Time", "day2_disease", "day2_control"))
res.day3 <- results(dds, contrast=c("Condition_Time", "day3_disease", "day3_control"))
myResList <- list(res.day1, res.day2, res.day3)

/*
 * Sort data by the highest expression level for any individual gene in any sample.
 * Select the top 50 genes from this sort and visualize them in the plot.
 */
de_profile_plot(res_list=myResList, filename="DE_profile_upReg50.pdf",
                  sort_choice="max",
                  numGenes=50, theme=1, returnData=FALSE)

/*
 * Calculate the mean expression for each gene across all three time points.
 * Sort the data by minimum mean expression, select the top 25 genes,
 * and visualize them in the plot.
 */
de_profile_plot(res_list=myResList, filename="DE_profile_meanDownReg25.pdf",
                  sort_choice="min_mean",
                  numGenes=25, theme=1, returnData=FALSE)


/*
 * Calculate the variance for each gene across all three time points.
 * Sort the data by the highest gene-wise variance, select 30 genes
 * with the highest variance, and visualize them in the plot.
 * Save the data used to generate the plot as highVar_df.
 */
highVar_df <- de_profile_plot(res_list=myResList, filename="DE_profile_highVar30.pdf",
                                sort_choice="variance", numGenes=30, theme=1, returnData=TRUE)

}
}
\keyword{DE}
\keyword{aggregate}
\keyword{expression}
\keyword{fold-change}
\keyword{sort}
\keyword{visualization}
