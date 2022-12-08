"Reto 1. Swedish Motor Insurance
OBJETIVO

Estimar y comparar modelos de regresión lineal

REQUISITOS

Tener R y Rstudio instalado
Haber cubierto los temas en el prework
Realizar los ejemplos

DESARROLLO

#Reto 01: Regresión Lineal y predicción

Una aseguradora de automóviles sueca está interesada en un modelo predictivo
que le permite establecer el pago que sus clientes deben hacer por el seguro
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

"Interpretación: TBA"
#Con el primero modelo, estima uno nuevo quitando la variable Insured. No
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

"Interpretación: ... próximamante"
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

"Interpretación: ... de un momento a otro"
#¿Cuál de los 3 modelos tiene un mejor poder predictivo?
  