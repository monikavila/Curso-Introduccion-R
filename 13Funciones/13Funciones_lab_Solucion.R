misuma<-function(n1,n2){
  misuma<-n1+n2
  return(misuma)
}

misuma(1,1)

misuma2<-function(...){
  misuma<-sum(...)
  return(misuma)
}

misuma2(1,1,2)
misuma2(1,1,2,1)
misuma2(1,1,2,10,5,8)
misuma2(1,1,2,10,5,8,1,1,2,10,5,8,1,1,2,10,5,8)
