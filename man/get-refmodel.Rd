% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/refmodel.R
\name{get-refmodel}
\alias{get-refmodel}
\alias{get_refmodel}
\alias{get_refmodel.refmodel}
\alias{get_refmodel.vsel}
\alias{get_refmodel.cvsel}
\alias{get_refmodel.stanreg}
\alias{get_refmodel.brmsfit}
\title{Get reference model structure}
\usage{
get_refmodel(object, ...)

\method{get_refmodel}{refmodel}(object, ...)

\method{get_refmodel}{vsel}(object, ...)

\method{get_refmodel}{cvsel}(object, ...)

\method{get_refmodel}{stanreg}(object, ...)

\method{get_refmodel}{brmsfit}(object, ...)
}
\arguments{
\item{object}{Object based on which the reference model is created. See possible types below.}

\item{...}{Arguments passed to the methods.}
}
\value{
An object of type \code{refmodel} (the same type as returned by \link{init_refmodel}) 
that can be passed to all the functions that
take the reference fit as the first argument, such as \link{varsel}, \link{cv_varsel}, \link{project},
\link[=proj-pred]{proj_predict} and \link[=proj-pred]{proj_linpred}.
}
\description{
Generic function that can be used to create and fetch the reference model structure
for all those objects that have this method. All these implementations are wrappers
to the \code{\link{init_refmodel}}-function so the returned object has the same type.
}
\examples{
\donttest{
### Usage with stanreg objects
dat <- data.frame(y = rnorm(100), x = rnorm(100))
fit <- stan_glm(y ~ x, family = gaussian(), data = dat)
ref <- get_refmodel(fit)
print(class(ref))

# variable selection, use the already constructed reference model
vs <- varsel(ref) 
# this will first construct the reference model and then execute 
# exactly the same way as the previous command (the result is identical)
vs <- varsel(fit) 
}

}
