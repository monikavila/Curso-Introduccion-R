# Autor: Monika Avila Marquez, Ph.D. 
# Referencia: Basado en R Programming Fundamentals, StanfordOnline XDFS112
#----------------------------------------------------------------------------

# Definir directorio de trabajo
midirectorio<-setwd("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/5Vectores")
midirectorio
# Crear un vector con c
vector1<-c(1,0,2,3)
# Consulte la clase
class(vector1)
# Comprobar si es un vector
is.vector(vector1)
# Unir vectores
vector15vector1<-c(vector1,5,vector1)
# Obtener la longitud del vector
length(vector15vector1)
# Ver que contiene el vector
str(vector15vector1)

# Operaciones con vectores 
# Suma
vector1+10
# Potenciacion
vector1^2
# Cuidado con pedir correctamente sumas matemáticas de vectores
vector2<-c(10,1,20,30)
vector1+vector2
# Puedes equivocarte al sumar vectores no son sumables!
vector1+c(1,2) # ¡No es matemáticamente correcto!
# Multiplicación con escalar
vector1*11
# Multiplicación puntual con otro vector
vector1*vector2
vector1
vector2
# Raíz cuadrada 

# Indexación de vectores: se hace usando corchetes
# Tomar subconjuntos de vectores 
# Acceder al primer elemento
vector1[1]
# Acceder al máximo
# Obtener el índice del valor máximo
vector1
which.max(vector1)
vector1[which.max(vector1)]

# Acceso al mínimo
# Obtener el índice del valor mínimo
vector1
which.min(vector1)
vector1[which.min(vector1)]
# Nota: para las funciones vector redondo, vector cuadrado es para acceder a los elemenos. 
# Si utilizas vector redondo en su lugar, te dará el error de que la función vector1 no se encuentra
# Incorrecto vector1(1)
# Indexar elementos diferentes
vector1
vector1[c(1,3)]
vector1
vector1[1:3]
# Seq permite crear un índice con igual espacio entre elementos 
seq(1,5,by=3)
vector1[seq(1,5,by=3)]
# Obtener un vector de booleanos 
vector1>0
# Obtiene el subvector cuyos elementos son mayores que 0
vector1[vector1>0]
# Elimina un elemento, por ejemplo el elemento 2
vector1[-2]
# Muestreo aleatorio sin reemplazamiento 
# Obtener una muestra igual a 2 
set.seed(1)
a=round(runif(2,1,4))
a
vector1[a]
# Utilizar la función sample
sample(vector1,size=2,replace=FALSE)
sample(vector1,size=2,replace=TRUE)
# Esta función permite crear permutaciones del vector original
sample(vector1,size=4,replace=FALSE)
vector1

# No quitar el comentario de la linea inferior. Solamente copiar en la consola para que ejecute 
#rmarkdown::render("5Vectores_cheatsheet_extendido.R",c("pdf_document","html_document"))
