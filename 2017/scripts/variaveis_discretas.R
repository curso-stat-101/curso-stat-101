### Verão 2017
### Uma Introdução à Análise Exploratória de Dados e Métodos Estatísticos
### William Nilson de Amorim
### Script - Distribuições discretas

library(magrittr)
library(ggplot2)

### Bernoulli

X <- rbinom(n = 10, size = 1, prob = 0.7)
X

mean(X)
var(X)

0.7*(1-0.7) # variância

X %>% 
  data.frame(X = .) %>% 
  ggplot +
  geom_bar(aes(x = as.character(X), y = (..count..)/sum(..count..)), 
           fill = "white", color = "black", width = 0.2) +
  labs(x = "X", y = "Proporção estimada")

### Binomial

Y <- rbinom(n = 100, size = 10, prob = 0.5)
Y

mean(Y)
var(Y)


dados <- data.frame(Y =  c(rbinom(n = 10, size = 10, prob = 0.5),
                  rbinom(n = 100, size = 10, prob = 0.5),
                  rbinom(n = 500, size = 10, prob = 0.5),
                  rbinom(n = 1000, size = 10, prob = 0.5),
                  rbinom(n = 10000, size = 10, prob = 0.5)),
           n = c(rep(10, 10),
                 rep(100, 100),
                 rep(500, 500),
                 rep(1000, 1000),
                 rep(10000, 10000)))


dados %>%
  ggplot +
  geom_histogram(aes(x = Y), fill = "white", color = "black", binwidth = 1) +
  facet_grid(n ~ ., scales = "free_y")


### Poisson

Z <- rpois(n = 1000, lambda = 100)

ggplot(data = data.frame(Z = Z)) +
  geom_histogram(aes(x = Z), fill = "white", color = "black", binwidth = 1)


