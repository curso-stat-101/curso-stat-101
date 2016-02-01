### Script --- regressão linear simples

### CARREGANDO AS BIBLIOTECAS

library(ggplot2)
library(magrittr)
library(dplyr)

### LENDO O BANCO DE DADOS

dados <- read.csv(file = "dados.csv")

str(dados)

dados <- read.csv(file = "dados.csv", stringsAsFactors = FALSE)

str(dados)

### ANÁLISE DESCRITIVA

# Medidas resumos

summary(dados)

summary(dados[,-1])

# Gráficos

ggplot(data = dados) +
  geom_point(aes(x = comprimento, y = preco)) +
  xlab("Comprimento") +
  ylab("Preço")

ggplot(data = dados) +
  geom_point(aes(x = motor, y = preco)) +
  xlab("Motor") +
  ylab("Preço")

ggplot(data = dados) +
  geom_boxplot(aes(x = ni, y = preco)) +
  xlab("Nacional/Importado") +
  ylab("Preço")

ggplot(data = dados) +
  geom_histogram(aes(x = log(preco)), binwidth = 0.5, color = "black", fill = "white") +
  labs(x = "Preço", y = "Frequência")


# Modelo de regressão linear 

fit <- lm(preco ~ comprimento + motor + ni, data = dados)

fit
summary(fit)

# A variável "comprimento" não foi considerada significativa

fit2 <- dados %>% 
  lm(preco ~ motor + ni, data = .) 

fit2
summary(fit2)

# Mudando a interpretação do intercepto

dados %<>% mutate(motor2 = motor - min(motor))

fit3 <- dados %>% 
  lm(preco ~ motor2 + ni, data = .) 

fit3
summary(fit3)

### ANOVA

anova(fit3)

### Análise de resíduos

names(fit3)
names(summary(fit3))

dados %>%
  mutate(preco.est = fit3$fitted.values %>% as.vector(), res = fit3$residuals %>% as.vector(), 
         res.pad = fit3$residuals/summary(fit3)$sigma %>% as.vector()) %>%
  ggplot +
  geom_point(aes(x = preco.est, y = res.pad)) +
  labs(x = "Valores estimados", y = "Resíduo padronizado")
  

  dados %>%
    mutate(preco.est = fit3$fitted.values %>% as.vector(), res = fit3$residuals %>% as.vector(), 
           res.pad = fit3$residuals/summary(fit3)$sigma %>% as.vector()) %>%  
    ggplot +
    geom_point(aes(sample = res), stat = "qq") +
    labs(x = "Quantis da normal padrão", y = "Quantis dos resíduos")

