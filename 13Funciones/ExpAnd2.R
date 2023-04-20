vecd=c(1,2,3)
ExpAnd2<-function(vec=vecd,exponent=2,addition=1){
  ### Function takes a power a vector with  exponent and addition
  # Arguments
  #vec: vector
  #exponent: exponent
  #addition: number to add
  if(any(!is.numeric(c(vec,exponent,addition))))
    stop("One of the arguments is not numeric.")
  return(vec^exponent+addition)
}
