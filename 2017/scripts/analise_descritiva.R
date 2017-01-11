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

table(dados$sexo)
dados$sexo %>% table

mean(x = dados$idade, na.rm = TRUE)
mean(dados$idade, na.rm = TRUE)

var(x = dados$idade, na.rm = TRUE)
sd(x = dados$idade, na.rm = T)

dados$idade %>% var(na.rm=T) %>% sqrt
