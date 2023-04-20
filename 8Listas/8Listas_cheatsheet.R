# Autor: Monika Avila Marquez, Ph.D. 
# Fecha: 11.04.2023
# Referencia: Basado en R Programming Fundamentals, StanfordOnline XDFS112
# Objetivo: manipular datos que son heterogeneos (numericos, caracteres, booleano)
# Definiciones: 
  #Listas son un metodo de combinar diferentes tipos de datos
#-----------------------------------------------------------------

rm(list=ls())
#-----------------------------------------------------------------
# Configurar el directorio
#-----------------------------------------------------------------
midirectorio<-setwd("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/8Listas")
midirectorio

#-----------------------------------------------------------------
# Ejemplo de lista
#-----------------------------------------------------------------
load("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/6Matrices/matH2.Rdata")

# Si no guardo esta matriz, puede crearla usando el codigo siguiente (No olvide quitar los simbolos de comentario)
# Datos como matriz
# Crear conjunto de datos
observNames<-c("I1", "I2")
vbleNames<-c("v1","v2")
class(vbleNames)
vecH<-rnorm(4)
matH<-matrix(vecH,nrow=2)
rownames(matH)<-observNames
colnames(matH)<-vbleNames
dim(matH)
length(colnames)
length(vbleNames)
vecH2<-runif(4)
matH2<-matrix(vecH2,nrow=2)
dimnames(matH2)<-list(observNames,vbleNames)
str(matH2)
class(matH2)
summary(matH2) # Sabe qué tipo de unción utilizar a partir del tipo de objeto.
# Así, R puede ser considerado como un lenguaje OO.
?summary
?summary.matrix
plot(matH2) # Tomará las dos primeras columnas de la matriz
?plot
# Nota: list es para combinar objetos que no son del mismo 
# tipo o longitud.  Podemos combinar objetos que no son homogéneos.
list.dirs()
# Guardar matriz 
save(matH2,file="matH2.Rdata") # Guardar en formato binario que solo R puede leer
#Los nombres de las columnas y filas de nuestra matriz matH2 son una lista

# Obtener nombres de columnas y filas
class(dimnames(matH2))
dimnames(matH2)
# Obtener nombres de filas
dimnames(matH2)[[1]]
# Cambiar nombre de una fila
dimnames(matH2)[[1]][1]="H10"
dimnames(matH2)[[1]] # Verificar el cambio

#-----------------------------------------------------------------
# Crear una lista complicada con diferentes componentes 
#-----------------------------------------------------------------
A<-matrix(c(4,2,0,3,1,7,2,8,4,5), # the data elements
          nrow=2, # the number of rows
          ncol=5)  # the number of columns 
lista1=list(name="mokametrics",bydate=1125,Amatrix=A,size=5.5,urban=FALSE)
lista1 # Esta lista tiene componentes con diferentes nombres que nosotros hemos asignado.  
# 2 metodos para acceder los componentes de la lista
# Metodo 1
lista1$name
# Metodo 2
lista1[[1]]
# Ver los nombres de los componentes de la lista
names(lista1)
# Este tipo de listas son utilies para funciones mas sofisticadas 

# Ejemplo, los resultados de la funcion lm son una lista. Podemos
# acceder todos los componentes de esta lista
data(women)
attach(women)
rs<-lm(weight~height)
rs
summary(rs)
# rs es mas que eso, es una lista que contiene varios componentes 
names(rs)
# De nuevo, podemos acceder estos componentes utilizando dos metdosos
rs$fitted.values
rs[[5]]
rs$rank
rs[[4]]
rs$call
rs[[10]]


# No quitar el comentario de la linea inferior. Solamente copiar en la consola para que ejecute 
#rmarkdown::render("8Listas_cheatsheet.R",c("pdf_document","html_document"))