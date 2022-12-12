"Utilizando la variable total_intl_charge de la base de datos
telecom_service.csv de la sesión 3, realiza un análisis probabilístico. Para
ello, debes determinar la función de distribución de probabilidad que más se
acerque el comportamiento de los datos.
Hint: Puedes apoyarte de medidas descriptivas o técnicas de visualización."

install.packages("DescTools")
library(DescTools)

df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-03/Data/telecom_service.csv")

df.total_intl_charge <- df$total_intl_charge

# medidas de tendencia central

mean(df.total_intl_charge)
#
median(df.total_intl_charge)
#
Mode(df.total_intl_charge)
#

"Media, mediana y moda son aproximadamente iguales, por lo que podemos suponer
que la distribución es también aproximadamente normal."

"Graficando un histograma..."

hist(df.total_intl_charge)

"Una vez que hayas seleccionado el modelo, realiza lo siguiente:"
  
"1. Grafica la distribución teórica de la variable aleatoria total_intl_charge"
media <- mean(df.total_intl_charge)
sd <- sd(df.total_intl_charge)

?curve
?dnorm

curve(
  dnorm(
    x, media, sd
  ),
  from = 0, to = 5,
  col = 'blue',
  main="Densidad de prob. normal",
  ylab="f(x)",
  xlab="x"
)


"2. ¿Cuál es la probabilidad de que el total de cargos internacionales sea menor
a 1.85 usd?"

?pnorm
pnorm(1.85, media, sd, lower.tail = TRUE)

#lower.tail (por defecto: VERDADERO) indica si la P resulta caer en X <= x
#si es falso, consdiera lo opuesto (X > x)
  
"3. ¿Cuál es la probabilidad de que el total de cargos internacionales sea mayor
a 3 usd?"

pnorm(3, media, sd, lower.tail = FALSE)
  
"4.  ¿Cuál es la probabilidad de que el total de cargos internacionales esté
entre 2.35usd y 4.85 usd?"

pnorm(4.85, media, sd, lower.tail = TRUE) - 
  pnorm(2.35, media, sd, lower.tail = TRUE)
  
"5. Con una probabilidad de 0.48, ¿cuál es el total de cargos internacionales
más alto que podría esperar?"

?qnorm
qnorm(0.48, media, sd)
  
"6. ¿Cuáles son los valores del total de cargos internacionales que dejan
exactamente al centro el 80% de probabilidad?"

qnorm(0.10, media, sd)
qnorm(0.90, media, sd)
  