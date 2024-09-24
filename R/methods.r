# Generic build method
setGeneric("build_tmb", function(object) standardGeneric("build_tmb"))

#' @param object A data object.
#' @return The tmb objective function output
#' @export
# Method building and runnning the tmb model
setMethod("build_tmb", "tmb_list", function(object) {
  tmb.data <<- list() #create in .GlobalEnv
  for(i in names(object@TMB$data)){
    tmb.data[[i]] <<-  object@TMB$data[[i]]
  }
  parameters <<- list()
  for(i in names(object@TMB$parameters)){
    parameters[[i]] <<-  object@TMB$parameters[[i]]
  }
  #pass function to global environment
  environment(f) <- .GlobalEnv
  obj <- RTMB::MakeADFun(f,
                         parameters)
  opt <- nlminb(obj$par, obj$fn, obj$gr)

  object@TMB$obj <- obj
  object@TMB$opt <- opt
  return(object)  # Return the updated object with results
})
