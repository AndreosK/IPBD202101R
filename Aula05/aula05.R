# Aula 05 (23/03/2021)

# Limpeza das variáveis do ambiente
rm(list = ls())

# Representação numérica de constantes lógicas 
as.integer(TRUE)
as.integer(FALSE)

# Testando o Tipo
x = 13 
is.integer(x)
is.double(x)

y = 13L
is.integer(y)
is.double(y)

# Verificando o tipo da variável x
typeof(x)
class(x)
typeof(y)
class(y)

# Exemplos de c()

c(2, 7, 8, 12, 3, 25)
numeros = c(2, 7, 8, 12, 3, 25)

# vertor por intervalos
intervalo = c(3:9, 13:36)

# Vetor nomeado
alunos <- c(mestre="Penélope Charmosa",
            bacharel="Muttley",
            phd="Dick Vigarista")

alunos["phd"]
alunos[3]

# Exemplos de seq()
?seq

seq(from = 1, to = 13)
seq(1, 13)
seq(from = 1, to = 13, by = 2)
seq(from = 2, to = 10, by = 2)

# Exemplos de rep()
?rep

rep(6, 10)
rep(6, times = 10)
rep(1:3, 3)
rep(1:3, each = 2)

# Vetor com tipos diferentes na declaração
num <- c(91, "A")
num 

# Usando operador []
x = c(12, 15, 13, 17, 11)
x[4]
x[2:4]
x[-3]
x[-(2:4)]

# Operações em vetores
c(2, 3, 4) * c(4, 3, 2)
c(8, 12, 16) / 2
c(2, 5, 3) ** 2

# Funções úteis para vetores
# Fatorial de 5! 
prod(1:5)
impares = seq(from = 1, to = 13, by = 2)
impares >= 7
numeros <- c(1, 1, 3, 4, 4, 4, 13, 8)
unique(numeros)
rev(numeros)
rev( sort( numeros ) )

# Exemplo de factors() 
tamanhos <- factor(c("pequeno", "grande", 
                     "pequeno", "médio"))
tamanhos

sizes = c("pequeno", "grande", "pequeno", 
          "médio")
sizes <- factor( sizes, levels = 
                   c("pequeno", "médio",
                      "grande"))
sizes

sizes = c("pequeno", "grande", "pequeno", 
          "médio")

sizes <- ordered(factor(sizes,  levels = 
                    c("pequeno", "médio",
                    "grande")))

# Exemplos para list()

lista <- list(1:3, c("a", "b"), 
              c(TRUE, FALSE, TRUE))
lista
str(lista)
lista[1]

# Exemplos para matrix()
? matrix()
matrix(data = (1:8), nrow = 2, ncol = 3)
matrix(da = (1:6), nr = 2, nc = 3)

m <- matrix(data = 1:8, nrow = 4, ncol = 2)
m 
m[3,2]
m[2, ]
m[2:3, 1:2]

# Matriz 2 x 3 com números de 1:6
x = 1:6 
dim(x) <- c(2, 3)
x

col1 <- c(1, 2, 3)
col2 <- 10:12
cbind(col1, col2)

cbind(c(1,2,3), 10:12)

rbind(13:16, 1:4)

# RBind excedendo quantidade de elementos na segunda linha. Isto faz com que 
#       a primeira linha seja repetida até  completar a quantidade de elementos 
#       da segunda linha
rbind(13:16, 1:100)

# Data frames 
# Exemplo de data.frame()

df <- data.frame(ID = 3:5, 
                 Sexo = c("F", "F", "M"), 
                 Idade = c(17, 18, 18))
df
str(df)


alunos <- data.frame(id = 1:3,
          name = c("Penélope", "Muttley", "Muttley"),
          stringsAsFactors = TRUE)
alunos
str(alunos)

# acessar name dos alunos 
alunos$name

# Acesso a colunas e linhas específicas da matriz
z <- matrix(data=c(10:21), nrow = 3, ncol = 4)
z
z[1:2, c(1, 3)]