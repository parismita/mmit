% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mmit.cv.R
\name{mmit.cv}
\alias{mmit.cv}
\title{The Cross Validation of Max Margin Interval Tree}
\usage{
mmit.cv(feature.mat, target.mat, param_grid = NULL, n_folds = 3,
  scorer = mse, pruning = TRUE, future.seed = FALSE)
}
\arguments{
\item{feature.mat}{a data frame containing the feature variables in the model.}

\item{target.mat}{The response variable of the model}

\item{param_grid}{the list of paramaters}

\item{n_folds}{The number of folds}

\item{scorer}{The Loss calculation function (default loss function: MSE)}

\item{n_cpu}{The number of cores to register for parallel programing of the code, default value is 1 and n_cpu = -1 to select all cores.}

\item{pruning}{Boolean whether pruning is to be done or not.}

\item{future.seed}{A logical or an integer (of length one or seven), or a list of length(X) with pre-generated random seeds.}
}
\value{
The list consist of best score, best tree, best parameters and list of all parameter values with cross validation score .
}
\description{
Performing grid search to select the best parameters via cross validation on the  a regression tree for censored data.
}
\examples{
library(mmit)
target.mat <- rbind(
  c(0,1), c(0,1), c(0,1),
  c(2,3), c(2,3), c(2,3))

feature.mat <- rbind(
  c(1,0,0), c(1,1,0), c(1,2,0),
  c(1,3,0), c(1,4,0), c(1,5,0))

colnames(feature.mat) <- c("a", "b", "c")
feature.mat <- data.frame(feature.mat)

param_grid <- NULL
param_grid$max_depth <- c(Inf, 4, 3)
param_grid$margin <- c(2, 3, 5)
param_grid$min_sample <- c(2, 5, 10)
param_grid$loss <- c("hinge")

set.seed(1)
result <- mmit.cv(feature.mat, target.mat, param_grid, scorer = mse, future.seed = TRUE)

}
\author{
Toby Dylan Hocking, Alexandre Drouin, Torsten Hothorn, Parismita Das
}
