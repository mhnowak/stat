# 1

# mierzy jak bardzo wartosci w prboie roznia sie od tej proby
#

# 2

# F to statystyka testowa w analizie wariancji
# Pr(>F) oznacza prawdopodobienstwo uzyskania wartosci wiekszej niz obserwowana wartosc F
# Pr to skrot od prawdopodobienstwo
# (>F) oznacza wartosci wieksze od F
# stad p-wartosc dla testu F w analizie wariancji

# 3
grubosc <- c(12.51,
             1.23,
             0.03,
             8.71,
             1.94,
             0.45,
             4.12,
             1.01,
             4.19,
             3.80,
             9.40,
             7.98,
             8.29,
             15.26,
             8.75)
n <- length(grubosc)

## 1) Typ zmiennej to float z precyzja do 2 miejsc po przecinku, jest to grubosc
## jest to grubosc krzemu w um, wartosci sa w przedziale od 0.03 do 15.26

## 2) Rozklad empiryczny
grubosc

## 3) Rozklad empiryczny - ilustracja
barplot(
  grubosc,
  main = "Rozklad empiryczny grubosci krzemu",
  xlab = "Pomiary",
  ylab = "grubosc krzemu (um)",
  col = "lightblue"
)

## 4) Odpowiednie statystyki opisowe

mean(grubosc)
median(grubosc)
sd(grubosc) # odchylenie standardowe
var(grubosc) # wariancja
# wspolczynnik zmiennosci grubosci
wspolczynnik_zmiennosci <- sd(grubosc) / mean(grubosc) * 100
cat("wspolczynnik zmiennosci: ", wspolczynnik_zmiennosci, "%", "\n")
summary(grubosc) # podsumowanie statystyczne

# Skosnosc
skewness <- function(x) {
  n <- length(x)
  mean_x <- mean(x)
  sd_x <- sd(x)
  sum(((x - mean_x) / sd_x)^3) / n
}

# Kurtoza
kurtosis <- function(x) {
  n <- length(x)
  mean_x <- mean(x)
  sd_x <- sd(x)
  sum(((x - mean_x) / sd_x)^4) / n - 3
}

cat("Skosnosc grubosci:", skewness(grubosc), "\n")
cat("Kurtoza grubosci:", kurtosis(grubosc), "\n")

## 5) Rozklad teoretyczny badanej zmiennej

## Sugeruje rozklad normalny zmiennej, poniewaz sa to wartosci grubosci w um,
## obrazuja grubosc materialu

## 6) Wartosc estymatora/ow paramtera/ow rozkladu teoretycznego

grubosc_dnorm <- dnorm(x = grubosc,
                       mean = mean(grubosc),
                       sd = sd(grubosc))
grubosc_dnorm


mu_est <- mean(grubosc)
# S
sigma_est_1 <- sd(grubosc)
# ENW
sigma_est_2 <- sqrt(mean((grubosc - mu_est)^2))
# ENMW
sigma_est_3 <- sqrt((n - 1) / 2) * gamma((n - 1) / 2) / gamma(n / 2) * sigma_est_1
cat("Estymator (mu): ", mu_est, "\t")
cat("Estymator (S): ", sigma_est_1, "\t")
cat("Estymator (ENW): ", sigma_est_2, "\t")
cat("Estymator (ENMW): ", sigma_est_3, "\n")

## 7) 99% przedzialow ufnosci rozkladu teoretycznego

library(EnvStats)
enorm(
  grubosc,
  ci = TRUE,
  ci.type = "two-sided",
  method = "mvue",
  conf.level = 0.99,
  ci.param = "mean"
)
enorm(
  grubosc,
  method = "mvue",
  ci = TRUE,
  ci.type = "two-sided",
  conf.level = 0.99,
  ci.param = "variance"
)
enorm(
  grubosc,
  method = "mvue",
  ci = TRUE,
  ci.type = "lower",
  conf.level = 0.99,
  ci.param = "mean"
)

## 8) ilustracja dopasowania rozkladu teoretycznego
hist(
  grubosc,
  main = "Histogram grubosci krzemu",
  xlab = "grubosc krzemu (um)",
  ylab = "prawdopodobienstwo",
  probability = TRUE,
  col = "lightblue"
)

curve(
  dnorm(x, mu_est, sigma_est_1),
  add = TRUE,
  col = "blue",
  lwd = 2
)
curve(
  dnorm(x, mu_est, sigma_est_2),
  add = TRUE,
  col = "green",
  lwd = 2
)
curve(
  dnorm(x, mu_est, sigma_est_3),
  add = TRUE,
  col = "red",
  lwd = 2
)
legend(
  "topright",
  legend = c("S", "ENW", "ENMW"),
  col = c("blue", "green", "red"),
  lwd = 2
)

# 4
plony_a <- c(37.95,
             752.40,
             4.95,
             49.50,
             163.35,
             9.90,
             292.05,
             105.60,
             21.45,
             24.75,
             79.20,
             62.70)
plony_b <- c(8.25, 359.70, 90.75, 6.60, 19.80, 4.95, 34.65, 92.40, 89.10, 7.03)

boxplot(plony_a, plony_b)

### sprawdzamy rownosc wariancji
var(plony_a)
var(plony_b)
var.test(plony_a, plony_b)
### Wariancje nie sa rowne

### Test Welcha
mean(plony_a)
mean(plony_b)
t.test(plony_a, plony_b, var.equal = FALSE)

(mean(plony_a) - mean(plony_b)) / sqrt((var(plony_a) + var(plony_b)) / 2)

### Istnosc alpha = 0.05
p_wartosc <- 0.3848
alpha <- 0.05
if (p_wartosc <= alpha) {
  print("Odrzucamy H0 na korzysc hipotezy H1.")
} else {
  print("Brak podstaw do odrzucenia H0.")
}

# 5
tak_tak <- 20
tak_nie <- 47
nie_tak <- 0
nie_nie <- 33

## Tak w wyniku eksperymentu 47 osob wiecej zaznaczylo odpowiedz "nie"
## lacznie 80% osob finalnie zaznaczylo odpowiez "nie", kiedy wczesniej
## bylo to zaledwie 
## Nikt nie zaznaczyl najpierw nie a potem tak
## byly 33 osoby ktore zaznaczyly najpeirw nie i nie zmienily zdania