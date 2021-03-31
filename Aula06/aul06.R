# Ajustar o Workspace para carregar os dados 
setwd("/data/Seafile/GOBSeafile/2021-01/3N_5SEM_IntroduçãoAProgramaçãoEmBigData/WorkSpace/IPBD202101R/Aula06")

# Importar os dados 
snail_data <- read.csv(file = "snail_feeding.csv",
                       header = TRUE,
                       sep = ",",
                       na.strings = "",
                       strip.white = TRUE,
                       stringsAsFactors = TRUE)

# Funções úteis do R
summary(snail_data)
names(snail_data)
head(snail_data, n = 30)
tail(snail_data)
str(snail_data)

# Problema 1: Remoção das últimas 3 colunas 
snail_data <- snail_data[ ,1:7]

# Verificar novamente a estrutura do dataset
str(snail_data)

# Problema 2: verificar e corrigir os níveis da variável/coluna Sex
unique(snail_data$Sex)
levels(snail_data$Sex)

snail_data$Sex[which(snail_data$Sex == "males")] <- "male"
snail_data$Sex[which(snail_data$Sex == "Male")] <- "male"

# Corrigir o factor da coluna alterada
snail_data$Sex <- factor(snail_data$Sex)

# Problema 4: verificar se tem alguma linha duplicada
duplicated(snail_data)
# Somar os duplicados 
sum(duplicated(snail_data))
# Qual a linha que esta duplicada?
which(duplicated(snail_data))
# Verificar a linha duplicada 
snail_data[which(duplicated(snail_data)),]
# Corrigir os dados unificando as observações
snail_data = unique(snail_data)
# Recalcular a numeração do vetor 
row.names(snail_data) <- 1:nrow(snail_data)

# Problema 3: Variável Depth com máximo incorreto (162.0)
summary(snail_data)
# Posição do valor máximo de Depth
which.max(snail_data$Depth)
# Correção  do valor máximo digitado erroneamente
snail_data[which.max(snail_data$Depth), 6] = 1.62
snail_data$Depth[which.max(snail_data$Depth)] = 1.62

# Exportar os dados corrigidos
write.csv(snail_data, file = "snail_feeding_ok.csv", row.names = FALSE)
save(snail_data, file = "snail_feeding.Rdata")

# Remover/Limpar variáveis do ambiente
rm(list = ls() )
