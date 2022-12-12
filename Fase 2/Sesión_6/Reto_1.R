"Reto 1. Swedish Motor Insurance
DESARROLLO

#Reto 01: Regresión Lineal y predicción

Una aseguradora de automóviles sueca está interesada en un modelo predictivo
que le permita establecer el pago que sus clientes deben hacer por el seguro
(Payment), explicado por el número de casos (Claims) y el número de asegurados
(Insured).

Tu trabajo es determinar el mejor modelo de predicción."

df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-06/data/SwedishMotorInsurance.csv", header = TRUE)
head(df)

#Selecciona solo las variables de interés y realiza una matriz de correlaciones.

df.interes <- select(df, Insured, Claims, Payment)
round(cor(df.interes),4)

pairs(~ Payment + Claims + Insured, 
      data = df, gap = 0.4, cex.labels = 1.5)

#Estima un modelo de regresión lineal de acuerdo con lo solicitado por la
#aseguradora. No olvides interpretar tus resultados y realizar el diagnóstico
#sobre los residuos.

attach(df)
mx <- lm(Payment ~ Claims + Insured)

summary(mx)

"Residuals:
    Min      1Q  Median      3Q     Max 
-799392  -12743   -3733   10591  861235 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 3250.7447  1582.7077   2.054   0.0401 *  
Claims      4294.7750    18.2819 234.920   <2e-16 ***
Insured       28.3881     0.6514  43.580   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 71270 on 2179 degrees of freedom
Multiple R-squared:  0.9951,	Adjusted R-squared:  0.9951 
F-statistic: 2.211e+05 on 2 and 2179 DF,  p-value: < 2.2e-16"

"Interpretación:
El valor de R-Cuadrada múltiple nos dice que el 99.51% de la variación del Pago
está siendo explicado por el modelo.
Tanto el número de reclamaciones como el de asegurados provocan
una variación positiva a la variable del pago (Payment) al incrementarse.
A niveles de cofianza estándar, se rechazan las hipótesis nulas en favor de sus
correspondientes alternativas: que en la población, ambas beta son sidtintas de
cero."

StanResMX <- rstandard(mx)

par(mfrow = c(2,2))

"Realizando gráficas de disperción"
plot(Claims, StanResMX, ylab ="Residuales estandarizados")
"Más o menos se aprecia una correlación nula (algo recta)"
plot(Insured, StanResMX, ylab ="Residuales estandarizados")
"Más o menos se aprecia una correlación positiva (hacia el final)"

"Graficando Q-Q"
qqnorm(StanResMX)
qqline(StanResMX)

"La grafica Q-Q no muestra una correlación positiva (es plana) lo que lleva a
pensar en la poca significancia del modelo."

shapiro.test(StanResMX)

"Resultado:
Shapiro-Wilk normality test

data:  StanResMX
W = 0.58255, p-value < 2.2e-16"

"Interpretación: A niveles de confianza estándar, existe evidencia
estadística para rechazar la hipótesis nula en favor de la alternativa (no
distribuye como una normal"

dev.off()

#Con el primer modelo, estima uno nuevo quitando la variable Insured. No
#olvides interpretar tus resultados y realizar el diagnóstico sobre los
#residuos.

mx2 <- update(mx, ~.-Insured)

summary(mx2)
"Residuals:
     Min       1Q   Median       3Q      Max 
-1744858    -8545     2773    13386  1491369 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) -3362.29    2154.79   -1.56    0.119    
Claims       5020.08      10.35  485.11   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 97480 on 2180 degrees of freedom
Multiple R-squared:  0.9908,	Adjusted R-squared:  0.9908 
F-statistic: 2.353e+05 on 1 and 2180 DF,  p-value: < 2.2e-16"

"Interpretación: Descartar la variable Insured del modelo incrementó el
coeficiente de Reclamación (por mucho). Ahora es el 99.08% de de la variación
del Pago el que se explica en el modelo. El p-value continúa muy cercano a cero
y en los niveles de confianza estándar aún se rechaza la hipótesis nula, en 
favor de la anternativa: en la población beta1 es distinta de cero"

StanResMX2 <- rstandard(mx2)

par(mfrow = c(2,2))

"Realizando gráficas de disperción"
plot(Claims, StanResMX2, ylab ="Residuales estandarizados")
"Más o menos se aprecia una correlación nula (algo recta)"
plot(Insured, StanResMX2, ylab ="Residuales estandarizados")
"Más o menos se aprecia una correlación nula (algo recta)"

"Graficando Q-Q"
qqnorm(StanResMX2)
qqline(StanResMX2)

"La grafica Q-Q sigue sin una correlación positiva (es plana) lo que lleva a
pensar en la poca significancia del modelo."

shapiro.test(StanResMX2)

"Resultado:
Shapiro-Wilk normality test

data:  StanResMX2
W = 0.45666, p-value < 2.2e-16"

"Interpretación: con un p-value tan cercano a cero, a niveles de confianza
estándar se rechaza la hipótesis nula en favor de la alternativa (la variable
no distribuye como una normal)"

dev.off()

#Con el primer modelo, estima uno nuevo quitando la variable Claims. No
#olvides interpretar tus resultados y realizar el diagnóstico sobre los
#residuos.

mx3 <- update(mx, ~.-Claims)

summary(mx3)
"Residuals:
     Min       1Q   Median       3Q      Max 
-5946157   -75828   -70260   -30246  5343552 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 73852.388   7971.250   9.265   <2e-16 ***
Insured       167.695      1.383 121.266   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 365600 on 2180 degrees of freedom
Multiple R-squared:  0.8709,	Adjusted R-squared:  0.8708 
F-statistic: 1.471e+04 on 1 and 2180 DF,  p-value: < 2.2e-16"

"Interpretación: Comparado con los otros dos modelos, este presenta un menor
valor en R-Cuadrada Múltiple, el 87.09% de la variación está explicada en el
modelo."

StanResMX3 <- rstandard(mx3)

par(mfrow = c(2,2))

"Realizando gráficas de disperción"
plot(Claims, StanResMX3, ylab ="Residuales estandarizados")
"Más o menos se aprecia una correlación positiva"
plot(Insured, StanResMX3, ylab ="Residuales estandarizados")
"Más o menos se aprecia una correlación positiva"

"Graficando Q-Q"
qqnorm(StanResMX3)
qqline(StanResMX3)

"La grafica Q-Q sigue sin una correlación positiva (es plana) lo que lleva a
pensar en la poca significancia del modelo."

shapiro.test(StanResMX3)

"Resultado:
Shapiro-Wilk normality test

data:  StanResMX3
W = 0.28374, p-value < 2.2e-16"

"Interpretación: con un p-value tan cercano a cero, a niveles de confianza
estándar se rechaza la hipótesis nula en favor de la alternativa (la variable
no distribuye como una normal)"

dev.off()

#¿Cuál de los 3 modelos tiene un mejor poder predictivo?

"Si me basara en R-Cuadrada Múltiple, diría que el primer modelo tendría mayor
nivel predictivo.
Por otro lado, las gráficas de los residuales estandarizados en el modelo 3
presentan una mejoría en su correlación (más positiva).
Los tres modelos presentan, en sus pruebas Shapiro-Wilk, un p-value cercano a 0
lo que lleva al no-rechazo de la hipótesis de que la variable no distribuye
como normal."
  