# Postwork Sesión 3

#### Desarrollo

"Utilizando el dataframe `boxp.csv` realiza el siguiente análisis descriptivo.
No olvides excluir los missing values y transformar las variables a su
tipo y escala correspondiente."

```
df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-03/Data/boxp.csv")
df <- df [complete.cases(df), ]
head(df)
str(df)
```

```
df$Categoria <- factor(df$Categoria)
df$Grupo <- factor(df$Grupo)

summary(df)
```

|Categoria| Grupo  |   Mediciones    |
|---------|--------|-----------------|
| C1:202   | 0:444 |  Min.   :  2.80  |
| C2:195   | 1:147 |  1st Qu.: 23.45  |
| C3:194   |       |  Median : 49.30 | 
|          |       |  Mean   : 62.88 | 
|          |       |  3rd Qu.: 82.85 | 
|          |       |  Max.   :290.60 | 

#### 1. Calcula e interpreta las medidas de tendencia central de la variable `Mediciones`

```
mean(x=df$Mediciones)
mean(x=df$Mediciones, trim = 0.25)
median(x=df$Mediciones) 

install.packages("DescTools")
library(DescTools)

Mode(x=df$Mediciones)
```

`mean(x=df$Mediciones) 62.88494`
`mean(x=df$Mediciones, trim = 0.25) 50.05556`
`median(x=df$Mediciones) 49.3`
`Mode(x=df$Mediciones)[1] 23.3`

#### 2. Con base en tu resultado anterior, ¿qué se puede concluir respecto al sesgo de `Mediciones`?

> Si descartáramos los valores atípicos no parecería haber sesgo, aunque la moda de 23.3 (por debajo de la media) nos indica un sesgo a la derecha

```
hist(df$Mediciones, main="Distribución de mediciones")
```

![plot1Post_workSesion3](https://lh4.googleusercontent.com/koUe0gQL1Q1rum5gkSw6a1Fc3cZAkFID0zSeWCMxwiqfwOrEOMFc_LWxQsC2fUR7YTk=w2400)

>... y lo podremos confirmar visualmente con la gráfica que nos entrega la función «hist»"

#### 3. Calcula e interpreta la desviación estándar y los cuartiles de la distribución de `Mediciones`

```
sd <- sd(df$Mediciones)
```

`sd 53.76972`

>La desviación estándar es de 53.77; que es lo que los datos se dispersan hacia arriba o hacia abajo, con respecto a la media

```
IQR(df$Mediciones)
```

>Rango interquartil, la diferencia entre el 3er y 1er cuartil. Es decir, la dispersión existente en el 50% central de los datos

>Que sería lo mismo que...

```
iqr = quantile(df$Mediciones, probs = 0.75) - quantile(df$Mediciones,
                                                       probs = 0.25)
```

`iqr
75% 
59.4`

```
cuartiles <- quantile(df$Mediciones, probs = c(0.25, 0.50, 0.75))
```

`cuartiles`
| 25% |  50%  | 75% |
|------|-----|------|
|23.45| 49.30| 82.85 |

#### 4) Con ggplot, realiza un histograma separando la distribución de `Mediciones` por `Categoría`

```
ggplot(df, aes(x=Mediciones, fill=Categoria, color=Categoria)) +
    geom_histogram(position = "identity")
```

![plot2Post_workSesion3](https://lh5.googleusercontent.com/9SGHby88AUcqQ-0Ay9-TmEE6vvRNJqyKZMwtbETnKKP7ZiZ7rwAGXPYuC4IHMZgsqg0=w2400)

#### ¿Consideras que sólo una categoría está generando el sesgo?"

>A juzgar por la clasificación mostrada en gráfica, no parece haber una categoría que, de manera exclusiva, contribuya al sesgo (todas parecen sesgar hacia la derecha)

#### 5) Con ggplot, realiza un boxplot separando la distribución de `Mediciones` por `Categoría` y por `Grupo` dentro de cada categoría."

```
ggplot(df, aes(x=Categoria, y=Mediciones, fill=Grupo)) + 
  geom_boxplot()
```
![plot3Post_workSesion3](https://lh3.googleusercontent.com/kAN2kL3dyAc9VJBZQTrovglUzJZtSJUjVNHI8gyepY4NpPLh8CWgX51Ngo8_fJ1uTqU=w2400)

#### ¿Consideras que hay diferencias entre categorías?

>La gráfica de boxplot muestra que los sesgos son consistentes entre categorías. Aunque, parece que en grupo 1 hay menor presencia de estos datos atípicos que en el grupo 0

#### ¿Los grupos al interior de cada categoría podrían estar generando el sesgo?

>Parce ser que el grupo 0 tiene mucha mayor presencia de datos que tienden al sesgo.
