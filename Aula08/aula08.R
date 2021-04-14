# Aula 8 - Gráficos 

# Limpeza do ambiente
rm(list = ls())

# Definir diretório para importação 
setwd("/data/Seafile/GOBSeafile/2021-01/3N_5SEM_IntroduçãoAProgramaçãoEmBigData/WorkSpace/IPBD202101R/DataSets")

# Carregar dataset
sparrows <- read.csv(file = "sparrows.csv", header = TRUE)

# Verificação do dataframe carregado 
names(sparrows)
str(sparrows)
summary(sparrows)

# hist() Histogramas
hist(sparrows$Tarsus)
hist(sparrows$Tarsus, 
     col = "green", 
     breaks = 50)
hist(sparrows$Tarsus, 
     col = "blue", 
     breaks = 50,
     freq = FALSE)

# Linhas de densidade na curva do gráfico 
lines(density(sparrows$Tarsus),  col = "red", lwd = 3 )

# Restringindo um coluna do dataset 
sparrows[sparrows$Sex == "Female",]$Tarsus

# Histograma considerando a restrição acima 
hist(sparrows[sparrows$Sex == "Female",]$Tarsus, col = "blue", breaks = 30)

# Restringindo com filter 
install.packages("dplyr")
library(dplyr)
sparrows_females <- filter(sparrows, Sex == "Female")
hist(sparrows_females$Tarsus, col = "grey", breaks = 30)
hist(sparrows_females$Tarsus, col = "#0000FF", breaks = 30)

# Verificando cores 
colors()
colours()

# plot() Gráficos de dispersão, etc
plot(sparrows$Wing, sparrows$Tarsus)
plot(Wing ~ Tarsus, data = sparrows )
plot(Tarsus ~ Wing, data = sparrows )


plot(sparrows$Wing, sparrows$Tarsus, 
     xlim = c(50, 70), 
     pch = 18, 
     col = "grey")

# Verificando as possibilidades de pontos 
?pch

plot(sparrows$Wing, sparrows$Tarsus, 
     xlim = c(50, 70), 
     pch = 4, 
     col = "blue")

# cex = tamanho, pch = desenho do dado, podendo incluir um desenho diferente
# para cada informação com c(22,4) por exemplo
plot(sparrows$Wing, sparrows$Tarsus, 
     xlim = c(50, 70), 
     pch = c(22,4), 
     cex = 1.3,
     col = "blue")

# Carregar dataset pressure do R Base 
data("pressure")
# diagrama com tipo diferente de representação
plot(pressure$temperature, pressure$pressure, type = "l")
plot(pressure$temperature, pressure$pressure, type = "o")

# boxplot() Diagrama de caixa com resumo dos dados
str(sparrows)
boxplot(Wing ~ Sex, data = sparrows)

# Formação do boxplots 
boxplot(Wing ~ Sex, data = sparrows, 
        xlab = 'Sexo',
        ylab = 'Tamanho da Asa (mm)', 
        main = "Diagrama de Caixa", 
        ylim = c(45, 70))

# Boxplots com multiplias variáveis 
boxplot(Wing ~ Sex + Species, data = sparrows, 
        xlab = 'Espécies e Sexo',
        ylab = 'Tamanho da Asa (mm)', 
        main = "Diagrama de Caixa", 
        col = c("grey", "blue"),
        ylim = c(45, 70))

# Preparar o espaço dos gráficos com 1 linha e 3 colunas
par(mfrow = c(1,3))
hist(sparrows$Tarsus, col = 'blue', freq = FALSE)
plot(sparrows$Wing, sparrows$Tarsus, pch=c(3,4), col = c("red","blue"))
boxplot(Wing ~ Sex, data = sparrows, col = c("grey", "green"))

# Preparar o espaço dos gráficos com 3 linhas e 1 coluna
par(mfrow = c(3,1))
# Preparar o espaço dos gráficos com 2 linhas e 2 colunas
par(mfrow = c(2,2))

# Formas de imprimir um gráfico 
# 1. dev.print()
par(mfrow = c(2,2))
hist(sparrows$Tarsus, col = 'blue', freq = FALSE)
plot(sparrows$Wing, sparrows$Tarsus, pch=c(3,4), col = c("red","blue"))
boxplot(Wing ~ Sex, data = sparrows, col = c("grey", "green"))
# preparação impressão 
setwd("/data/Seafile/GOBSeafile/2021-01/3N_5SEM_IntroduçãoAProgramaçãoEmBigData/WorkSpace/IPBD202101R/Aula08")
dev.print(device = pdf, file = "GraficoPorDevPrint.pdf") # imprimir para device
dev.off() # fechar device

# 2. Plotagem direto em arquivo 
pdf("GraficoDiretoParaArquivo.pdf", width = 4, height = 4)
hist(sparrows$Tarsus, col = 'blue', freq = FALSE)
plot(sparrows$Wing, sparrows$Tarsus, pch=c(3,4), col = c("red","blue"))
dev.off()

# 3. savePlot() - Só funciona com Windows
boxplot(Wing ~ Sex, data = sparrows, col = c("grey", "green"))
savePlot(filename = "GraficoPorSavePlot.jpeg", type = "jpeg")
dev.off()
# Alternativa Linux 
jpeg("GraficoPorSavePlot.jpeg")
boxplot(Wing ~ Sex, data = sparrows, col = c("grey", "green"))
dev.off()

# Carregar o GGPLOT
install.packages("ggplot2")
library(ggplot2)

# Histograma 
ggplot( sparrows, aes(Tarsus)) +
  geom_histogram(col="blue", binwidth = 0.1) +
  xlab("Tamanho do Tarsus (mm)") +
  ylab("Frequência")

ggplot( sparrows, aes( x = Wing, y = Tarsus)) +
  geom_point(position = position_jitter(width = .5, height = 0))

ggplot(sparrows, aes(Sex, Wing, fill = Sex) ) +
  geom_boxplot()

p <- ggplot(sparrows, aes(Sex, Wing, fill = Sex) ) +
  geom_boxplot()

ggplot_build(p)$data

# Exemplo com alteração de tema e algumas parametros/objetos 

# Adicionando titulo 
ggplot(sparrows, aes(Sex, Wing, fill=Sex)) +
  geom_boxplot() + 
  ggtitle("Boxplot ggplot2")

# Mesmo anterior centralizado
ggplot(sparrows, aes(Sex, Wing, fill=Sex)) +
  geom_boxplot() + 
  ggtitle("Boxplot ggplot2") +
  theme(plot.title = element_text(hjust = 0.5))

# Alterar rótulo do y
ggplot(sparrows, aes(Sex, Wing, fill=Sex)) +
  geom_boxplot() + 
  ggtitle("Boxplot ggplot2") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Tamanho da Asa (mm)")
