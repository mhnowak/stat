# Zadanie 8

# H0: p = 0.7
# H1: p > 0.7

# oszacowanie parametru p
18 / 22

# test dla wskaźnika struktury
prop.test(x = 18, n = 22, p = 0.7, alternative = "greater")
# test dwumianowy
binom.test(x = 18, n = 22, p = 0.7, alternative = "greater")

# Brak podstaw do odrzucenie H0.
 