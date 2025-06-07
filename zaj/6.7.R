dane <- read.table("http://ls.home.amu.edu.pl/data_sets/kontekst.txt")
dane
colnames(dane) <- c("liczba", "grupa")
dane$grupa <- as.factor(dane$grupa)

# 1
aggregate(dane$liczba,
          list(grupa = dane$grupa), 
          FUN = mean)

boxplot(liczba ~ grupa, data = dane)

# 2 - test analizy wariancji
# H0: mu_1 = mu_2 = ... = mu_5
# H1: !H0
summary(aov(liczba ~ grupa, data = dane))
p_wartosc <- 0.00112
alpha <- 0.05
if (p_wartosc <= alpha) {
  print("Odrzucamy H0 na korzyść hipotezy H1.")
} else {
  print("Brak podstaw do odrzucenia H0.")
}

# 3
# normalność
shapiro.test(lm(liczba ~ grupa, data = dane)$residual)
qqnorm(lm(liczba ~ grupa, data = dane)$residual)
qqline(lm(liczba ~ grupa, data = dane)$residual)
# równość wariancji
bartlett.test(liczba ~ grupa, data = dane)
# ??? Wykonaj pozostałe testy równości wariancji.

# 4
# analiza post hoc
attach(dane)
pairwise.t.test(liczba, grupa, data = dane)

model_aov <- aov(liczba ~ grupa, data = dane)
TukeyHSD(model_aov)

library(agricolae)
HSD.test(model_aov, "grupa", console = TRUE)
# ??? Wykonaj pozostałe testy post hoc.

# 6
kruskal.test(liczba ~ grupa, data = dane)
pairwise.wilcox.test(liczba, grupa, data = dane)
# test Dunna
library(FSA)
dunnTest(liczba ~ grupa, data = dane, method = "bh")
