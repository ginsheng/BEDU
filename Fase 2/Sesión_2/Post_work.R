"1. Inspecciona el DataSet iris_meaniris` disponible directamente en R.
Identifica las variables que contiene y su tipo, asegúrate de que no hayan datos
faltantes y que los datos se encuentren listos para usarse."

data(iris)

ds <- iris

complete.cases(ds)

ds.clean <- ds [complete.cases(ds), ]

head(ds.clean)

"2. Crea una gráfica de puntos que contenga Sepal.Lenght en el eje horizontal,
Sepal.Width en el eje vertical, que identifique Species por color y que el
tamaño de la figura está representado por Petal.Width. Asegúrate de que la
geometría contenga shape = 10 y alpha = 0.5"

library(ggplot2)

graph<-ggplot(ds.clean, aes(x=Sepal.Length, y = Sepal.Width, color=Species, size = Petal.Width)) +
  geom_point(shape = 10, alpha = 0.5)

"3. Crea una tabla llamada iris_mean que contenga el promedio de todas las
variables agrupadas por Species."

library(dplyr)

iris_mean <- ds.clean %>% 
  select (Sepal.Length, Sepal.Width, Species) %>%
      group_by(Species) %>%
        summarise_all(mean)
                  

"4. Con esta tabla, agrega a tu gráfica anterior otra geometría de puntos para
agregar los promedios en la visualización. Asegúrate que el primer argumento de
la geometría sea el nombre de tu tabla y que los parámetros sean shape = 23,
size = 4, fill = \"black\" y stroke = 2. También agrega etiquetas, temas y los
cambios necesarios para mejorar tu visualización."

graph + geom_point (data=iris_mean, size = 4, fill = "black", stroke = 2)
