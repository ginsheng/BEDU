"Reto01: Teorema del Límite Central"

"La distribución Beta es una función de distribución continua definida en el
intervalo [0,1], por lo que sus mayores aplicaciones están en la modelación de
variables aleatoria que representan proporciones o porcentajes."

"Esta función de distribución tiene dos parámetros alpha (a) y beta (b), los
cuales definen la forma de la distribución. El promedio y la varianza se
calculan como: E(X) = a/(a+b) Var(x) = (ab)/((a+b+1)*(a+b)^2)"

"1.- Grafica la densidad de la distribución Beta con parámetros a=5,b=1"
a <- 5
b <- 1

?dbeta

curve(
  dbeta(x, a, b),
  from = 0, to = 1,
  xlab = "x", ylab="f(x)",
  main="Distribución beta"
)

"2.- Mediante muestro repetitivo, muestra gráficamente que la distribución del
promedio de la distribución beta se aproxima a una distribución normal."

?rbeta

par(mfrow=c(2,2))

{muestra5 <- c()
  n <- 5
  for (i in 1:10000) {
    muestra5[i] <- mean(rbeta(n = n, shape1 = a, shape2 = b))
  }
  hist(muestra5, main = "n = 5", xlab = "")}

{muestra10 <- c()
  n <- 10
  for (i in 1:10000) {
    muestra10[i] <- mean(rbeta(n = n, shape1 = a, shape2 = b))
  }
  hist(muestra10, main = "n = 10", xlab = "")}

{muestra100 <- c()
  n <- 100
  for (i in 1:10000) {
    muestra100[i] <- mean(rbeta(n = n, shape1 = a, shape2 = b))
  }
  hist(muestra100, main = "n = 100", xlab = "")}

{muestra1000<- c()
  n <- 1000
  for (i in 1:10000) {
    muestra1000[i] <- mean(rbeta(n = n, shape1 = a, shape2 = b))
  }
  hist(muestra1000, main = "n = 1000", xlab = "")}

dev.off()

"3.- Muestra que el promedio y la desviación estándar del muestreo se aproxima
al promedio y error estándar teóricos de la distribución de la media"

a/(a+b); mean(muestra1000)
#(a*b)/((a+b+1)*(a+b)**2); sd(muestra1000)

sqrt((a*b)/((a+b+1)*(a+b)**2))/sqrt(1000); sd(muestra1000)
