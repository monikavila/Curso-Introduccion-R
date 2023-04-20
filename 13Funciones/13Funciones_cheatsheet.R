# Autor: Monika Avila Marquez, Ph.D. 
# Fecha: 12.04.2023
# Objetivo: Funciones 
# Referencia: Basado en R Programming Fundamentals, StanfordOnline XDFS112
# Definicion: Programacion funcional divide las tareas en funciones. 
#-----------------------------------------------------------------

# Limpiar el espacio de trabajo
rm(list=ls())
#-----------------------------------------------------------------
# Configurar el directorio
#-----------------------------------------------------------------
midirectorio<-setwd("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/13Funciones")
midirectorio

# Ejemplos de funcion
library(readxl)
# Podemos escribir la funcion para ver que es lo que pasa en esta funcion
read_excel
apply
  # Se ve cuales son los argumentos de la funcion entre parentesis, tambien se puede ver el codigo de la funcion.
# Esto puede ser util si queremos usar esa funcion para construir una propia. 
# Funciones internas no muestran mucho
q


# Crear funciones
# Ejemplo: crear una funcion que exponencia los elementos a la potencia 2 y se suma 1
ExpAnd1<-function(vec,exponent,addition){
vec^exponent+addition  
}
# Esta funcion se la puede:
# 1. Correr el codigo de la funcion, y sera cargada. 
# 1. guardar en un script separado, y despues llamarla desde source.
source("ExpAnd.R")

# Ahora, tratamos de correr la funcion
#ExpAnd()
# me da error porque no declare valores default en la funcion
source("ExpAnd2.R")
z=ExpAnd2(exponent=3,addition=1)

# Mejores practicas para escribir funciones
# 1. Describir la funcion
# 2. Describir argumentos and salidas
# 3. Siempre utilizar return, especialmente si queremos generar varias cosas. 
# Si no usamos return, la funcion va a retornar el ultimo item.
# 4. Debugging(depuracion) usando condiciones if.  Se puede poner limites y mensajes que expliquen el error
m=matrix(c(1,2,3,4,5,6),ncol=2)
z=ExpAnd2(vec=m,exponent=3,addition=0)
#z=ExpAnd2(vec=m,exponent=3,addition="0")
# 5. Podemos pasar argumentos que no esten especificados utilizando ... en la lista de argumentos
# Esto es comun en funciones de graficos
source("ExpAnd3.R")
z=ExpAnd3(vec=m,exponent=3,addition=10,1001)
z
# Base R cheat sheet

# No quitar el comentario de la linea inferior. Solamente copiar en la consola para que ejecute 

# rmarkdown::render("13Funciones_cheatsheet.R",c("pdf_document","html_document"))

