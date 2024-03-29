% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/invChat.R
\name{estimateD}
\alias{estimateD}
\title{Compute species diversity with a particular level of sample size/coverage}
\usage{
estimateD(
  x,
  q = c(0, 1, 2),
  datatype = "abundance",
  base = "size",
  level = NULL,
  nboot = 50,
  conf = 0.95
)
}
\arguments{
\item{x}{a \code{matrix}, \code{data.frame} (species by sites), or \code{list} of species abundances or incidence frequencies.\cr 
If \code{datatype = "incidence_freq"}, then the first entry of the input data must be total number of sampling units, followed 
by species incidence frequencies in each column or list.}

\item{q}{a number or vector specifying the diversity order(s) of Hill numbers.}

\item{datatype}{data type of input data: individual-based abundance data (\code{datatype = "abundance"}),
sampling-unit-based incidence frequencies data (\code{datatype = "incidence_freq"}) or species by sampling-units incidence matrix (\code{datatype = "incidence_raw"}).}

\item{base}{comparison base: sample-size-based (\code{base="size"}) or coverage-based \cr (\code{base="coverage"}).}

\item{level}{a sequence specifying the particular sample sizes or sample coverages(between 0 and 1). 
If \code{base="size"} and \code{level=NULL}, then this function computes the diversity estimates for the minimum among all double reference sample sizes. 
If \code{base="coverage"} and \code{level=NULL}, then this function computes the diversity estimates for the minimum among all the coverage values for samples extrapolated to double the reference sample sizes.}

\item{nboot}{the number of bootstrap times to obtain confidence interval. If confidence interval is not desired, use 0 to skip this time-consuming step; default is 50.}

\item{conf}{a positive number < 1 specifying the level of confidence interval; default is 0.95.}
}
\value{
a \code{data.frame} of species diversity table including the sample size, sample coverage,
method (rarefaction or extrapolation), and diversity estimates with the user-specified diversity orders (q values) and specified sample size or sample coverage.
}
\description{
\code{estimateD}: computes species diversity (Hill numbers with q = 0, 1 and 2) with a particular user-specified level of sample size or sample coverage.
}
\examples{
data(spider)
out1 <- estimateD(spider, q = c(0,1,2), datatype = "abundance", base="size")
out1
\dontrun{
out2 <- estimateD(spider, q = c(0,1,2), datatype = "abundance", base="coverage")
out2

data(ant)
out <- estimateD(ant, q = c(0,1,2), datatype = "incidence_freq", base="coverage", 
                 level=0.985, conf=0.95)
out
}
}
