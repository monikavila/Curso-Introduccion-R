# Autor: Monika Avila Marquez, Ph.D. 
# Fecha: 12.04.2023
# Objetivo: dataframes, explorar datos
# Definicion: data.frame es una lista pero que tiene propiedades de listas y matrices.  Son importantes porque permite 
# almacenar datos categoricos y numericos. En esta lista, tenemos que tener mismo numero 
# de observaciones por compnente o variable.
# Referencia: Basado en R Programming Fundamentals, StanfordOnline XDFS112
#-----------------------------------------------------------------

# Limpiar el espacio de trabajo
rm(list=ls())
#-----------------------------------------------------------------
# Configurar el directorio
#-----------------------------------------------------------------
midirectorio<-setwd("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/9Dataframes")
midirectorio

#-----------------------------------------------
# Instalar paquetes y cargar paquetes
#-----------------------------------------------
# install.packages("MASS") (Nota: despues de instalar por primera vez, podemos
# comentar esta inea.  No hay necesidad de instalar el paquete todas las veces, a menos que 
# queramos realizar una actualizacion. 
library(MASS)

#-----------------------------------------------
# Cargar datos
#-----------------------------------------------
# Ver las bases de datos que estan cargadas en nuestro espacio de trabajo de R
data()
# Vamos a utilizar UScereal
?UScereal # Obtener una descripcion de la base de datos
head(UScereal) # Ver las primeras observaciones.
UScereal[10:14,7:11] # Ver las observaciones 10 a 14, y las variables 7 a 11.
UScereal[1:10,1:6] # Ver las observaciones 1 a 10, y las variables 1 a 6.
class(UScereal) # UScereal es de tipo dataframe.  Nos permite combinar diferentes tipos de datos

# Podemos ver que esta base de datos contiene variables categoricas y variables numericas 
summary(UScereal)
str(UScereal$mfr)
str(UScereal$vitamins)
# Notar que para variables categoricas tenemos informacion diferente que
# para variables continuas 

# UScereal es un dataframe, pero tambien una lista.  A pesar de ello, puede 
# ser indexada como una matriz
class(UScereal)
?data.frame
str(UScereal)
# data.frame tiene propiedades de listas y matrices. 
# Indexar items en un data frame 
UScereal$mfr
names(UScereal)
UScereal[[1]]
UScereal[,1]
# Obtener dimensiones 
dim(UScereal)
# La funcion plot me da una matriz de dispersion
plot(UScereal)
plot(UScereal[,1:4])
length(UScereal)
# Importante! ggplot2 solamente puede trabajar con dataframes (marco de datos)
# Otras funciones
# as.data.frame()

# No quitar el comentario de la linea inferior. Solamente copiar en la consola para que ejecute 
#rmarkdown::render("9DataFrames_cheatsheet.R",c("pdf_document","html_document"))