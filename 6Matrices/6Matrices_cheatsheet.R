# Fecha: 11.04.2023
# Referencia: Basado en R Programming Fundamentals, StanfordOnline XDFS112
# Objetivo: manipular datos que NO son heterogeneos 
# Matrices: permite almacenar datos homogeneos
#-----------------------------------------------------------------

#-----------------------------------------------------------------
# Configurar el directorio
#-----------------------------------------------------------------
midirectorio<-setwd("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/6Matrices")
midirectorio


#-----------------------------------------------------------------
# Creacion de matrices y manipulacion 
#-----------------------------------------------------------------
# La estructura de los datos es tal Estructuramos los datos como individuos en filas, y las columnas se refieren a características
A<-matrix(c(4,2,0,3,1,7,2,8,4,5), # los elementos de datos
          nrow=2, # el número de filas
          ncol=5)  # el número de columnas 
A
# Podemos omitir el argumento ncols 
B<-matrix(c(4,2,0,3,1,7,2,8,4,5), # los elementos de datos
          nrow=2, # el número de filas
)  # el número de columnas 
B
# Podemos pedir que se rellene la matriz primero por filas que por columnas si usamos la opción byrow option
C<-matrix(c(4,2,0,3,1,7,2,8,4,5), # los elementos de datos
          nrow=2,byrow=TRUE # el número de filas
)  # el número de columnas 
C
# Comprueba la clase del objeto
class(C)
class(A)
# Comprueba si es una matriz
is.matrix(A)
# Indexa una fila
A[1,] # Esta fila se considera un vector
A[2,] # Esta fila se considera un vector
# Añade una nueva fila a la matriz
Ac=rbind(A,c(4,7,6,2,1))
# Combinar matrices 
# Combinamos usando rbind, necesitamos que las matrices tengan el mismo número de clumnas.
Ad=rbind(A,Ac)
Ad
# Obtener dimensiones
dim(A)
dim(Ac)
# Combinamos usando cbind, necesitamos que las matrices tengan el mismo número de clumnas.
Ad=rbind(cbind(Ac,Ac))
Ad
# Indexar valores
Ad[3,1]
# Matrices de caracteres 
# Vector de letras
letters
matlet<-matrix(letters,ncol=26,nrow=5) # R está reciclando el vector ¡5 veces!
matlet
matlet2<-matrix(letters,ncol=26,nrow=5,byrow=TRUE) # ¡R recicla el vector 5 veces!
matlet2
# Importante: no podemos combinar números con caracteres o valores lógicos en la misma matriz. 
ncol(matlet2)
?array
# La generalización de una matriz es un array que tiene más de 2 dimensiones.  Podemos tener matrices de 3 dimensiones
# matrices, por ejemplo mediciones en el tiempo.

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
write.table(matH2,file="matH2.txt") # Guardar en ascii formato que podemos inspeccionar sin necesidad de R 
file.show("matH2.txt")
# Transponer matrices 
A
t(A)
# Util cuando la base de datos se encuentra invertida (filas para variables, columnas para individuos). 
# Si salimos de R, y queremos cargar el archivo guardado en formato Rdata
rm(list=ls())
getwd()
load("matH2.Rdata")

# Otras funciones
# as.matrix()

#-----------------------------------------------------------------
# Ejemplo de matriz
#-----------------------------------------------------------------
mujeres<-as.matrix(women)
# Esta base de datos se encuentra en el paquete datasets
?datasets # Ver que tiene el paquete datasets
?women # Ver la descripción de la base de datos women
class(women)

# No quitar el comentario de la linea inferior. Solamente copiar en la consola para que ejecute 
#rmarkdown::render("6Matrices_cheatsheet.R",c("pdf_document","html_document"))