# Introdução a Programação em Big Data
# Scripts em R da Aula04 
# Este script contém todos os comandos utilizados neste aula

# Verificação das bibliotecas carregadas ao iniciar
library(lib.loc=.Library)

# Bibliotecas/pacotes instalados 
installed.packages()

# Instalação de uma nova biblioteca
install.packages("ggplot2")

# Help da biblioteca 
library(help="ggplot2")
??ggplot2

# Verificar dataset cars
install.packages("datasets")
data(cars)
summary(cars)

# Calculadora
1 + 2 # Soma
3 - 5 # Subtração
7 * 3 # Multiplicação 
10 / 3 # Divisão 
2 ^ 5 # Exponenciação
5 ** 2 # Exponenciação
5 %% 2 # Resto ou Mod
5 %/% 2 # Inteiro da divisão

# Exemplos de funções 
max(1,2,5,78,37,13)
min(1,2,5,78,37,13)
factorial(5)
factorial( factorial(3) )

# Exemplo de plotagem 
plot(sin, from=-2*pi, to = 2*pi)
plot(dnorm, from = -3, to = 3)

x <- 1:10
y <- x^2 
plot(x,y)

1*2+3*7^3
(1 * 2) + (3 * (7 ^ 3))

# Atribuição
x1 <- 5
x2 = 7
13 -> x3

# Leitura 
idade = readline("Qual a sua idade?")
print(idade)
idade

# Carregar arquivo/dataset
picapaus = read.table("Aula04/picapaus.txt", header = TRUE)
head(picapaus, n = 10)
summary(picapaus)

# Calculo da média da ninhada de cada espécie 
mean(picapaus$ninhada[picapaus$especies=="verde"])
mean(picapaus$ninhada[picapaus$especies=="manchado"])

# Plotar histograma da ninhada 
hist(picapaus$ninhada)

