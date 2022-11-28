muestra <- c(1.82165160, 1.06824486, 0.38492498, 0.52779737, 0.17989299, 
             0.38599556, 0.01565589, 0.53166559, 1.08000160, 0.61289266, 
             0.16050136, 0.35143952, 0.41076615, 1.09468497, 0.53319069, 
             1.09299258, 0.61343642, 0.15565428, 1.44299912, 0.43475144, 
             0.60773249, 3.09911364, 0.36185393, 1.00729974, 0.30582083, 
             0.35948934, 0.20484999, 0.13779880, 0.28064973, 2.03910927, 
             0.19785169, 0.46706578, 0.30224129)

data <- as.data.frame(muestra)

library(ggplot2)

ggplot(data, aes(muestra)) +
  geom_histogram(colour = 'red', fill = 'pink',
                 alpha = 0.7, bins = 7) + # Intensidad del color fill
  ggtitle('Histograma para la muestra de tamaño 33') +
  labs(x = 'valores', y = 'Frecuencia') +
  theme_get() +
  theme(plot.title = element_text(hjust = 0.5, size = 16))

mean(muestra)

"Contraste de hipótesis"

"Se comete un error de tipo I si H₀ es rechazada cuando H₀
es verdadera. La probabilidad de un error I está denotada
por α. El valor de α se denomina nivel de la prueba

Se comete un error de tipo II si H₀ es acetada cuando Hₐ es
verdadera. La probabilidad de un error tipo II está denotada
por β"
###############################################################################
"Ejemplo. Contraste de cola superior"

"Estamos interesados en contrastar las hipótesis H₀: μ = 0.1 vs H₁: μ > 0.1
(contraste de cola superior) con base en una muestra aleatoria de tamaño
n = 40 de la población."

muestra <- c(0.191825830, 0.090832594, 0.078292920, 0.023187365, 0.275329543,
             0.120594281, 0.011730131, 0.727012539, 0.108018454, 0.004800318, 
             0.070778142, 0.539517386, 0.165975518, 0.136258035, 0.216427932,
             0.002537893, 0.563361006, 0.027473375, 0.380678788, 0.310481407, 
             0.142732480, 0.836212104, 0.149678939, 0.288385634, 0.535300943, 
             0.491167954, 0.429518316, 0.043545325, 0.443696671, 0.078943105,
             0.205748181, 0.167813525, 0.017052988, 0.082652468, 0.125213495, 
             0.166680130, 0.128717925, 0.003860131, 0.045212421, 0.086816614)

"El valor observado del estadístico de prueba en este caso está dado por:"

(z0 <- (mean(muestra)-0.1)/(sd(muestra)/sqrt(40)))

"que proviene de una distribución normal estándar aproximadamente."

"Supongamos que estamos interesados en encontrar la región de rechazo (de cola
superior) con un nivel de significaciona α = 0.05, es decir, el cuantil de
orden 0.95."

(z.05 <- qnorm(p = 0.05, lower.tail = FALSE))

"A continuación, observamos el valor 1.644854 y la región de rechado en el eje
horizontal"

x <- seq(-4, 4, 0.01)

y <- dnorm(x)

plot(x, y, type = "l", xlab="", ylab="")
  title(main = "Densidad normal estándar", sub = expression(
    paste(mu == 0, " y ", sigma == 1)))
  polygon(c(z.05, x[x>=z.05], max(x)), c(0, y[x>=z.05], 0), col="red") 
    axis(side = 1, at = z.05, font = 2, padj = 1, lwd = 2)
  text(2.5, 0.1, labels = expression(alpha == 0.05), col = "red")
  
"Como

  3.41015 > 1.644854
  
rechazamos la hopótesis nula.

p-value

El p-value lo podemos calcular como"

(pvalue <- pnorm(z0, lower.tail = FALSE))

"Por lo general, la decisión de rechazar o no la hipótesis nula se toma con
base en el p-value. Si el p-value es pequeño (por ejemplo, p-value < 0.05 o
p-value < 0.01), se rechaza la hipótesis nula."
  
###############################################################################
"Ejemplo. Contraste de cola inferior."
  
"Estamos interesados en contrastar las hipótesis H₀: p = 0.9 vs H₁: p < 0.9
(contraste de cola inferior) donde p es la probabilidad de éxito en un
experimento que sólo puede resultar en éxito o fracaso (1 o 0) (Ensayo
Bernouli, donde la media es p y la varianza es p(1-p)). Si tomamos una muestra
(n = 45) aleatoria relacionada con el ensayo Bernoulli."
  
muestra <- c(0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1,
             1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 
             1, 1, 0)
  
"El valor observado del estadístico de prueba en este caso está dado por:"

z0 <- (mean(muestra)-0.9)/sqrt((0.9*(1-0.9))/45)

"que proviene de una distribución normal estándar aproximadamante."

"Supongamos que estamos interesado en encontrar la región de rechazo (de cola
inferior) con un nivel de significancia α = 0.05, debemos encontrar el valor
-z0.05 que satisface P(Z<-<0.05=0.05), es decir, el cuantil de orden 0.05."

z.05 <- qnorm(p = 0.05)

qnorm(p = 0.05)

"A continuación, observamos el valor -1.644854 y la región de rechazo en el eje
horizontal."

x <- seq(-4, 4, 0.01)
y <- dnorm(x)

plot(x, y, type = "l", xlab="", ylab="")
  title(main = "Densidad normal estándar",
        sub = expression(paste(mu == 0, " y ", sigma == 1)))
  polygon(c(min(x), x[x<=z.05], z.05), c(0, y[x<=z.05], 0), col="red")
  axis(side = 1, at = z.05, font = 2, padj = 1, lwd = 2)
  text(-3, 0.05, labels = expression(alpha == 0.05), col = "red")
  
"Como
 
 -7.205108 < -1.644854
 
rechazamos la hipótesis nula"

"P-value lo podemos calcular como"

(pvalue <- pnorm(z0))
  
###############################################################################
"Contraste de muestra pequeña para μ"
  
"Ejemplo. Contraste de cola superior."

"Estamos interesados en contrastar las hipótesis H₀: μ = 170 vs H₁: μ < 170
contraste de cola superior) con base en una muestra aleatoria de tamaño n = 15"
  
muestra <- c(166.6896, 175.2299, 170.4218, 176.2738, 183.5532, 179.4669, 
             179.2014, 173.6239, 176.1826, 182.2429, 176.9100, 166.4572,
             172.5695, 180.9723, 180.7529)

"El valor observado del estadístico de prueba en este caso está dado por:"

t0 <- (mean(muestra)-170)/(sd(muestra)/sqrt(15))

"que proviene de una distribución t de Student con n-1=14 grados de libertad
(gl).

Supongamos que estamos interesados en encontrar la regiOn de rechazo (de cola
superor) con un nivel de significancia α = 0.05, debemos encontrar el valor
t0.05 que satisface P(T>t0.05=0.05), donde T se distribuye como t de Student
con n-1=14 gl."

t.05 <- qt(p = 0.05, df = 14, lower.tail = FALSE)

"Como
  4.410443 > 1.76131
rechazamos la hipótesis nula."

"Y el p-value se calcula como"

pvalue <- pt(t0, df = 14, lower.tail = FALSE)

"También poremos usar la funciOn t.test para llevar a cabo el procedimiento de
contraste de hipótesis."

t.test(x = muestra, alternative = "greater", mu = 170)

###############################################################################
"Ejemplo de contraste de colas."

"Una máquina expendedora de gaseosas fue diseñada para descargar en promedio 7
onzas de líquido por taza. En una prueba de la máquina, diez tazas de líquido
se sacaron de la máquina y se midieron. La media y la desviación etándar de las
diez mediciones fueron 7.1 onzas y 0.12 onzas respectivamente. ¿Estos datos
presentan suficiente evidencia pra indicar que la descarga media difiere 7
onzas? ¿Cuál es la decisión adecuada si α = 0.10?"

"Si μ representa la verdadera media (desconocida) de la población de descargas
de onzas de líquido por taza, entonces tenemos el siguiente contraste de
hipótesis:"

"                   H₀: μ = 7 vs H₁: μ ≠ 7                               "

"tenemos lo siguiente:
n = 10, y = 7.1, s = 0.12, gl = 10 - 1 = 9
"
mu <- 7
n <- 10
y <- 7.1
sd <- 0.12
gl <- n - 1
alph.a <- 0.10

t0 <- (y - mu) / (sd/sqrt(n))

"y para alfa:"

t0.10 <- qt(p = alph.a, df = gl, lower.tail = FALSE)

"graficando... "

x <- seq(-4, 4, 0.01)
y <- dnorm(x)

plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad normal estándar",
      sub = expression(paste(mu == 7, " y ", sigma == 0.12)))
polygon(c(min(x), x[x<=t0.10], t0.10), c(0, y[x<=t0.10], 0), col="red")
axis(side = 1, at = t0.10, font = 2, padj = 1, lwd = 2)
text(-3, alph.a, labels = expression(alpha == 0.10), col = "red")

"Como
  2.635231 > 1.383029
Se rechaza la hipótesis nula."
