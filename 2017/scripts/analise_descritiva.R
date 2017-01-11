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

# Idade

mean(x = dados$idade, na.rm = TRUE)
mean(dados$idade, na.rm = TRUE)

var(x = dados$idade, na.rm = TRUE)
sd(x = dados$idade, na.rm = T)

dados$idade %>% var(na.rm=T) %>% sqrt





























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




