#PARÁMETROS CONFIGURABLES
porcentaje_valores_faltantes = 10
numero_columnas_reemplazar = 2

#Ruta donde se encuentran el dataset.
fileName = "C:/INTELIGENCIA DE NEGOCIOS/PRACTICA DATOS FALTANTES/iris/iris.data"
#fileName = file.choose()

#Cargar datos
data_original = read.table(fileName, sep=",", dec=".", na.strings = "?", header = FALSE)
data = data_original

#Definir el tamaño de variables y observaciones del conjunto de datos.
#Restar 1 por qué la última variable es categórica.
n_variables = ncol(data) - 1
n_observaciones = nrow(data)

#Calcular el número de observaciones a modificar según el porcentaje definido.
n_observaciones_modificar = as.numeric(n_observaciones*porcentaje_valores_faltantes/100)
#Indices de las columnas o variables que serán modificadas.
indices_columnas_modificar = sample(n_variables, numero_columnas_reemplazar, replace=FALSE)

#Modificar los valores de los registros por un valor nulo o faltante (NA).
for (indice_col in indices_columnas_modificar){
  indices_observaciones_modificar = sample(n_observaciones, n_observaciones_modificar, replace=FALSE)
  data[indices_observaciones_modificar, indice_col] = NA
}

#Calcular los porcentajes correspondientes a los valores faltantes:
porcentaje_faltante_columnas = 100*colSums(is.na(data[, ]))/n_observaciones
porcentaje_faltante_general = length(indices_columnas_modificar)/n_observaciones

#Gráfico que muestra el porcentaje de valores faltantes según el índice de la columa
barplot(porcentaje_faltante_columnas, names.arg = as.character(names(porcentaje_faltante_columnas)),
        space = 0 , col = 5 , main="VALORES FALTANTES", sub  = "" ,
        xlab  = "Columnas", ylab = "Valores faltantes (%)")
