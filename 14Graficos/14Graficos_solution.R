library(gtools)

# Ordered data frame
eps<-rnorm(10)
x<-c(1:10)
y<-x*0.1+eps
ordereddf=data.frame(x,y)

# Unordered data frame
permutation_order<-permute(c(1:10))
x2<-x[permutation_order]
eps2<-eps[permutation_order]
y2<-x2*0.1+eps2
unordereddf=data.frame(x2,y2)
# Time series data frame
yts=ts(y)
df=data.frame(yts)

par(mfrow=c(1,3))
# Plot ordered data
plot(ordereddf$x,ordereddf$y,type="l")
# Plot unordered data
plot(unordereddf$x2,unordereddf$y2,type="l")
# Plot unordered data but as time series
plot(df$yts,type="l")

View(ordereddf)
View(unordereddf)
View(df)
