####### SESIÓN 5: TEOREMA DEL LÍMITE CENTRAL E INFERENCIA ESTADÍSTICA  ########
###############################################################################
set.seed(2022)

## EJEMPLO 01: TEOREMA DEL LÍMITE CENTRAL
"Todos los estadísticos son en sí mismos variables aleatorias, ya que su valor 
depende de la muestra. Para conocer la distribución muestral (de un estadístico) 
es necesario extrear muestras aleatorias repetidas de tamaño n.

Veamos un ejemplo para la media de una distribución exponencial:"

par(mfrow=c(2,2))

{sample5 <- c()
  n <- 5
  for (i in 1:10000) {
    sample5[i] <- mean(rexp(n = n, rate = 0.1))
  }
  hist(sample5, main = "n = 5", xlab = "")}

{sample10 <- c()
  n <- 10
  for (i in 1:10000) {
    sample10[i] <- mean(rexp(n = n, rate = 0.1))
  }
  hist(sample10, main = "n = 10", xlab = "")}

{sample100 <- c()
  n <- 100
  for (i in 1:10000) {
    sample100[i] <- mean(rexp(n = n, rate = 0.1))
  }
  hist(sample100, main = "n = 100", xlab = "")}

{sample1000<- c()
  n <- 1000
  for (i in 1:10000) {
    sample1000[i] <- mean(rexp(n = n, rate = 0.1))
  }
  hist(sample1000, main = "n = 1000", xlab = "")}
dev.off()

"El Teorema del Límite Central establece que, dada una muestra aleatoria suficientemente 
grande de la población, la distribución muestral de la media seguirá una distribución normal 
con un promedio igual al de la población y un error estándar igual a desv. est/sqrt(n)"

mean(sample1000); 1/0.1
sd(sample1000); sqrt(1/0.1**2)/sqrt(1000)

## EJEMPLO 02.a: INFERENCIA A LA MEDIA DE UNA POBLACIÓN

# Muestra grande (n >= 30) o desv. estándar poblacional conocida
"Cuando la muestra es grande o conocemos la desv. estandar de la población,
el estadístico de prueba que utilizaremos para tomar una decisión sobre la
hipótesis nula tendrá una distribución normal estándar, con la cual se
calcularán los valores p del estadístico de prueba."

# Muestra pequeña (n < 30) y desv. estándar poblacional desconocida
"Cuando la muestra es pequeña y no conocemos la desviación estándar de la
población, podemos utilizar un estimador, conocido como desviación estándar de
la muestra. Esto hace que el estadístico de prueba cambie su distribución a una
t de Student.

Esta distribución tiene características similares a la distribución normal
estándar, salvo que tiene un único parámetro (grados de libertad) y es
utilizada preferentemente en lugar de la distribución Z, ya que a medida que el
tamaño de la muestra es más grande, su densidad se acerca a la de la
distribución normal estándar"

{curve(dnorm(x), from = -4, to = 4, xlab = "X", ylab = "f(x)", main = "Distribución t - Student")
  legend(x = 2, y = 0.4, legend=c("N(0,1)", "df=1", "df=5", "df=10", "df=100"),
         col=c("black","blue", "green", "orange", "red"), lty = 1, bty = "n", cex=0.8)}
curve(dt(x, 1), from = -4, to = 4, col = "blue", add = TRUE)
curve(dt(x, 5), from = -4, to = 4, col = "green", add = TRUE)
curve(dt(x, 10), from = -4, to = 4, col = "orange", add = TRUE)
curve(dt(x, 100), from = -4, to = 4, col = "red", add = TRUE)

"Ejemplo: Un estudio anterior de telecomunicaciones señala que, en promedio, el 
total de llamadas internacionales es menor a 4.54. ¿A qué NC EEE para concluir 
que lo mismo sucede en nuestro mercado?"
#NC Nivel del Confianza
#EEE Existe Evidencia Estadística

# Ho Sólo puede ser una de estas tres ‹=, =, ›=
# Ha Al ser la opuesta (alternativa) a H0 puede ser: ›, !=, ‹

df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-03/Data/telecom_service.csv")

"Planteamiento de hipótesis:"

# Ho: mu ›= 4.54
# Ha: mu ‹ 4.54 # Como es "menor que..." a punta a cola inferior

# Nivel de confianza: 90%, 95%, 99% (probabilidad de no cometer error tipo 1)
# Nivel de significancia (1 - nivel de confianza en decimal): 0.1, 0.05, 0.01

# Error tipo 1: cuando se rechaza la Ho cuando era verdaera (y no se debía
# rechazar)

# En uns dist. tStudent, para verificar la probablidad de algo, se utiliza esta
# función. El valor del parámetro alternative es 'less' porque buscamos cola
# inferior
t.test(x = df$total_intl_calls, alternative = 'less', mu=4.54 )
"Resultado: 	One Sample t-test

data:  df$total_intl_calls
t = -1.4204, df = 3332, p-value = 0.0778
alternative hypothesis: true mean is less than 4.54
95 percent confidence interval:
    -Inf 4.54959
sample estimates:
mean of x 
 4.479448 "

# Para tomar la decisión: si en el resultado de t.test:
# p-value ›= significancia NO se rechaza Ho
# p-value ‹ significancia se rechaza Ho 

"Conslusión:
A un nivel de confianza del 90% (es el único en que el p-value de la prueba
resulta menor a su significancia) existe evidencia estadística para rechazar Ho,
es decir que el promedio de llamadas internacionales sea menor a 4.54
"

"Ejemplo: El mismo estudio, señala que, en promedio, el número de mensajes de
voz es mayor a 7.79 A un NC del 95%, ¿EEE para concluir que lo mismo sucede en
nuestro mercado?"

"Planteamiento de hipótesis:"
# H0: mu <= 7.79
# Ha: mu > 7.79 * Esta es la hipótesis que nos indican (no incluye el "o igual")
# (como la comparación es "mayor que..." es la cola superior)

t.test(x = df$total_intl_calls, alternative = "greater", mu= 7.79)

" Resultado:
One Sample t-test

data:  df$total_intl_calls
t = -77.655, df = 3332, p-value = 1
alternative hypothesis: true mean is greater than 7.79
95 percent confidence interval:
 4.409306      Inf
sample estimates:
mean of x 
 4.479448
"
"Conclusión: A un nivel de confianza 95% (significancia de 0.05), no existe
evidencia estadística para rechazr Ho (el promedio no es mayor a 7.79)"

"Ejemplo: El mismo estudio, señala que, en promedio, el número de llamadas de
servicio es igual a 1.59. A un NC del 95%, ¿EEE para concluir que lo mismo
sucede en nuestro mercado?"

"Planteamiento de hipótesis:"
# H0: mu = 1.59 * Esta es la hipótesis que nos indican (al ser "igual a", se
# consideran las dos colas)
# Ha: mu != 1.59

t.test(x = df$customer_service_calls, alternative = 'two.sided', mu = 1.59)

"Resultado:
One Sample t-test

data:  df$customer_service_calls
t = -1.1912, df = 3332, p-value = 0.2336
alternative hypothesis: true mean is not equal to 1.59
95 percent confidence interval:
 1.518180 1.607532
sample estimates:
mean of x 
 1.562856 "

"Conslusión:
Al ser una prueba de dos colas, el nivel de significancia se divide entre 2
(Aunque, parece ser que las nuevas versiones de R ya consideran, más bien, el
multiplicar por 2 el p-value en los resultados del test)
A un nivel de confianza de 95% (significancia de 0.05/2= 0.025) no existe
evidencia estadística para rechazar Ho (que el número de llamadas de servicio
sea igual a 1.59)
"

## EJEMPLO 02.b: INFERENCIA A LA MEDIA DE DOS POBLACIONES
"En inferencia estadística también podemos hacer comparaciones entre la media de 
una variable para diferentes grupos.

En el caso de comparación de dos medias, el estadístico a utilizarse puede
distribuir como una normal estándar o una t - Student, dependiende si se cumplen
las condiciones antes mencionadas. Para el caso particular de la distribución
t - Student, es necesario verificar si las desviaciones estándar de cada grupo
son iguales o diferentes en la población, por lo que realizaremos una prueba
estadística para verificar esto:"

"Ejemplo: El mismo estudio, señala que, el promedio de llamadas de atención a
clientes en los usuarios que cancelaron el servicio es mayor que los que no
cancelaronA un NC del 90%, ¿EEE para concluir que lo mismo sucede en nuestro
mercado?"

"Planteamiento de hipótesis:
Ho: prom_customer_service_calls_churn1 <= prom_customer_service_calls_churn2 
Ha: prom_customer_service_calls_churn1 > prom_customer_service_calls_churn2 *
esta es la hipótesis que nos plantean"

# Para comparar una variable en dos grupos (diferencia de medias) primero hay
# que hacer une prueba para determinar si sus varianzas son iguales o no.
var.test(df[df$churn == 1, "customer_service_calls"],
         df[df$churn == 0, "customer_service_calls"],
         ratio = 1, alternative = "two.sided")

"Resultado:
	F test to compare two variances

data:  df[df$churn == 1, 'customer_service_calls'] and df[df$churn == 0, 'customer_service_calls']
F = 2.5355, num df = 482, denom df = 2849, p-value < 2.2e-16
alternative hypothesis: true ratio of variances is not equal to 1
95 percent confidence interval:
 2.219097 2.916513
sample estimates:
ratio of variances 
          2.535484 "

"Interpretación: Como el p-value de la prueba es muy cercano a cero, las
varianzas son diferentes. Por lo que hay suficiente evidencia para rechazar la
hipótesis nula. Así que, podríamos proseguir con las pruebas de comprobación de
la hipótesis alternativa (que es la que nos plantean)."

"Posteriormente se realiza la prueba t, comparando dos variables. Como la Ho
indica 'mayor que...' el análisis es de cola superior (greater) y el valor
de contraste (Mu) debe ser cero y como las varianzas son distintas, el atributo
del parámetro var.equal será falso"

t.test(x = df[df$churn == 1, "customer_service_calls"],
       y = df[df$churn == 0, "customer_service_calls"],
       alternative = "greater", mu = 0, var.equal = FALSE)

"Resultado:
Welch Two Sample t-test

data:  df[df$churn == 1, "customer_service_calls"] and df[df$churn == 0, "customer_service_calls"]
t = 8.9551, df = 548.17, p-value < 2.2e-16
alternative hypothesis: true difference in means is greater than 0
95 percent confidence interval:
 0.6364805       Inf
sample estimates:
mean of x mean of y 
 2.229814  1.449825 "

"Conslusión: dado que p-value es prácticamente 0, a niveles de confianza
estandar hay evidencia estadística para rechazar la hipótesis nula, en favor
de la hipótesis alternativa (el promedio de llamadas del grupo de cancelaron su
servicio es mayo que el promedio de llamadas del grupo que no cancelaron)"

# A niveles de confianza estándar, EEE para rechazar H0, el promedio de llamadas
# de atención a clientes en los usuarios que cancelaron el servicio es mayor que
# los que no cancelaron

"Ejemplo: Prueba que, en promedio, el número de llamadas internacionales
realizadas por los usuarios que cancelaron es igual a las realizadas por quienes
no cancelaron"

"Planteamiento de hipótesis:
Ho: prom_total_intl_calls_churn1 == prom_total_intl_calls_churn2 * Es la
hipótesis planteada
Ha: prom_total_intl_calls_churn1 =! prom_total_intl_calls_churn2"

# Primero, la comprobación de igualdad de varianzas:
var.test(df[df$churn == 1, "total_intl_calls"], 
         df[df$churn == 0, "total_intl_calls"], 
         ratio = 1, alternative = "two.sided")

"Resultado:
F test to compare two variances

data:  df[df$churn == 1, 'total_intl_calls'] and df[df$churn == 0, 'total_intl_calls']
F = 1.0918, num df = 482, denom df = 2849, p-value = 0.1971
alternative hypothesis: true ratio of variances is not equal to 1
95 percent confidence interval:
 0.9555354 1.2558399
sample estimates:
ratio of variances 
           1.09177 "

"Interpretación: El p-value es mayor que la significancia a los niveles de
confianza estándar, por lo que no existe evidencia estadística para rechazar la
hipótesis nula. Podemos proseguir..."

"Como la hipótesis nula indica 'igual a...' el valor del parámetro alternvaive
debería ser two.sided y, dado que los valores de llamadas internacionales de
ambos grupos son iguales, el valor del atributo var.equal debe quedar en TRUE"

t.test(x = df[df$churn == 1, "total_intl_calls"],
       y = df[df$churn == 0, "total_intl_calls"],
       alternative = "greater", mu = 0, var.equal = TRUE)

"Resultado:
Two Sample t-test

data:  df[df$churn == 1, 'total_intl_calls'] and df[df$churn == 0, 'total_intl_calls']
t = -3.0542, df = 3331, p-value = 0.9989
alternative hypothesis: true difference in means is greater than 0
95 percent confidence interval:
 -0.5684324        Inf
sample estimates:
mean of x mean of y 
 4.163561  4.532982 "

"Conclusión: A niveles de confianza estándar (p-value es mayor que la
significancia de todos ellos), no existe evidencia estadística para rechazar la
hipótesis nula (el número de llamadas internacionales de clientes que cancelaron
el servicio es igual al de llamadas que no cancelaron)"
