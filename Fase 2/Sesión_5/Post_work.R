"El data frame iris contiene información recolectada por Anderson sobre 50
flores de 3 especies distintas (setosa, versicolor y virginca), incluyendo
medidas en centímetros del largo y ancho del sépalo así como de los pétalos."

"Utiliza 99% de confianza para todas las pruebas, en cada caso realiza el
planteamiento de hipótesis adecuado y concluye"

data(iris)

ds <- iris

complete.cases(ds)

ds.flowers <- ds [complete.cases(ds), ]

ds.flowers$Species <- factor(ds.flowers$Species)

summary(ds.flowers)

ds.setosa <- filter(ds.flowers, ds.flowers$Species == 'setosa')
ds.versicolor <- filter(ds.flowers, ds.flowers$Species == 'versicolor')
ds.virginica <- filter(ds.flowers, ds.flowers$Species == 'virginica')

"Estudios recientes sobre las mismas especies muestran que:"
  
"I. En promedio, el largo del sépalo de la especie setosa (Sepal.Length) es
igual a 5.7 cm"

# Ho: Sepal.Length (de la especie setosa) == 5.7 esta es la hipótesis propuesta
# Ha: Sepal Length (de la especie setosa) != 5.7
?t.test

# Realizando prueba t.student...
t.test(ds.setosa$Sepal.Length, alternative = "two.sided", mu = 5.7)

# O también...
t.test(x = ds.flowers[ds.flowers$Species == 'setosa', "Sepal.Length"],
       alternative = 'two.sided',
       mu = 57)

"Resultado:
One Sample t-test

data:  ds.setosa$Sepal.Length
t = -13.922, df = 49, p-value < 2.2e-16
alternative hypothesis: true mean is not equal to 5.7
95 percent confidence interval:
 4.905824 5.106176
sample estimates:
mean of x 
    5.006"

"Conclusión: A un nivel de confianza de 99% (0.01 de significancia), existe
evidencia estadística para rechazar la hipótesis nula, en favor de la hipótesis
alternativa: La longitud de los sépalos (esas 'hojitas' debajo de los pétalos de
una flor) de las flores de la especie setosa es distinta de 5.7 cms."

"II. En promedio, el ancho del pétalo de la especie virginica (Petal.Width) es
menor a 2.1 cm"

# Ho: Petal.Width (Virginica) ›= 2.1
# Ha: Petal.Width (virginica) ‹ 2.1 * Esta es la hipótesis propuesta (apunta a
# cola inferior)

# Haciendo la prueba...
t.test(ds.virginica$Petal.Width, alternative = 'less', mu = 2.1)
# O también...
t.test(x = ds.flowers[ds.flowers$Species=='virginica', 'Petal.Width'],
       alternative = 'less',
       mu = 2.1)

"Resultado:
One Sample t-test

data:  ds.virginica$Petal.Width
t = -1.9052, df = 49, p-value = 0.03132
alternative hypothesis: true mean is less than 2.1
95 percent confidence interval:
    -Inf 2.09112
sample estimates:
mean of x 
    2.026"

"Conclusión: A un nivel de confianza de 99% (0.01 de significancia), no existe
evidencia estadística para rechazar la hipótesis nula (el ancho de los petálos
de la flor de la especie virginica es de al menos 2.1 cms); por lo que se
rechaza la hipótesis alternativa."

"III. En promedio, el largo del pétalo de la especie virgínica es 1.1 cm más
grande que el promedio del largo del pétalo de la especie versicolor."

# Ho: Petal.Length(virginica) - Petal.Length(versicolor) == 1.1 cms * esta es la
# hipótesis propuesta
# Ha: Petal.Length(virginica) - Petal.Length(versicolor) != 1.1 cms

head(ds.virginica$Petal.Length)
head(ds.versicolor$Petal.Length)
head(ds.virginica$Petal.Length - ds.versicolor$Petal.Length)

# Haciendo la prueba
t.test(ds.virginica$Petal.Length - ds.versicolor$Petal.Length,
       alternative = 'two.sided',
       mu = 1.1)

"Resultados:
One Sample t-test

data:  ds.virginica$Petal.Length - ds.versicolor$Petal.Length
t = 1.7967, df = 49, p-value = 0.07854
alternative hypothesis: true mean is not equal to 1.1
95 percent confidence interval:
 1.077256 1.506744
sample estimates:
mean of x 
    1.292"

"Conclusión: Con un nivel de confianza de 99% (0.01 de significancia), no existe
evidencia estadística para rechazar la hipótesis nula: El largo de los pétalos
de la especie virginica es mayor que la logitud de los pétalos de la especie
versicolor por 1.1 cms"

"IV. En promedio, no existe diferencia en el ancho del sépalo entre las 3
especies."

# Ho: Petal.Width(setosa) - Petal.Width(virginica) - Petal.Width(versicolor) = 0
# Ho es la hipótesis propuesta
# Ha: Petal.Width(setosa) - Petal.Width(virginica) - Petal.Width(versicolor)‹›0

# Probando...
t.test(x = 
         (ds.setosa$Petal.Width -
         ds.virginica$Petal.Width -
         ds.versicolor$Petal.Width),
       alternative = 'two.sided',
       mu = 0
       )

"Resultados:
One Sample t-test

data:  (ds.setosa$Petal.Width - ds.virginica$Petal.Width - ds.versicolor$Petal.Width)
t = -61.018, df = 49, p-value < 2.2e-16
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
 -3.208293 -3.003707
sample estimates:
mean of x 
   -3.106"

"Conclusión: Con un nivel de confianza de 99%, existe evidencia estadñistica
para rechazar la hipótesis nula, en favor de la alternativa: El ancho de los
pétalos entre las tres especies es distinto"

"Utilizando pruebas de inferencia estadística, concluye si existe evidencia
suficiente para concluir que los datos recolectados por Anderson están en línea
con los nuevos estudios."


