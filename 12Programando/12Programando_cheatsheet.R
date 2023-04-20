# Autor: Monika Avila Marquez, Ph.D. 
# Fecha: 12.04.2023
# Objetivo: Programming
# Referencia: Basado en R Programming Fundamentals, StanfordOnline XDFS112
#-----------------------------------------------------------------


# Limpiar el espacio de trabajo
rm(list=ls())
#-----------------------------------------------------------------
# Configurar el directorio
#-----------------------------------------------------------------
midirectorio<-setwd("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/12Programando")
midirectorio
# Obetener los archivos disponibles en el directorio
#dir()
#list.files()
# Importar datos
datos<-load("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/datos/procesados/births1.Rdata")
head(births)
summary(births)

# Declaraciones logicas 
# 1. Obtener subconjuntos de los datos  
  # EQUIDAD ==
  # 1.1 Obtener datos solo para los viernes
  birthsFriday<-births[which(births[,4]==5),]
  # Primero, otenemos los booleanos que muestran cuando es viernes.
  births[,4]==5
  # Luego obtenemos los indices cuando el boolean es verdadero
  ? which
  which(births[,4]==5)
  # Luego, obtenemos el sub conjunto utilizando los indices
  birthsFriday<-births[which(births[,4]==5),]
  # Ahora, queremos solo el dia 12 del mes
  birthsFriday12<-birthsFriday[which(birthsFriday[,3]==12),]
  birthsFriday12
  # INEQUIDAD !=
  # Ejemplo: Los viernes que no fueron el 12
  notbirthsFriday12<-birthsFriday[which(birthsFriday[,3]!=12),]
  notbirthsFriday12
  nrow(birthsFriday12)+nrow(notbirthsFriday12)
  nrow(birthsFriday)
  # EQUIDAD con un intervalo %in%
  birthsWeekends<-births[which(births[,4] %in% c(6,7)),]
  birthsWeekends
  nrow(birthsWeekends)
  # INEQUIDAD <,>
  birthsWeekends2<-births[which(births[,4] >5),]
  birthsWeekends2
  nrow(birthsWeekends2)
  # Mayor o igual >=
  birthsWeekends3<-births[which(births[,4] >=6),]
  birthsWeekends3
  nrow(birthsWeekends3)
  # Menor o igual <=
  birthsWeekday<-births[which(births[,4] <=5),]
  birthsWeekday
  nrow(birthsWeekday)
  # Valores perdidos is.na()
  is.na(births)

# Condiciones y direcciones 
  # 1. Condicion si
  # Structura: 
  #if (condition) {
  #  Do something
  #} else {
  #  do something else
  #}
  
  if (mean(birthsWeekends[,5])>mean(birthsWeekday[,5])){
    cat("En promedio, hay mas bebes en fines de semana")}else
      {cat("En promedio, mas bebes en dias de semana")}
  
# Loops (Bucles)
  # For loop: iterar una misma actividad en secuencia
  # Structura
  #for(i in 1:K){
  #Repetir algo K veces
  #}
  # Ejemplo 1 
  for(i in 1:10){
    print(i)
  }
  # Ejemplo 2
  A=matrix(rnorm(200),nrow=5)
  # obtener el valor maximo de cada columna de A y guardarlo al final del loop
  # matrix para guardar los maximos
  Amax=rep(0,100/5)
 for(i in 1:length(Amax)){
    Amax[i]<-max(A[,i])
  }
  # Problem: este metodo es secuencial, por lo que es lento.
  # Solucion: version vectorizada utilizando funciones apply
  ?apply
  # Obtener todas las funciones que permiten realizar vectorizacion
  apropos("apply")
  # apply permite aplicar funciones a todos las columnas de la matriz
  apply(A,2,max)
  apply(A,1,max)
  apply(A,2,sum)
  system.time(apply(A,1,sum))
  
  # Comparar tiempos
  Abig=matrix(rnorm(20000),nrow=500)
  # obtener el valor maximo de cada columna de A y guardarlo al final del loop
  # matrix para guardar los maximos
  Amax=rep(0,100/5)
  tiempo_loop=system.time(for(i in 1:length(Amax)){
    Amax[i]<-max(Abig[,i])
  })
  tiempovectorizado=system.time(apply(A,2,max))
  
  # No quitar el comentario de la linea inferior. Solamente copiar en la consola para que ejecute 
  #rmarkdown::render("12Programando_cheatsheet.R",c("pdf_document","html_document"))