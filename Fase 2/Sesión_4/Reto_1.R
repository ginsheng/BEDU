"Una maquina de ensamblaje, tiene una probabilidad de 0.15 de ensamblar de forma
defectuosa una una unidad. Si la producción de una unidad es totaltamente
independiente de las demás y al día se producen 10 unidades:"

set.seed(0202)

" a) Grafica la función de distribución de la variable aleatoria. (Asume que se
obtienen 10,000 muestras)"

  unidades.diarias <- 10
  dias.de.muestra <- 10000
  p <- 0.15
  
  muestra <- rbinom(n = dias.de.muestra, size = unidades.diarias, prob = p)
  
  barplot(table(muestra)/length(muestra),
         main = "Distribución binomial",
         xlab = "Piezas defectuosas por día")

" b) ¿Cuál es la probabilidad de que se produzcan dos unidades defectuosas?"
  
  dbinom(x = 2, size = unidades.diarias, prob = p)
  
  # 0.2758967

"c) ¿Cuál es la probabilidad de que a lo mucho 4 unidades sean defectuosas?"

  pbinom(q=4, size= unidades.diarias, prob = p, lower.tail = TRUE)
  
  # 0.9901259

"d) ¿Cuál es la probabiliad de que por lo menos tres unidades se encuentren
defectuosa?"
  pbinom(q=2, size= unidades.diarias, prob = p, lower.tail = FALSE)
  
  # o también:
  1- pbinom(q=2, size= unidades.diarias, prob = p, lower.tail = TRUE)
  
  #0.1798035

"e) ¿Cuál es la probabilidad de que entre 2 y 4 unidades se encuentren
defectuosas?"
    dbinom(x = 2, size = unidades.diarias, prob = p)+
    dbinom(x = 3, size = unidades.diarias, prob = p)+
    dbinom(x = 4, size = unidades.diarias, prob = p)
  
  # o también:
  pbinom(q=4, size= unidades.diarias, prob = p, lower.tail = TRUE) -
    pbinom(q=1, size= unidades.diarias, prob = p, lower.tail = TRUE)
    
  
  # 0.4458261

"f) ¿Cuál es el número esperado de unidades defectuosas? ¿Con qué variación?"
  mean(muestra)
  #1.4905
  sd(muestra)
  #1.113478