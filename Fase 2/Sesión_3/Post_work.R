library(dplyr)
library(reshape2)
library(ggplot2)

url1718 <- "https://www.football-data.co.uk/mmz4281/1718/SP1.csv"
url1819 <- "https://www.football-data.co.uk/mmz4281/1819/SP1.csv"
url1920 <- "https://www.football-data.co.uk/mmz4281/1920/SP1.csv"

d1718 <- read.csv(file = url1718) # Importación de los datos a R
d1819 <- read.csv(file = url1819)
d1920 <- read.csv(file = url1920)

str(d1718); str(d1819); str(d1920)

head(d1718); head(d1819); head(d1920)

View(d1718); View(d1819); View(d1920)

summary(d1718); summary(d1819); summary(d1920)

lista <- list(d1718, d1819, d1920)

nlista <- lapply(lista, select, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)

lapply(nlista, str)

nlista[[1]] <- mutate(nlista[[1]], Date = as.Date(Date, "%d/%m/%y"))
nlista[[2]] <- mutate(nlista[[2]], Date = as.Date(Date, "%d/%m/%Y"))
nlista[[3]] <- mutate(nlista[[3]], Date = as.Date(Date, "%d/%m/%Y"))

lapply(nlista, str)

data <- do.call(rbind, nlista)

dim(data)
str(data)
tail(data)
View(data)
summary(data)

(pcasa <- round(table(data$FTHG)/dim(data)[1], 3)) # Probabilidades marginales
# estimadas para los equipos que juegan en casa

(pvisita <- round(table(data$FTAG)/dim(data)[1], 3)) # Probabilidades marginales
# estimadas para los equipos que juegan como visitante

(pcta <- round(table(data$FTHG, data$FTAG)/dim(data)[1], 3)) # Probabilidades
# conjuntas estimadas para los partidos

pcasa <- as.data.frame(pcasa)

str(pcasa)

pcasa <- pcasa %>%
  rename(goles = Var1, FRel = Freq)

tail(pcasa)


p <- ggplot(pcasa, aes(x = goles, y = FRel)) + 
  geom_bar (stat="identity", fill = 'blue') +
  ggtitle('Equipo de casa')

p

pvisita <- as.data.frame(pvisita)

pvisita <- rename(pvisita, goles = Var1, FRel = Freq)
tail(pvisita)

p1 <- ggplot(pvisita, aes(x = goles, y = FRel)) + 
  geom_bar (stat="identity", fill = 'red') +
  ggtitle('Equipo visitante')

p1

pcta <- melt(pcta) # Función del paquete reshape2

pcta <- rename(pcta, gcasa = Var1, gvisita = Var2, ProbEst = value)

pcta %>%
  ggplot(aes(gcasa, gvisita)) + 
  geom_tile(aes(fill = ProbEst)) + 
  ggtitle('Probabilidades conjuntas estimadas')+
  scale_fill_gradient(low = 'white', high = 'purple') + 
  theme(axis.text.x = element_text(angle = 90,hjust = 0))
