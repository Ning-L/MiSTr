% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mist.R
\name{mist}
\alias{mist}
\title{mist}
\usage{
mist(
  y,
  X,
  G,
  Z,
  method = "liu",
  model = c("guess", "continuous", "binary"),
  weight.beta = NULL,
  maf = NULL
)
}
\arguments{
\item{y}{[\link{numeric}] A \code{numeric} vector of the continuous outcome variables. Missing values are not allowed.}

\item{X}{[\link{numeric}] A \code{numeric} matrix of covariates with rows for individuals and columns for covariates.
If there is no covariate, it does not need to be specified}

\item{G}{[\link{numeric}] A \code{numeric} genotype matrix with rows for individuals and columns for SNPs.
Each SNP should be coded as 0, 1, and 2 for AA, Aa, aa, where A is a major allele and a is a minor allele.
Missing genotypes are not allowed.}

\item{Z}{[\link{numeric}] a \code{numeric} matrix of second level covariates for variant characteristics.
Each row corresponds to a variant and each column corresponds to a variant characteristic.
If there is no second level covariates, a vector of 1 should be used.}

\item{method}{[\link{character}] A method to compute the p-value and the default value is "liu".
Method "davies" represents an exact method that computes the p-value
by inverting the characteristic function of the mixture chisq.
Method "liu" represents an approximation method that matches the first 3 moments.}

\item{model}{[\link{character}] A \code{character} vector specifying the model. Default is to \code{"guess"}.
Possible choices are \code{"guess"}, \code{"continuous"} (linear regression) or \code{"binary"} (logistic regression).}

\item{weight.beta}{[\link{numeric}] A \code{numeric} vector of parameters of beta function
which is the weight for scorestatistics.
The default value is \code{NULL}, \emph{i.e.} no weight.
Default weight value could be \code{c(1, 25)}.}

\item{maf}{[\link{numeric}] A \code{numeric} vector of MAF (minor allele frequency) for each SNP.}
}
\value{
\itemize{
\item S.tau score Statistic for the variant heterogeneous effect.
\item S.pi score Statistic for the variant mean effect.
\item p.value.S.tau P-value for testing the variant heterogeneous effect.
\item p.value.S.pi P-value for testing the variant mean effect.
\item p.value.overall Overall p-value for testing the association between the set of SNPS/genes and outcomes.
It combines p.value.S.pi and p.value.S.tau by using Fisher's procedure.
}
}
\description{
Test for association between a set of SNPS/genes and continuous outcomes by
including variant characteristic information and using score statistics.
}
\examples{

library(MiSTr)
data(mist_data)
attach(mist_data)

mist(
  y = phenotypes[, "y_taupi"],
  X = phenotypes[, paste0("x_cov", 0:2)],
  G = genotypes,
  Z = variants_info[, 1, drop = FALSE]
)

mist(
  y = phenotypes[, "y_binary"],
  X = phenotypes[, paste0("x_cov", 0:2)],
  G = genotypes,
  Z = variants_info[, 1, drop = FALSE]
)

}
