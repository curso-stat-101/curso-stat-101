# Medidas resumo
William Nilson de Amorim  
01/17  



## Frequência e proporção {.build}

- A *frequência absoluta* ($n_i$) representa o número de observações em uma determinada categoria ou valor da variável.

- A **frequência relativa** ou **proporção** é a razão entre a frequência absoluta e o total de observações ($n$).

- DISCUSSÃO: quando utilizar essas medidas?

## Medidas de posição {.build}

- Média: soma das observações dividida pelo total de observações.

\vspace{3mm}

\[
\frac{\sum_{i=1}^{n}X_i}{n} = \frac{X_1 + X_2 + ... + X_n}{n}
\]

- DISCUSSÃO

    - Quando utilizar a média?
    - Por que dividir por $n$?
    - Qual cuidado devemos ter ao utilizar a média como medida resumo?
    
## Medidas de posição {.build}

- Mediana: observação que ocupa a posição central dos dados ordenados.

- Exemplo 1: 3 7 10 5 2 1 1

- Exemplo 2: 15 3 2 0 9 17

- DISCUSSÃO: quando utilizar a mediana?

## Medidas de posição {.build}

- Quantis: observação que deixa uma determinada proporção das observações abaixo dela quando o conjunto de dados está ordenado.

- Exemplo 1: o quantil 10 ($q_10$) deixa 10% das observações ordenadas abaixo de si.
- Exemplo 1: o quantil 80 ($q_80$) deixa 80% das observações ordenadas abaixo de si.

- Em geral, o quantil p ($q_p$) deixa p% das observações ordenas abaixo de si.

- Quartis: 
    
    - Primeiro quartil (Q1): quantil 25
    - Segundo quartil (Q2): quantil 50 = mediana
    - Terceiro quartil (Q3): quantil 75
    - Quarto quartil (Q4): quantil 100 = máximo

## Medidas de posição {.build}

- Moda: observação mais frequente do conjunto de observações.

- DISCUSSÃO: quando utilizar a moda?

- DISCUSSÃO: qual o problema de utilizarmos apenas medidas de posição para resumir um conjunto de dados?

## Medidas de dispersão

- Variância: desvio quadrático médio em torno da média.

- Construção da variância

\[
\frac{\sum_{i=1}^{n}(X_i - \bar{X})^2}{n}
\]

## Medidas de dispersão

- Desvio-padrão: raiz quadrada da variância.

\[
\sqrt{\frac{\sum_{i=1}^{n}(X_i - \bar{X})^2}{n}}
\]

- DISCUSSÃO: por que utilizar o desvio-padrão?


## Medidas de associação

- DISCUSSÃO: o que é associação entre variáveis aleatórias?

- Associação entre variáveis categóricas: veremos no fim do curso.

- Associação entre variáveis quantitativas: coeficiente de correlação de Pearson.

- Outros coeficientes de correlação: Spearman, Kendall.

## Medidas de associação

- Coeficiente de correlação de Pearson

\vspace{3mm}

\[
\frac{1}{n}\sum_{i=1}^{n}\left(\frac{X_i - \bar{X}}{DP(X)}\right) \left(\frac{Y_i - \bar{Y}}{DP(Y)}\right)
\]
















