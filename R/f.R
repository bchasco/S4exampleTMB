#Model function
f <- function(parms){
  RTMB::getAll(tmb.data,
               parms)
  nll <- -sum(RTMB::dnorm(y, beta, exp(sigma),log=TRUE))
  return(nll)
}
