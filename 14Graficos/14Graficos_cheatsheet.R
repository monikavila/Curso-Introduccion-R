# Autor: Monika Avila Marquez, Ph.D. 
# Fecha: 12.04.2023
# Objetivo: Data plotting 
# Referencia: Basado en R Programming Fundamentals, StanfordOnline XDFS112
#-----------------------------------------------------------------

library(dplyr)
# Limpiar el espacio de trabajo
rm(list=ls())
#-----------------------------------------------------------------
# Configurar el directorio
#-----------------------------------------------------------------
midirectorio<-setwd("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/14Graficos")
midirectorio

#-----------------------------------------------------------------
# Funcion plot.
#-----------------------------------------------------------------
x<-c(1.9,4.0,4.4,7.2,3.8,8.3,8.7,5.4,8.8)
plot(x) # we only gave one vector, amnd R takes the order as given in the vector

y<-c(8,33,42.6,138.1,28.1,199.5,222.3,66.8,229.7)
plot(x,y) # En este caso tenemos 
plot(x,y,type="l") # En este caso tenemos un grafico que no tiene sentido porque el orden que R esta tomando no es correcto.
# Entonces necesitamos ordenar los valores 
order(x)
plot(x[order(x)],y[order(x)],type='l',col="red")
# Hay muchas mas opciones
?plot
plot(x[order(x)],y[order(x)],type='b',col="red",xlab="x",ylab="y",main="Example",lty=5,pch=4)
plot(x[order(x)],y[order(x)],type='n')
text(x[order(x)],y[order(x)],order(x))

#-----------------------------------------------------------------
# Grid of plots 
#-----------------------------------------------------------------
par(mfrow=c(2,2))
plot(x[order(x)],y[order(x)],type='b',col="purple",pch=2)
plot(x[order(x)],y[order(x)],type='l',col="red",pch=5)
plot(x[order(x)],y[order(x)],type='l',col="red",pch=5,lty=5)
text(x,y,1:9)
par("mfrow")
?par
par(mfrow=c(1,1))
plot(x[order(x)],y[order(x)],type='l',col="red",pch=5,lty=5)

par(mfrow=c(1,2))
plot(x[order(x)],y[order(x)],type='l',col="red",pch=5,lty=5)
plot(x[order(x)],y[order(x)],type='l',col="red",pch=5)

par(mfcol=c(2,1))
plot(x[order(x)],y[order(x)],type='l',col="red",pch=5,lty=5)
plot(x[order(x)],y[order(x)],type='l',col="red",pch=5)

#The function par has the following default parameters 
par()

#-----------------------------------------------------------------
# More about plot function 
#-----------------------------------------------------------------

# If we want to know the different plot functions, we can use apropos.
apropos("plot")
# For time series object, we use plot.ts()
#-----------------------------------------------------------------
# Histograms
#-----------------------------------------------------------------
load("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/datos/procesados/trafico1.Rdata")
head(trafico)
str(trafico)
attach(trafico)
summary(trafico)
autosn=as.numeric(trafico$autos)
hist(autos)
# We do two histograms overlaying 
# Days of the week, and days of the weekend. 
# Weekends: red
hist(autos[day_of_week>5],breaks=seq(5000,16000,by=1000),col=rgb(1,0,0,0.5),xlim=c(5700,16000),ylim=c(0,2000),main="Overlapping Histogramas",xlab="Autos por dia")
# Weekdays: mauve 
hist(autos[day_of_week<6],breaks=seq(5000,17000,by=1000),col=rgb(0,0,1,0.5),add=T)

#-----------------------------------------------------------------
# Boxplots 
#-----------------------------------------------------------------
boxplot(autos)
boxplot(autos~day_of_week)

#-----------------------------------------------------------------
# Barplot
#-----------------------------------------------------------------
meansperday<- trafico %>% 
  group_by(day_of_week) %>% 
  summarise(ave=mean(autos)) %>% 
  arrange()
vectormeans <- meansperday %>% .$ave
vectormeans
pdf("weekbars.pdf") # We can add this line to get the pdf file of our graph
bp=barplot(vectormeans,xlab="Day of the week")
axis(at=bp,labels=c("M","T","W","Th","F","Sa","Su"),side=1)
dev.off()
dir()
?dev.off

# Note: you can use Rmarkdown to get a report 
# No quitar el comentario de la linea inferior. Solamente copiar en la consola para que ejecute 
#rmarkdown::render("14Graficos_cheatsheet.R",c("pdf_document","html_document"))