lunetas <- read.csv("Raw_Data/lunetas.csv") #CARGO LA BASE DE DATOS, DONDE VIENE LA CANTIDAD DE CADA LUNETA

lunetas[,2]

lunetasnum <-lunetas[,-1] #ELIMINO LA COLUMNA DE COLORES
lunetasnum <- as.matrix(lunetasnum)#LA HAGO UNA MATRIX

#sum(lunetasnum[,1])

################################FUNCION############ INICIO

#por medio de vectores, X, DEBE DE SER UN VECTOR


shanon <- function(x){
  a <- 1
  valorshan <- 0 #SE ASIGNA UN OBJETO CON VALOR DE CERO, DONDE SE LES IRA AGREGANDO LOS VALORES DE CADA ESPECIE (COLOR)
  
  ###
  #(estrella[1]/sum(estrella))*log10(estrella[1]/sum(estrella))
  # (x[a]/sum(x))*log(x[a]/sum(x))
  #ESTAS SON SOLO PRUEBAS
  
 for (i in 1:length(x)) { #HACE EL CICLO LA CANTIDAD DE COLORES QUE HAY 
 
   pi <- (x[a]/sum(x))*log10(x[a]/sum(x)) #SACA LA PROBABILIDAD Y LUEGO ESA PROBABILIDAD LA MULTIPLLICA POR LOG10(MISMA PROBABILIDAD)
   
  valorshan <- valorshan+pi #AGREGAMOS EL VALOR DEL PRIMERO COLOR A EL OBJETO QUE ESTABA EN CEROS
  
  a<- a+1 #SE SUMA UNO, PARA QUE PUEDA ESCOGER OTRO NUMERO DEL VECTOR
  
  #VA A REPETIR Y EL VALOR QUE SALGA LO AGREGARA A EL OBJETO QUE YA TIENE EL VALOR ANTERIOR Y ASI HASTA COMPLETAR
  #TODAS LAS ESPECIES (COLORES)
 }
   
  print(-valorshan) #SE SIMPRIME EL VALOR FINAL, DONDE YA TIENE TODA LA SUMATORIA Y SE IMPRIME CON UN SIGNO -, PARA PODER
  #VERLO EN POSITIVO
  
  
}
######################################################## FINAL 

estrella <- lunetasnum[,1] #SE EXTRAE LA PRIMERA COLUMNA, QUE CORRESPONDE AL PRIMER LUGAR (NUESTRA BOLSA CON LA ESTRELLA)
estrella



shanon(estrella) #APLICAMOS LA FUNCION ANTERIOR CON NUESTRO VECTOR ESTRELLA

#########################################################
###############################################################################
####### SIMPSON

simpson <- function(x) {
  return ( sum ( (x*(x-1)) / (sum(x)*(sum(x)-1)) ) )
}

# DRFINI UN VECTOR PARA PROBAR LAS FUNCIONES, SELECCIONA LA PRIMERA COLUMNA DE LA BASE DE DATOS
# EN ESTE CASO CORRESPONDE AL ECOSISTEMA DE ESTRELLA
a <- c ( lunetasnum [,1] )

simpson(a)

################################################################################
####### CHAO1

chao1 <- function(x) {
  # SELECCIONA LAS ESPECIE QUE CUMPLEN CON LA CARACTERISTICA DE TENER UNO O DOS INDIVIDUOS, RESPECTIVAMENTE
  s <- which(a==1)
  d <- which(a==2)
  
  # CUENTA CUANTOS CUMPLEN CON ESA CARACTERISTICA, ASI SE OBTIENE EL VALOR DE P DE LA FORMULA
  ls <- length(s)
  ld <- length (d)
  
  # FORMULA PARA EL INDICE DE CHAO1
  # PRIMERO CUENTA EL NUMERO DE ESPECIES QUE HAY, DESPUES UTILIZA EL CONTEO DE SINGLETONES Y DOUBLETONES.
  return ( length(x) + ((ls)^2 / (2*ld)^2) ) # ?
}

# PARA USAR LA FUNCION
chao1 (a)


################################################################################
####### Curva de Whittaker

# ESTA GRAFICA ES TIPO SCATTERPLOT PERO CON PUNTOS, NO CON UNA LINEA CONTINUA
# UTILIZA LOS DATOS DE LA PRIMERA COLUMNA DE LA BASE DE DATOS
# TENDRA COMO TITULO GENERAL "CURVA DE WHITTAKER
# EN EL EJE X LLEVARA UNA LEYENDA QUE INDICA QUE NUMERO DE ESPECIE ES
# EN EL EJE Y ESTA EL NUMERO DE INDIVIDUOS POR ESPECIE

plot(lunetas$estrella, main = "Curva de Whittaker",
     xlab = "Especie", ylab = "Individuos por especie", pch=19)


