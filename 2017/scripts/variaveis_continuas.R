### Verão 2017
### Uma Introdução à Análise Exploratória de Dados e Métodos Estatísticos
### William Nilson de Amorim
### Script - Distribuições contínuas

library(magrittr)
library(ggplot2)

### Normal

X <- rnorm(100)

### Exponencial

X <- rexp(100)

### Gama

X <- rgamma(100, shape = 2, rate = 1)
