# PostWork sesion 8

#1. Plantea el problema del caso
"
Establecer o determinar la relación existente entre el nivel socioeconómico y el gasto en productos no saludables


"
df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-08/Postwork/inseguridad_alimentaria_bedu.csv")

class(df)
head(df)
str(df)

#2. Realiza un análisis descriptivo de la información
"Para realizar el análisis descriptivo de la información, comenzamos con visualizar los datos contenidos en el dataframe
observamos que existen algunas variables cualitativas por lo que las hemos transformado en factores para poder realizar
un resumen sobre todas las variables
"
df$nse5f <- factor(df$nse5f, labels=c("Bajo","Medio Bajo","Medio","Medio Alto","Alto"), ordered=TRUE)
df$area <- factor(df$area,labels = c("Zona Urbana","Zona Rural"), ordered=TRUE)
df$sexojef <- factor(df$sexojef, labels = c("Hombre","Mujer"), ordered=TRUE)
df$IA <- factor(df$IA, labels = c( "No presenta IA", "Presenta IA"), ordered=TRUE)

summary(df)

df <- df[complete.cases(df),]
summary(df)

mean(exp(df$ln_alns))
mean(exp(df$ln_als))
sd(exp(df$ln_alns))

#3. Calcula probabilidades que nos permitan entender el problema en México

"Qué probabilidad hay de que una familia gaste en alimentos (saludables y no saludables) en un rango de 400 y 800"
par(mfrow = c(1,2))
hist(exp(df$ln_als))
(mean <- mean(exp(df$ln_als)))
(sd <- sd(exp(df$ln_als)))

hist(exp(df$ln_alns))
(mean <- mean(exp(df$ln_alns)))
(sd <- sd(exp(df$ln_alns)))

dev.off()

"Qué probabilidad hay de una familia de nivel medio gaste mas de 200 en alimentos no saludables "



"Qué probabilidad hay de que una familia de nivel bajo gaste en alimentos saludables"

"Qué probabilidad hay que una familia de la zona rural presente IA"

"Qué probabilidad hay que una familia de zona urbana presente IA"

#4. Plantea hipótesis estadísticas y concluye sobre ellas para entender el problema en México
"Ho: las familias de niveles socioeconómicos bajos gastan más en alimentos no saludables que las familias de niveles socioeconómicos más altos
Ha: !Ho
"

#5. Estima un modelo de regresión, lineal o logístico, para identificiar los determinanres de la inseguridad alimentaria en México
#Y = Bo + B1X + B2X2

#6. Escribe tu análisis en un archivo README.MD y tu código en un script de R y publica ambos en un repositorio de Github.

