
"Para este reto vamos a hacer uso del dataframe diamonds, disponible en la
librería de ggplot2. Realiza los siguientes incisos y responde a las preguntas:"

  library(ggplot2)
  df.diamonds <- force(diamonds)
  "1. ¿Qué tipo de variable y escala de medición tiene la variable cut?"

  str(df.diamonds)
  # Cualitativa Ordinal
  
  "2. Reliza una tabla de frecuencias absolutas y relativas"
  tabla.freq <- table(df.diamonds$cut)
  
  transform(tabla.freq, freq.relativa = prop.table(Freq))

  "3. Para esta variable, ¿es posible calcular la frecuencia relativa acumulada?
    En caso afirmativo, agrégala a tu tabla anterior"
  # Sí, es posible, porque los grados de corte son ascendentes en cuanto a calidad
  
  df.diamonds$cut <- factor(df.diamonds$cut, 
                            levels = c("Fair", "Good", "Very Good", "Premium", "Ideal")
                            , ordered = TRUE)
  
  View(tabla.freq)
  
  transform(tabla.freq, freq.relativa = round(prop.table(Freq) * 100, 2)
            , freq.acum = round((cumsum(prop.table(Freq)) * 100),2) )

  "4. Con base en tu tabla, responde:
    ¿Cuál es el porcentaje de diamantes que tienen un corte Very Good?
    
    # 22.40 %
  
    ¿Cuál es el porcentaje de diamantes que tienen un corte entre Fair y Very
    Good?
    
    # 34.48%
    
    ¿Cuál es el porcentaje de diamantes que tienen un corte al menos Very Good?"
  
    # 100 - 12.08% = 87.92%
  
  "5. Crea una tabla de distribución de frecuencias para el precio de los
    diamantes. Para ello determina el número de clases con base en la regla de
    Sturges k = 1+3.3Log10(n)"
  
  k.price <- 1 + 3.3 * log10(length(df.diamonds$price))
  ac.price <- (max(df.diamonds$price) - min(df.diamonds$price))/k.price
  
  bins.price <- seq(min(df.diamonds$price), max(df.diamonds$price)
                    , by = ac.price)

  price.ranges <- cut(df.diamonds$price, breaks = bins.price
                      , include.lowest = TRUE, dig.lab = 6)
  
  dist.prices <- table(price.ranges)
  
  transform(dist.prices, frec.relativa = round(prop.table(Freq)*100,2)
            , frec.acumulada = round(cumsum(prop.table(Freq))*100,2))

  "6. Con base en tu tabla, responde:
  
  #Mi tabla:
  
  price.ranges        Freq     frec.relativa frec.acumulada
1      [326,1439.25] 19892         37.05          37.05
2   (1439.25,2552.5]  7958         14.82          51.87
3   (2552.5,3665.75]  5278          9.83          61.70
4     (3665.75,4779]  5186          9.66          71.36
5     (4779,5892.25]  3802          7.08          78.44
6   (5892.25,7005.5]  2560          4.77          83.20
7   (7005.5,8118.75]  1836          3.42          86.62
8  (8118.75,9232.01]  1388          2.59          89.21
9  (9232.01,10345.3]  1160          2.16          91.37
10 (10345.3,11458.5]  1013          1.89          93.26
11 (11458.5,12571.8]   796          1.48          94.74
12   (12571.8,13685]   721          1.34          96.08
13   (13685,14798.3]   612          1.14          97.22
14 (14798.3,15911.5]   534          0.99          98.22
15 (15911.5,17024.8]   500          0.93          99.15
16   (17024.8,18138]   458          0.85         100.00
  
    ¿Cuál es el porcentaje de diamantes que tienen un precio entre 3590.17 y
    4678.23?
  # El bin más cercano a este rango, en mi tabla, es de (3665.75,4779]
  # Entonces: 9.66%
    ¿Cuál es el porcentaje de diamantes que tienen un precio menor a 7942.41?
  # El bin más cercano a ese valor es de (8118.75,9232.01]
  # Entonces: 86.62%
    ¿Cuál es el porcentaje de diamantes que tienen un precio mayor a 11206.58?
  # El bin más cercano fue (10345.3,11458.5]
  # Entonces: 100 - 93.26 = 6.74%
  "
  