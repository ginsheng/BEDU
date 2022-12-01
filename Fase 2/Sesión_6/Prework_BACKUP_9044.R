<<<<<<< HEAD
"A continuación, vamos a ajustar un modelo de regresión lineal simple a un
=======
"A cotinuación, vamos a ajustar un modelo de regresión lineal simple a un
>>>>>>> f5d347671efa1bbfe1d4a67e07676875a5a35445
conjunto de datos en R. Suponga que el conjunto de datos proviene de una fábrica
que elabora productos."


"Se leen los datos con la función «read.table»"

production <- read.table("production.txt", header = TRUE)

head(production)

dim (production)

"Con la función «attach» se pueden manipular las columnas a través de sus
nombres"

attach(production)

"Luego, se hace el gráfico de dispersión."

plot(RunSize, RunTime, xlab = "Tamaño de ejecución",
     ylab = "Tiempo de ejecución", pch = 16)

"Dado que se observa una relación aproximadamente linean entre el tiempo de
ejecución y el tamaño de la misma, se ajusta el modelo de regresión lineal
simple con la función lm, en donde la variable de respuesta es RunTime y la
variable predictoria es RunSize."

m1 <- lm(RunTime ~ RunSize)

summary(m1)

"... y se grafican los datos nuevamente, ahora con la recta de regresión
ajustada"

plot(RunSize, RunTime, xlab = "Tamaño de ejecución",
     ylab = "Tiempo de ejecución", pch = 16)
abline(lsfit(RunSize, RunTime)) # Esto traza la recta de regresión estimada
mtext(expression(paste('Modelo de regresion lineal simple:', ' ',
                       y[i] == beta[0] + beta[1]*x[i] + e [i])),
side = 3, adj = 1, font = 2)

# Recta de regresión poblacional
text( x = 200, y = 240, expression(paste('Recta de regresión:', ' ',
                                         y[i] == beta[0] + beta[1]*x[i])),
      adj = 1, font = 2)

#Recta de regresión estimada
text (x = 350, y = 180, expression(paste('Recta estimada: ', ' ',
                                         hat(y)[i] == hat(beta)[0] + hat(beta)[1]*x[i])),
      adj = 1, font = 2)

#Recta de regresión estimada (¿otra vez?)
text(x = 350, y = 160, expression(paste('Recta estimada:', ' ',
                                        hat(y)[i] == 149.74770 + 0.25924*x[i])),
     adj = 1, font = 2)

#Resudiales
points(189, 215, pch=16, col="red") # Punto muestral

149.74770 + 0.25924 * 189 # Valor y sobre la recta estimada
# 198.7441
 lines(c(189,189),c(198.7441, 215), col = "red")

 points(173, 166, pch=16, col = "red") # Punto muestral
 149.74770 + 0.25924 * 173 # Valor y sober la recta estimada
 # 194.5962
 
 lines(c(173, 173), c(166, 194.5962), col = "red")
 
 "Encontramos intervalos de confianza del 95% para el intercepto y la pendiente
 del modelo de regresión lineal simple"
 
 round(confint(m1, level = 0.95), 3)
 
 "Al ser β₀ y β₁ parámetros desconocidos, así lo es también la verdadera recta
 de regresión y = β₀ + β₁x. Ahora encontramos intervalos de confinza del 95% para
 la recta de regresión piblacional en algunos valores de x (RunSize)."
 
 RunSize0 <- c(50,100,150,200,250,300,350) # Algunos posibles valores de RunSize
 
(conf <- predict(m1, newdata =
                   data.frame(RunSize = RunSize0),
                 interval = "confidence", level = 0.95))

 "Se pueden visualizar gráficamente estos intervalos de confianza" 
 
 plot(RunSize, RunTime, xlab = "Tamaño de ejecución",
      ylab = "TIempo de ejecución", pch = 16)

 abline(lsfit(RunSize, RunTime)) # Se traza la recta de regresión estimada
 
 lines(RunSize0, conf[,2], lty = 2, lwd = 2, col = "green")
 lines(RunSize0, conf[,3], lty = 2, lwd = 2, col = "green")
 
 "También se peden encontrar intervalos de predicción del 95% para el valor real
 de la variable de respuesta y (RunTime) en algunos valores de x (RunSize)"
 
 (pred <- predict(m1, newdata = 
                    data.frame(RunSize = RunSize0),
                  interval = "prediction", level = 0.95))
 
 "Y la visualización gráfica de estos intervalos"
 
 plot(RunSize, RunTime, xlab = "Tamaño de ejecución",
      ylab = "Tiempo de ejecución", pch = 16)
 abline(lsfit(RunSize, RunTime)) #Trazo de recta de regresión estimada
 
 lines(RunSize0, conf[, 2], lty = 2, lwd = 2, col = "green") # lims. inferiores
 lines(RunSize0, conf[, 3], lty = 2, lwd = 2, col = "green") # lims. superiores
 
 lines(RunSize0, pred[, 2], lty = 2, lwd = 2, col = "blue") # lims. inferiores
 lines(RunSize0, pred[, 3], lty = 2, lwd = 2, col = "blue") # lims. superiores
 
 ###############################################################################
 "Gráfico de diagnóstico de R"
 
 "Cuando se usa un modelo de regresión, se hacen una serie de suposiciones.
 Entonces se deben realizar diagnósticos de regresión para verificar las
 suposiciones."
 
 par(mfrow = c(2,2))
 plot(m1)

 dev.off() 
 