"1.- El tiempo necesario para producir un determinado producto en una maquinaria
tiene una distribución normal cuya media es 80 minutos con desviación estándar
de 10 minutos."

  set.seed(0202)
  media <- 80
  desv.std <- 10
  x <- seq(-8, 8, 0.01) * desv.std + media
  y <- dnorm(x, mean = media, sd = desv.std) 
  
  "a) Grafica la función de distribución de la variable aleatoria."
  
  curve(dnorm(x, mean = media, sd = desv.std), from=40, to=120, 
        col='blue', main = "Densidad de Probabilidad Normal",
        ylab = "f(x)", xlab = "X")
  
  "b) ¿Cuál es la probabilidad de que la maquinaria termine el producto en una
  hora o menos?"
  
  pnorm(q = 60, mean = media, sd = desv.std, lower.tail = TRUE)
    
  "c) ¿Cuál es la probabilidad de que el producto sea terminado en más de 1.5
  horas, pero en menos de 2.5 horas?"
  
  pnorm(q = 150, mean = media, sd = desv.std, lower.tail = TRUE) -
  pnorm(q = 90, mean = media, sd = desv.std, lower.tail = TRUE)
    
  "d) ¿Cuál es el intervalo de tiempo que deja exactamente al centro el 90% de
  probabilidad?"
  
  qnorm(p = 0.1/2, mean = media, sd = desv.std)
  qnorm(p = 0.1/2, mean = media, sd = desv.std, lower.tail = FALSE)

  
"2.- Una institución de crédito informa a las autoridades que, en promedio, sus
clientes mantienen un saldo deudor en sus tarjetas de crédito igual a 12,500
pesos mensuales, con una desviación estándar de 7,800 pesos."

  media.deudor <- 12500
  desv.std.deudor <- 7800
  
  curve(dnorm(x, mean = media.deudor, sd = desv.std.deudor), from=-15000, to=43000, 
        col='red', main = "Densidad de Probabilidad Normal",
        ylab = "f(x)", xlab = "X")
  
  "a) ¿Cuál es la probabilidad de que un cliente tenga un saldo deudor mayor
  a $20,000?"
  
  pnorm(q=20000, mean = media.deudor, sd = desv.std.deudor, lower.tail = FALSE)
  # 0.1681407
    
  "b) ¿Cuál es la probabilidad de que un cliente tenga un saldo deudor menor
  a $11,000?"
  
  pnorm(q=10999.99, mean = media.deudor, sd = desv.std.deudor, lower.tail = TRUE)
  # 0.4237501
    
  "c) ¿Cuál es la probabilidad de que un cliente tenga un saldo deudor
  entre $13,000 y 15,000?"
  pnorm(q = 15000, mean = media.deudor, sd = desv.std.deudor, lower.tail = TRUE) -
    pnorm(q = 13000, mean = media.deudor, sd = desv.std.deudor, lower.tail = TRUE)
  
  # 0.1001545
    
  "d) ¿Hasta qué monto se encuentra el 10% de clientes con saldo deudor más bajo?"
  qnorm(p = 0.1, mean = media.deudor, sd = desv.std.deudor)
  # 2503.898
  "comprobando..."
  pnorm(q = 2503.898, mean = media.deudor, sd = desv.std.deudor, lower.tail = TRUE)
  # 0.1 (O sea que, en efeto, el 10% de deudores tienen hasta 2503.898 de deuda)