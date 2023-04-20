# Autor: Monika Avila Marquez, Ph.D. 
# Fecha: 11.04.2023
# Referencia: Basado en R Programming Fundamentals, StanfordOnline XDFS112
# Objetivo: Data wrangling
#-----------------------------------------------------------------
midirectorio<-setwd("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/11GestionDatos")
midirectorio

# I. Valores faltantes: se denotan en R por NA, hay que tener cuidado porque en otros softwares se denotan como 99999.
# Esto puede crear problemas. 

 NA

# Crear ejemplo
vectorna<-c(1,2,NA,"2")
vectorna

# Como determinar si hay valores faltantes? 

# Incorrecto:

# Usar expresiones del tipo

NA==NA 
NA+1
NA^2
NA/0
NA^0
NA*0
1/NA

# Correcto:
# Para determinar si hay valores faltantes, podemos utilizar la funcion is.na
?is.na
is.na(vectorna)

# Obtener el promedio de este vector
mean(vectorna)
# En este caso, la funcion mean nos da NA porque: 1. tenemos un dato faltante NA, 2. un valor que esta registrado como string.


# Otro ejemplo
vectorna2<-c(2,2,NA,2)
vectorna2


# Soluciones a la presencia de valores faltantes

# (Importante: esto solo se puede hacer si los valores faltantes son valores faltantes aleatoriamente, hay mejores tecnicas pero
# esto esta fuera del alcance de este curso)

# 1. No tomar en cuenta los valores faltantes.
mean(vectorna2,na.rm=T)
?mean

# 2. Reemplazar los valores faltantes 
# Opcion 1: Utilizar un vector de variables booleanas, de manera que se reemplza por cierto valor cuando
# la variable boolena es igual a 1.
vectorna2corrected=vectorna2
vectorna2corrected[is.na(vectorna2)]<-0 
vectorna2corrected

# II. Valores inf: inf significa que es indefinido o infinito
1/0
1/0+1
1/0^1
mean(c(1/0,4))
1/0-1/0 # NaN not a number 


# III. Imputar datos
# Podemos utilizar el paquete mice
install.packages("mice")
library(mice)
data("mammalsleep")
head(mammalsleep)
dim(mammalsleep)
# Determinar numero de casos faltantes 
?nic
nic(mammalsleep)
# Determinar el patron de datos faltantes 
md.pattern(mammalsleep)
?md.pattern
# Se puede ver que 42 casos estan completos. WSe puede ver que no hay bloques,lo que podria decir si 
# los valores faltantes son al azar.
# Que hacer?
# 1. Eliminar todos los casos faltantes, pero podriamos terminar con una muestra bastante pequena
# En este caso 30% de los datos. 
# 2.  Imputar datos
?mice
inputed<-mice(mammalsleep) # proceso iterativo que obtiene promedios locales
head(inputed) # Tenemos la base de datos original, y los valores imputados. 
?mice
names(inputed)
str(inputed)
# Este tema es delicado, y se necesita mayor conocimiento estadistico. 

# IV. Detectando outliers (Valores extermos)
?mammalsleep
summary(mammalsleep)
# Vemos que en el caso del peso (bw), hay valores bastante altos. 
mammalsleep[which.max(mammalsleep$bw),]
# En este caso, se cree que es un valor correcto.  Preo podems encontrar un  99999 que significa que es un valor faltante en otro programa
# Se necesita documentar esto explicando: 
# valores extremos, y si son correctos o no. 

# V.  Interactuando con datos
# Obtener una sub muestra para ver si hay algunos patrones. 
s=sample(62,10)
mammalsleep[s,]

# No quitar el comentario de la linea inferior. Solamente copiar en la consola para que ejecute 
#rmarkdown::render("11GestionDatos_cheatsheet.R",c("pdf_document","html_document"))