### Verão 2017
### Uma Introdução à Análise Exploratória de Dados e Métodos Estatísticos
### William Nilson de Amorim
### Script - Regressão

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

### Regressão linear

# Peso x altura

dados %>% 
  ggplot() +
  geom_point(aes(x = altura, y = peso))

fit <- lm(peso ~ altura, data = dados)
summary(fit)

dados %>% 
  mutate(altura.cm = altura*100) %>% 
  lm(peso ~ altura.cm, data = .) %>% 
  summary

dados %>% 
  ggplot() +
  geom_point(aes(x = altura, y = peso)) +
  geom_abline(intercept = fit$coefficients[1],
              slope = fit$coefficients[2])

f <- function(x) {
  
  fit$coefficients[1] + fit$coefficients[2]*x
  
}

f(1.80)

fit <- lm(peso ~ altura + sexo, data = dados)
summary(fit)

f2 <- function(x1, x2) {
  
  fit$coefficients[1] + fit$coefficients[2]*x1 +
    fit$coefficients[3]*x2
  
}

f2(1.80, 1)

# Idade x área

dados %>% 
  group_by(area) %>% 
  summarise(n = sum(!is.na(idade)), media = mean(idade, na.rm=T))

boxplot(dados$idade ~ dados$area)

dados %>% 
  ggplot() +
  geom_boxplot(aes(x = area, y = idade))

lm(idade ~ area + trabalha, data = dados) %>% summary

lm(idade ~ area, data = dados) %>% anova

aov(idade ~ area, data = dados) %>% summary

predict(object = fit, 
        new = data.frame(altura = 1.80))

# Idade x trabalha + sexo

lm(idade ~ trabalha + sexo, data = dados) %>% anova


# Area x Sexo

table(dados$area, dados$sexo)

chisq.test(x = dados$area, y = dados$sexo)

fisher.test(x = dados$area, y = dados$sexo)
