# Postwork Sesión 1

#### Desarrollo

"El siguiente postwork, te servirá para ir desarrollando habilidades como si se 
tratara de un proyecto que evidencie el progreso del aprendizaje durante el
módulo, sesión a sesión se irá desarrollando.
A continuación aparecen una serie de objetivos que deberás cumplir, es un
ejemplo real de aplicación y tiene que ver con datos referentes a equipos de la
liga española de fútbol (recuerda que los datos provienen siempre de diversas
naturalezas), en este caso se cuenta con muchos datos que se pueden aprovechar,
explotarlos y generar análisis interesantes que se pueden aplicar a otras áreas.
Siendo así damos paso a las instrucciones:" 
  
#### 1. Del siguiente enlace, descarga los datos de soccer de la temporada 2019/2020 de la primera división de la liga española:

[origen de datos de la liga española](https://www.football-data.co.uk/spainm.php)

#### 2. Importa los datos a R como un Dataframe. NOTA: No olvides cambiar tu dirección de trabajo a la ruta donde descargaste tu archivo

```
sp1 <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")
```

#### 3. Del dataframe que resulta de importar los datos a `R`, extrae las columnas  que contienen los números de goles anotados por los equipos que jugaron en casa (FTHG) y los goles anotados por los equipos que jugaron como visitante (FTAG); guárdalos en vectores separados

```
v.FTHG <- sp1$FTHG
v.FTAG <- sp1$FTAG
```

#### 4. Consulta cómo funciona la función `table` en `R`. Para ello, puedes ingresar
#los comandos `help("table")` o `?table` para leer la documentación.
```
?table
```

>Usando la función table, con v.FTHG y v.FTGA como argumentos..
```
table(v.FTHG, v.FTAG)
```
>... se obtiene la tabla de frecuencia que cruza los goles de
visitante y local.


|        | v.FTAG | -| -| -| -|- | 
|--------|--------|-|-|-|-|-|
|v.FTHG | 0 | 1 | 2 | 3 | 4 | 5
| 0      | 33 |28 |15 | 8 | 2 | 2
| 1      | 43 |49 |32 | 5 | 3 | 0
| 2      | 39 |35 |20 | 3 | 2 | 0
| 3      | 14 |14 | 7 | 2 | 1 | 0
| 4      |  4 | 5 | 4 | 0 | 1 | 0
| 5      |  2 | 3 | 3 | 0 | 0 | 0
| 6      |  1 | 0 | 0 | 0 | 0 | 0


#### 5. Responde a las siguientes preguntas:
#####  a) ¿Cuántos goles tuvo el partido con mayor empate?

>Por simple inspección se observa que el mayor empate es 4-4 y su frecuencia fue 1

#####  b) ¿En cuántos partidos ambos equipos empataron 0 a 0?

>El cruce de un empate a 0 (0x0) indica una frecuencia de 33

#####  c) ¿En cuántos partidos el equipo local (HG) tuvo la mayor goleada sin dejar que el equipo visitante (AG) metiera un solo gol?

>En uno, en que metió 6 goles sin recibir ni uno.
