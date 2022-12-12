# Postwork Sesión 3

"Utilizando el dataframe `boxp.csv` realiza el siguiente análisis descriptivo.
No olvides excluir los missing values y transformar las variables a su
tipo y escala correspondiente."

df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-03/Data/boxp.csv")
df <- df [complete.cases(df), ]
head(df)
str(df)

df$Categoria <- factor(df$Categoria)
df$Grupo <- factor(df$Grupo)

summary(df)

#1) Calcula e interpreta las medidas de tendencia central de la variable
#`Mediciones`

mean(x=df$Mediciones)

mean(x=df$Mediciones, trim = 0.25)

median(x=df$Mediciones) 

Mode(x=df$Mediciones) 

#2) Con base en tu resultado anterior, ¿qué se puede concluir respecto al sesgo
#de `Mediciones`?

"Si descartáramos los valores atípicos no parecería haber sesgo, aunque la moda
de 23.3 (por debajo de la media) nos indica un sesgo a la derecha"

hist(df$Mediciones, main="Distribución de mediciones")

"... y lo podremos confirmar visualmente con la gráfica que nos entrega la
funsión «hist»"

#3) Calcula e interpreta la desviación estándar y los cuartiles de la
#distribución de `Mediciones`

sd <- sd(df$Mediciones)

sd
"La desviación estándar es de 53.77; que es lo que los datos se dispersan
hacia arriba o hacia abajo, con respecto a la media"

IQR(df$Mediciones)
"Rango interquartil, la diferencia entre el 3er y 1er cuartil"
"Es decir, la dispersión existente en el 50% central de los datos"

"Que sería lo mismo que..."
iqr = quantile(df$Mediciones, probs = 0.75) - quantile(df$Mediciones,
                                                       probs = 0.25)

iqr
cuartiles <- quantile(df$Mediciones, probs = c(0.25, 0.50, 0.75))

cuartiles

"4) Con ggplot, realiza un histograma separando la distribución de `Mediciones`
por `Categoría`"

ggplot(df, aes(x=Mediciones, fill=Categoria, color=Categoria)) +
    geom_histogram(position = "identity")

"¿Consideras que sólo una categoría está generando el sesgo?"

"A juzgar por la clasificación mostrada en gráfica, no parece haber una
categoría que, de manera exclusiva, contribuya al sesgo (todas parecen sesgar
hacia la derecha)"

"5) Con ggplot, realiza un boxplot separando la distribución de `Mediciones` por
`Categoría` y por `Grupo` dentro de cada categoría."

ggplot(df, aes(x=Categoria, y=Mediciones, fill=Grupo)) + 
  geom_boxplot()

"¿Consideras que hay diferencias entre categorías?"

"La gráfica de boxplot muestra que los sesgos son consistentes entre categorías.
Aunque, parece que en grupo 1 hay menor presencia de estos datos atípicos que en
el grupo 0"

"¿Los grupos al interior de cada categoría podrían estar generando el sesgo?"

"Parce ser que el grupo 0 tiene mucha mayor presencia de datos que tienden al
sesgo"