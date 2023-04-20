# Autor: Monika Avila Marquez, Ph.D. 
# Fecha: 11.04.2023
# Referencia: Basado en R Programming Fundamentals, StanfordOnline XDFS112
# Objetivo: manipular datos categoricos
  #Factores o variables categoricas
#-----------------------------------------------------------------

rm(list=ls())
#-----------------------------------------------------------------
# Configurar el directorio
#-----------------------------------------------------------------
midirectorio<-setwd("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/7VariablesCategoricas")
midirectorio

# Ejemplo de variables categoricas

# Manera incorrecta de crear una variable factorial 
# Ejemplo: variable genero con 1: Mujer, 0: Hombre
studentg<-c(rep(1,10),rep(0,15))
# Tabla unidireccional
table(studentg)
summary(studentg)
# Problema? Creamos la variable factorial como una variable numerica, y 
# en realidad no podemos obtener estadisticas descriptivas que tengan un
# significado correcto.  No podremos estudiar las caracteristicas de la distribucion de genero en los estudiantes

# Manera correcta de crear una variable factorial 
gender<-factor(c(rep("F",10),rep("M",15)))
gender
 # La function factor nos permite crear variables factoriales
  ?factor
 # Los beneficios de utilizar este tipo de datos es que nos permite evitar confusiones 
 # cuando se incluye en una regresion. 
# Ahora, la funcion sumary nos da una tabla unidireccional con las frecuencias absolutas   
 summary(gender)
 str(gender)
 levels(gender)
 
 # No quitar el comentario de la linea inferior. Solamente copiar en la consola para que ejecute 
 #rmarkdown::render("7VariablesCategoricas_cheatsheet.R",c("pdf_document","html_document"))