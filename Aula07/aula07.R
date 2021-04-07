# Aula 07
setwd("/data/Seafile/GOBSeafile/2021-01/3N_5SEM_IntroduçãoAProgramaçãoEmBigData/WorkSpace/IPBD202101R/Aula07")
fish_survey <- read.csv(file = "fish_survey.csv", header=TRUE)
str(fish_survey)
head(fish_survey, n=10)
fish_survey

# Instalação das bibliotecas de manipulação de data frames
install.packages("dplyr")
install.packages("tidyr")
library(dplyr)
library(tidyr)

# Soma das 3 últimas colunas em uma nova coluna somadora e o tipo dela em uma coluna de definição
fish_survey_group <- gather(fish_survey, Species, Total, 4:6)
str(fish_survey_group)

# Separar as linhas em colunas a partir dos tipos de uma dada coluna 
fish_survey_wide <- spread(fish_survey_group, Species, Total)
str(fish_survey_wide)
head(fish_survey_wide)

# Carga dos datasets que serão agrupados 
water_data <- read.csv("water_data.csv", header = TRUE)
gps_data <- read.csv("gps_data.csv", header = TRUE)
str(water_data)
str(gps_data)

str(fish_survey_group)
str(water_data)

# Combinação de datasets

fish_water <- inner_join(fish_survey_group, water_data, 
                         by = c("Site", "Month"))
str(fish_water)
str(gps_data)

fish_survery_combined <- inner_join(fish_water, gps_data, 
                                    by = c("Site", "Transect") )
str(fish_survery_combined)

# Limpar o ambiente 
rm(list = ls())

# Carregar o birdbehaviour
bird_behaviour <- read.csv("bird_behaviour.csv", 
                           header = TRUE, 
                           stringsAsFactors = TRUE)
str(bird_behaviour)
head(bird_behaviour)

# Adicionar a coluna log_FID
# Forma 1 de adicionar coluna
bird_behaviour$log_FID <- log(bird_behaviour$FID)
head(bird_behaviour)
# Forma 2 de adicionar coluna
bird_behaviour[, "log_FID1"] <- log(bird_behaviour$FID)
head(bird_behaviour)
# Forma 2 de adicionar coluna. mutate()
bird_behaviour <- mutate(bird_behaviour, log_FID2 = log(FID))
head(bird_behaviour)

# Separação de variáveis
str(bird_behaviour)
head(bird_behaviour)
bird_behaviour <- separate(bird_behaviour, 
                           Species, 
                           c("Genus", "Species"),
                           sep = "_",
                           remove = TRUE)

# Unificação de variáveis 
bird_behaviour <- unite(bird_behaviour, 
                           Species, 
                           c("Genus", "Species"),
                           sep = "_",
                           remove = TRUE)
str(bird_behaviour)
head(bird_behaviour)

# Subconjuntos dos dados 
# seleção das 5 primeiras variáveis
bird_behaviour[,1:5]

# seleção dos 5 primeiras linhas fibonnaccis
bird_behaviour[c(1,2,3,5,8),]

# seleção das linhas 3 até 8 e colunas 1 até 5
bird_behaviour[3:8, 1:5]

# seleção das linhas cujo sexo do passarinho é female
bird_behaviour[bird_behaviour$Sex == "female", ]

# seleção de todas as linhas menos as 5 primeiras linhas fibonnaccis
bird_behaviour[-c(1,2,3,5,8),]

# seleção de todos os dados cuja variável Disturbance é menor que 13
subset(bird_behaviour, Disturbance < 13)

# seleção de todos os dados cuja variável Disturbance é menor que 13 e 
# são do senho male
subset(bird_behaviour, Disturbance < 13 & Sex == "male")

subset(bird_behaviour, Disturbance < 13 & Sex == "male", select = c(Ind, log_FID))

bird_behaviour_filter = subset(bird_behaviour, Disturbance < 13 & Sex == "male")
bird_behaviour_filter = bird_behaviour_filter[,c(1,8)]
str(bird_behaviour_filter)
str(bird_behaviour)
head(bird_behaviour_filter)

# subconjunto das linhas 13 a 36 
slice(bird_behaviour, 13:36)

# selecionar linhas por uma critério
filter(bird_behaviour,  Disturbance < 13 & Sex == "male")

# seleção dos 30% das linhas 
sample_frac(bird_behaviour, size = 0.3)

# seleção 36 linhas randomicamente
sample_n(bird_behaviour, 36)

# seleção das colunas Ind, Sex, FID
select(bird_behaviour, Ind, Sex, FID)

# seleção de todas as colunas menos log_FID1 e log_FID2
select(bird_behaviour, -c(log_FID1, log_FID2))

# Exemplo de Resumo - summarize

summarize( bird_behaviour,
           mean.FID = mean(FID), # média
           min.FID = min(FID),
           # mínimo
           max.FID = max(FID),
           # máximo
           med.FID = median(FID), # mediana
           sd.FID = sd(FID),
           # desvio padrão
           var.FID = var(FID),
           # varância
           n.FID = n()
           # tamanho da amostra
)

# Agrupamento/soma de todas as Species
bird_behaviour_by_species <- group_by( bird_behaviour, Species )

#Agora podemos obter resumos para cada espécie:
  summary_species <- summarize( bird_behaviour_by_species,
                                mean.FID = mean(FID), # média
                                min.FID = min(FID),
                                # mínimo
                                max.FID = max(FID),
                                # máximo
                                med.FID = median(FID), # mediana
                                sd.FID = sd(FID),
                                # desvio padrão
                                var.FID = var(FID),
                                # variância
                                n.FID = n()
                                # tamanho da amostra
  )
  
# Pode-se criar um data frame fora do "tibble" com:
summary_species_df <- as.data.frame(summary_species)
