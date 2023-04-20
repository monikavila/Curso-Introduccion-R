# Autor: Monika Avila Marquez, Ph.D. 
# Fecha: 12.04.2023
# Objetivo: Importar datos que no estan en R de excel, csv, etc.
# Referencia: Basado en R Programming Fundamentals, StanfordOnline XDFS112
#-----------------------------------------------------------------

# Limpiar el espacio de trabajo
rm(list=ls())
#-----------------------------------------------------------------
# Configurar el directorio
#-----------------------------------------------------------------
midirectorio<-setwd("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/10ImportarDatos")
midirectorio
# Obetener los archivos disponibles en el directorio
dir()
list.files()
#-----------------------------------------------------------------
# Importar datos en R 
#-----------------------------------------------------------------
# 1. Archivo txt (archivo tipo ascii, con extension .txt): este tipo. de archivo es lisible por humanos pero otros tipo 
# de archivos son mas dificiles de leer.
  # Ver el archivo
    #file.show("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/datos/creados/matH2.txt") 
  # Importar los datos
    datostxt<-read.table("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/datos/creados/matH2.txt") 
  # Ver los datos
    datostxt
  # Ver que tipo de datos es 
    class(datostxt)
    str(datostxt)
    is.matrix(datostxt)
    # We call this a tidy table because each row is an observation and each column is a variable
# 2. Archivo csv (comma separated variables): la ventaja es que se puede ver 
    #este archivo en R
    ?dir
    dir("datos/raw")
    # Ver los datos
    file.show("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/datos/raw/Haplotype.csv") 
    # Importar datos
    ?read.csv # Default para el separadores ,
    Hap<-read.csv("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/datos/raw/Haplotype.csv") 
    head(Hap)
      # Debugging read.csv output
      # Problema, el nombre de las filas es considerado como una variable 
      # llamada individual, pero inicialmente este es solamente un identificador
      # Para evitar esto, podemos poner las opciones de rownames, y colnames.
    Hap1<-read.csv("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/datos/raw/Haplotype.csv",row.names = 1) 
    head(Hap1)  
    # Ahora, ya no tenemos la variable individual como variable factor. 
    # Utilizar la funcion scan
    scan("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/datos/raw/Haplotype.csv",nlines=5,what="") 
    ?scan
# 3. Archivo Excel con extensiones .xlsx, o .xls
    #install.packages("readxl")
    library(readxl)
    ?read_excel
    Hap2<-read_excel("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/datos/raw/Haplotype.xlsx")
    str(Hap2)
    class(Hap2)
    # read_excel uploads the data in a different format, and we can just convert it to dataframe
    # Convert it to a data frame
    Hap2df<-as.data.frame(Hap2)
    str(Hap2df)
# 4. Importar datos de otros softwares 
    #install.packages("foreign")
    library(foreign)
    # spss .sav, read.spss
    # stata .dta, read.dta
    ?read.dta
# 5. Scraping la web y leyendo datos direcatmente (se necesita conexion al internet)
    # Datos que vienen de un Github
    births<-read.csv(url("https://raw.githubusercontent.com/fivethirtyeight/data/master/births/US_births_2000-2014_SSA.csv"))
    head(births)
    # Nota: Scraping datos con paquete rvest 
# Bonus: Guardar acrhivo
    write.csv(births,file="~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/datos/procesados/births1.csv")
    file.show("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/datos/procesados/births1.csv")
    # Mejores practicas creando archivos de datos: no espacios en nombre de variables
    # csv ocupa bastante espacio, se puede crear un archivo binario usando
    # save file en binary R formato
    save(births,file="~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/datos/procesados/births1.Rdata")
    load("~/Dropbox/0.POST-PHD/GOALS/2.CODE/R/Ecomienza/datos/procesados/births1.Rdata")
    # Formato binario de R es mas eficiente y rapido de leer
    # Recursos: R import data 
    # https://cran.r-project.org/doc/manuals/r-devel/R-data.html
    
    # No quitar el comentario de la linea inferior. Solamente copiar en la consola para que ejecute 
    #rmarkdown::render("10ImportarDatos_cheatsheet.R",c("pdf_document","html_document"))