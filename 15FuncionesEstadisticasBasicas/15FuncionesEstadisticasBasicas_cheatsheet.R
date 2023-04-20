# Autor: Monika Avila Marquez, Ph.D. 
# Fecha: 12.04.2023
# Objetivo: 
# Referencia: Basado en R Programming Fundamentals, StanfordOnline XDFS112
#-----------------------------------------------------------------

require(ggplot2)
library(dplyr)
# Limpiar el espacio de trabajo
rm(list=ls())
#-----------------------------------------------------------------
# Configurar el directorio
#-----------------------------------------------------------------
midirectorio<-setwd("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/15FuncionesEstadisticasBasicas")
midirectorio


# Establecer la semilla
set.seed(1)
#-----------------------------------------------------------------
# Generara numeros aleatorios
#-----------------------------------------------------------------
? Distributions

# Distribucion uniforme 
unifnum=runif(10000,0,1)
hist(unifnum,freq=F)
summary(unifnum)
# Cambiar el intervalo a -10,10

# Para simulaciones es mejor utilizar  replicate(), apply(), tambien es mejor usar funciones que ya han sido codificadas
reps=10000
system.time(x1<-colSums(matrix(runif(100*5),nrow=5)))
system.time(x1<-apply(matrix(runif(100*5),ncol=5),2,sum))
system.time(x1<-lapply(1:reps,function(i){sum(runif(n=5))}))
system.time(x1<-sapply(1:reps,function(i){sum(runif(n=5))}))
system.time(sum5<-replicate(reps,sum(runif(5))))
d5=data.frame(sum5)
summary(sum5) # Simetrica, media y mediana iguales. 
# Para usar ggplot2, primero hay que declarar dataframe y la variable 
#luego el tupo de grafico.
ggplot(d5,aes(sum5))+geom_histogram(aes(y=..density..),binwidth=0.1,color="blue",fill="red")
?geom_histogram


# Distribucion normal
normnum=rnorm(10000,0,1)
dn=data.frame(normnum)
hist(normnum,freq=F)
summary(normnum)
ggplot(dn,aes(normnum))+geom_histogram(aes(y=..density..),binwidth=0.1,color="blue",fill="red")
# Cambiar parametros a mu=1, sigma=10

# Comparar distribuciones:  Cuantil Cuantil plot (qqplot)
?qqnorm
qqnorm(normnum)
# Podemos ver que la linea tiene un efecto de borde en las colas, esto es normal y causado por la generacion 
# aleatoria. Lo que buscamos son desviaciones en el medio: si este es el caso los datos no son distribuidos como normales. 
qqnorm(sum5)
qqnorm(unifnum)
ggplot(data.frame(sum5),aes(sample=sum5))+geom_point(stat="qq")
# En este caso la distribucion teorica esta centrada en 0  pero la distribucion muestral en 2.5
# Se puede corregir de la siguiente manera. 
ggplot(data.frame(sum5),aes(sample=sum5))+stat_qq(distribution=qnorm,dparams=list(mean(sum5),sd(sum5)))
# Histograms con la funcion de densidad de probailidad de la normal
ggplot(data.frame(sum5),aes(x=sum5))+geom_histogram(aes(y=..density..),binwidth=0.1)+stat_function(fun=function(x) dnorm(x,mean=2.5,0.66),color="red",size=1)
ggplot(data.frame(unifnum),aes(x=sum5))+geom_histogram(aes(y=..density..),binwidth=0.1)+stat_function(fun=function(x) dnorm(x,mean=2.5,0.66),color="red",size=1)

# Testeo
?htest
?t.test
# Ejemplo
?sleep
head(sleep)
attach(sleep)
# Crear variables 
difsleep=extra[group==2]-extra[group==1]
boxplot(difsleep,horizontal = T)
result.t=t.test(difsleep)
# Rechazamos la Ho, a NS of 5%, 10%, 1%. 
# Problemsa: numero de observaciones bajo porlo que no podemos 
# testear los supuestos del test. 
# t-test (normalidad, homoscedasticidad)
class(t.test)
?t.test # ver argumentos y resultados de la funcion
result.t
class(result.t) # Clase disenada para  test de hipotesis. 
# Podemos ver que el resultados es una lista, entonces podemos acceder los valores que necesitamos usando listas
result.t$p.value
str(result.t)
t.test(extra~group,paired=TRUE)
 #Obtenemos un estadistico t que es negativo porque se toma la diferencia entre G1 y G2 mientras que R toma la differencia entre G1 y G2
t.test(extra~group,paired=FALSE) # Aqui no tomamos en cuenta que son los mismos estudiantes y por lo tanto perdemos poder.
# Tener los mismos estudiantes aumenta el poder 
# Hay que tener en cuenta el diseno de experimento

#  Testear grupos multiples 
load("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/datos/procesados/birthn.Rdata")
birthn[1:6,]
# Agrupar datos por dia 
library(dplyr)
sumsperday<-birthn%>% group_by(day_of_week) %>% summarise(sum=sum(births)) %>% arrange()
sumsperday
# Testear si hay la misma probailidad de nacimiento en cada dia.
# Supuestos:independencia entre dias y nacimientos
res=chisq.test(sumsperday[,2])
str(res)

# Regresion
install.packages("HistData")
library(HistData)
?Galton
head(Galton)
attach(Galton)
plot(child,parent)
# Los datos no se han obtenido de manera continua, lo que conduce a una perdida de precision.

hist(parent)
# Al aumentar la anchura de clase, se ve el problema
hist(parent,20)
hist(child,60)
# Vamos a corregir utilizando la funcion jitter
plot(jitter(parent,3),jitter(child,3),pch=19,col="orange")
# Ahora observamos elipsoides que se deben a la distribucion normal en ambas direcciones. 

cor(parent,child)
# Correlacion importante
# Hay un componente genetico
linearreg<-lm(child~parent)
summary(linearreg)
class(linearreg)
?lm
names(linearreg)
linearreg$residuals
plot(linearreg)

plot(jitter(parent,3),jitter(child,3),pch=19,col="orange")
#lines(parent,linearreg$fitted.values,col="red",lwd=3)
lines(parent,linearreg$fitted,col="red",lwd=3)
