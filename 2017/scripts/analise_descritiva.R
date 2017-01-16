### Verão 2017
### Uma Introdução à Análise Exploratória de Dados e Métodos Estatísticos
### William Nilson de Amorim
### Script - Análise descritiva

### Instalar pacotes

install.packages(c("nome_do_pacote"))

### Bibliotecas

library(openxlsx)
library(magrittr)
library(ggplot2)
library(dplyr)
library(tidyr)
library(lubridate)
library(stringr)

### Ler banco de dados

dados <- read.xlsx(xlsxFile = "2017/dados_questionario.xlsx")

### Sorteio dos grupos

urna <- 1:10

sample(x = urna, size = 10, replace = F)

### Análise descritiva

# Sexo

table(dados$sexo)
dados$sexo %>% table

plot()
barplot()
boxplot()
pie()
hist()

barplot(table(dados$sexo), col = "white")  # Gráfico de barras

ggplot(data = dados) +
  geom_bar(aes(x = sexo, fill = area), color = "black", width = 0.3,
           position = "dodge")   # Gráfico de barras ggplot

# Idade

mean(x = dados$idade, na.rm = TRUE)
mean(dados$idade, na.rm = TRUE)

var(x = dados$idade, na.rm = TRUE)
sd(x = dados$idade, na.rm = T)

dados$idade %>% var(na.rm=T) %>% sqrt

median(x = dados$idade, na.rm = T)

min(dados$idade, na.rm = T)
max(dados$idade, na.rm = T)
quantile(x = dados$idade, probs = c(0.10, 0.25, 0.50, 0.75), na.rm = T)


# categorizando a variável idade (ver função cut())

idade_c <- ifelse(dados$idade <= 25, "0", ifelse(dados$idade <= 40, "1", "2"))

dados$idade_c <- idade_c

ggplot(data = dados)+
  geom_boxplot(aes(x = idade_c, y = peso))  # Boxplot ggplot

cbind(dados$idade,idade_c)

table(idade_c)
table(dados$idade)


# Idade e peso

cor(x = dados$idade, y = dados$peso, use = "complete.obs")
cor(x = dados$idade, y = dados$peso, use = "complete.obs",
    method = "kendall")
cor(x = dados$idade, y = dados$peso, use = "complete.obs",
    method = "spearman")

plot(x = dados$idade, y = dados$peso)   # Gráfico de dispesão

hist(dados$peso)            # Histograma

ggplot(data = dados) +          # Histograma ggplot
  geom_histogram(aes(x = peso), fill = "white", color = "black", binwidth = 10)

# Peso e atividade física

cor(x = dados$atividade_fisica, y = dados$peso, use = "complete.obs")
cor(x = dados$atividade_fisica, y = dados$peso, use = "complete.obs",
    method = "kendall")
cor(x = dados$atividade_fisica, y = dados$peso, use = "complete.obs",
    method = "spearman")

plot(x = dados$atividade_fisica, y = dados$peso)

ggplot(data = dados) +
  geom_point(aes(x = idade, y = peso))   # Gráfico de dispesão ggplot

dados2 <- dados[-3,]   # Retirando a observação com atividade física = 150

cor(x = dados2$atividade_fisica, y = dados2$peso, use = "complete.obs")
cor(x = dados2$atividade_fisica, y = dados2$peso, use = "complete.obs",
    method = "kendall")
cor(x = dados2$atividade_fisica, y = dados2$peso, use = "complete.obs",
    method = "spearman")

plot(x = dados2$atividade_fisica, y = dados2$peso)

table(dados$sexo, dados$area)


# Tabela de medidas descritivas

dados_num <- dados %>% 
  sapply(FUN = is.numeric) %>% 
  as.logical() %>% 
  dados[,.] %>% 
  select(-aluno)

data.frame(
  
  'Variável' = dados_num %>% colnames,
  
  'n' = dados_num %>% 
    summarise_each(funs(sum(complete.cases(.)))) %>% 
    as.matrix %>% 
    as.numeric,
  
  'Média' = dados_num %>% 
    summarise_each(funs(mean(., na.rm=T))) %>% 
    as.matrix %>% 
    as.numeric,
  
  'DP' = dados_num %>% 
    summarise_each(funs(sd(., na.rm=T))) %>% 
    as.matrix %>% 
    as.numeric,
  
  'Min' = dados_num %>% 
    summarise_each(funs(min(., na.rm=T))) %>% 
    as.matrix %>% 
    as.numeric,
  
  'Q1' = dados_num %>% 
    summarise_each(funs(quantile(., probs = 0.25, na.rm=T))) %>% 
    as.matrix %>% 
    as.numeric,
  
  'Mediana' = dados_num %>% 
    summarise_each(funs(median(., na.rm=T))) %>% 
    as.matrix %>% 
    as.numeric,
  
  'Q3' = dados_num %>% 
    summarise_each(funs(quantile(., probs = 0.75, na.rm=T))) %>% 
    as.matrix %>% 
    as.numeric,
  
  'Max' = dados_num %>% 
    summarise_each(funs(max(., na.rm=T))) %>% 
    as.matrix %>% 
    as.numeric
)
