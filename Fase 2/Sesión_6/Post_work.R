"Supongamos que nuestro trabajo consiste en aconsejar a un cliente sobre como
mejorar las ventas de un producto particular, y el conjunto de datos con el que
disponemos son datos de publicidad que consisten en las ventas de aquel producto
en 200 diferentes mercados, junto con presupuestos de publicidad para el
producto en cada uno de aquellos mercados para tres medios de comunicación
diferentes: TV, radio, y periódico. No es posible para nuestro cliente
incrementar directamente las ventas del producto. Por otro lado, ellos pueden
controlar el gasto en publicidad para cada uno de los tres medios de
comunicación. Por lo tanto, si determinamos que hay una asociación entre
publicidad y ventas, entonces podemos instruir a nuestro cliente para que ajuste
los presupuestos de publicidad, y así indirectamente incrementar las ventas."

"En otras palabras, nuestro objetivo es desarrollar un modelo preciso que pueda
ser usado para predecir las ventas sobre la base de los tres presupuestos de
medios de comunicación. Ajuste modelos de regresión lineal múltiple a los datos
advertisement.csv y elija el modelo más adecuado siguiendo los procedimientos
vistos"

"Considera:
  
Y: Sales (Ventas de un producto)
X1: TV (Presupuesto de publicidad en TV para el producto)
X2: Radio (Presupuesto de publicidad en Radio para el producto)
X3: Newspaper (Presupuesto de publicidad en Periódico para el producto)"

adv <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-06/data/advertising.csv")

head(adv)

adv <- adv[complete.cases(adv),]

?dim
dim(adv)

attach(adv)

round(cor(adv), 4)

pairs(~ Sales + TV + Radio + Newspaper, data = adv, gap = 0.4, cex.labels = 1.5)

plot(TV, Sales, xlab = "T.V.",
     ylab = "Ventas", pch = 16)

plot(Radio, Sales, xlab = "Radio",
     ylab = "Ventas", pch = 16)

plot(Newspaper, Sales, xlab = "Periódico",
     ylab = "Ventas", pch = 16)

" Con la gráfica de gasto en publicidad en Tv se observa una relación
aproximadamente lineal entre el presupuesto para tv y las ventas"

plot(TV, Sales, xlab = "Presupuesto en TV",
     ylab = "Ventas", pch = 16)
abline(lsfit(TV, Sales)) # Esto traza la recta de regresión estimada
mtext(expression(paste('Modelo de regresion lineal simple:', ' ',
                       y[i] == beta[0] + beta[1]*x[i] + e [i])),
      side = 3, adj = 1, font = 2)

"Estimación por mínimos cuadrados ordinarios
(O sea, los valores de las β que nos den como resultado el menor valor 
posible de  error ε)"
"Sales = β₀ + β₁*TV + β₂*Radio + β₃*Newspaper + ε"

mVentas1 <- lm(Sales ~ TV + Radio + Newspaper)
summary(mVentas1)

"Resultado:
Residuals:
    Min      1Q  Median      3Q     Max 
-7.3034 -0.8244 -0.0008  0.8976  3.7473 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 4.6251241  0.3075012  15.041   <2e-16 ***
TV          0.0544458  0.0013752  39.592   <2e-16 ***
Radio       0.1070012  0.0084896  12.604   <2e-16 ***
Newspaper   0.0003357  0.0057881   0.058    0.954    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.662 on 196 degrees of freedom
Multiple R-squared:  0.9026,	Adjusted R-squared:  0.9011 
F-statistic: 605.4 on 3 and 196 DF,  p-value: < 2.2e-16
"

"Interpretación:

Multiple R-squared indica que el 90.26% de la variación de Ventas está siendo
explicado por el modelo;

Los coefiencientes arrojan que el valor de Ventas aumenta más con la inversión
en radio (con mayor error estándar también), quedando TV en segundo lugar.
Los p-value de ambos indican valores muy cercanos a cero. Por lo que, a niveles
de confianza estándar, hay evidencia estadística para rechazar la hipótesis (Ho)
nula, en favor del a alternativa: que en la población, tanto β₁ como β₂ son
distintas de 0.

Por otro lado, el coeficiente de la variable Newspaper no es significativo. Por
lo que, en la población, la variación de esta varibable no ayuda a determinar
una variación (el comportamiento) en las ventas.
"

"¿Qué pasa si se omite la variable Newspaper del modelo?"

"Sales = β₀ + β₁*TV + β₂*Radio + ε"

mVentas2 <- update(mVentas1, ~ .-Newspaper)

summary(mVentas2)

"Resultado:
Residuals:
    Min      1Q  Median      3Q     Max 
-7.3131 -0.8269  0.0095  0.9022  3.7484 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 4.630879   0.290308   15.95   <2e-16 ***
TV          0.054449   0.001371   39.73   <2e-16 ***
Radio       0.107175   0.007926   13.52   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.657 on 197 degrees of freedom
Multiple R-squared:  0.9026,	Adjusted R-squared:  0.9016 
F-statistic: 912.7 on 2 and 197 DF,  p-value: < 2.2e-16"

"Interpretación: Los coeficientes muestran un ligero incremento ahora que se
descartó la variable Newspaper. Esto también modificó el valor de R-cuadrada
ajustada de 0.9011 (del modelo anterior) a 0.9016 en el nuevo modelo. "

"Para nuestro modelo de regresión lineal"

StanResM2 <- rstandard(mVentas2)

par(mfrow = c(2,2))

"Realizando gráficas de disperción"
plot(TV, StanResM2, ylab ="Residuales estandarizados")
"Más o menos se aprecia una correlación nula (algo recta)"
plot(Radio, StanResM2, ylab ="Residuales estandarizados")
"Más o menos se aprecia una correlación positiva (hacia el final)"

"Graficando Q-Q"
qqnorm(StanResM2)
qqline(StanResM2)

"La distribución de los errores se aproxima a la distribución normal teórica.
por inspección visual el residuo distribuye como una normal"

dev.off()

"Confirmando con prueba de shapiro-wilk"
shapiro.test(StanResM2)

"Resultado:
Shapiro-Wilk normality test

data:  StanResM2
W = 0.97535, p-value = 0.001365"

"Hipótesis:
Ho: la variable distribuye como una normal
Ha: la variable no distribuye como una normal"

"A un niveles de confianza estándar se rechaza la hipótesis nula, a favor de la
alternativa: la variable no distribuye como una normal."

"Construyendo un dataframe con datos para predicción."

pred.data <- data.frame(
  TV = c(22.01, 11.34, 32.0, 28.9),
  Radio = c(12.9, 11.3, 15.64, 33.0)
)

"Corriendo la predicción (999 es el nivel de confianza que pudimos obtener
de la prueba de Shapiro-Wilk)"

predict(mVentas2, newdata = pred.data, interval = "confidence", level = 0.999)

"
Resultado:
       fit      lwr       upr
1 7.211853 6.477614  7.946092
2 6.459403 5.673198  7.245609
3 8.049457 7.371341  8.727572
4 9.741215 9.014828 10.467602"


"Interpretación, para invertir 22.01 en tv y 12.9 en radio se esperarían ventas
estimadas por 7.2, A un nivel de confianza de 99.9% el valor de esta predicción
está entre 6.47 y 7.94"