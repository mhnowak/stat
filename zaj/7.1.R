rok <- 1995:2002
liczba_przyp <- c(39.7, 38.2, 34.7, 33.1, 30.1, 28.4, 26.3, 24.7)
data_set <- data.frame(year = rok, number = liczba_przyp)

# 1
plot(data_set, main = "Wykres rozrzutu", pch = 16)

# 2
model <- lm(number ~ year, data = data_set)
model
# number = -2.219 * year + 4466.667
abline(model, col = "red")

# 3
summary(model)
p_wartosc <- 1.65e-07
alpha <- 0.05
if (p_wartosc <= alpha) {
  print("Odrzucamy H0 na korzyść hipotezy H1.")
} else {
  print("Brak podstaw do odrzucenia H0.")
}

# 6
year_new <- 2003:2007
prognozy <- stats::predict(model, newdata = data.frame(year = year_new), interval = "prediction")
prognozy
plot(data_set, main = "Wykres rozrzutu", pch = 16, xlim = c(1995, 2007), ylim = c(10, 40))
abline(model, col = "red")
points(year_new, prognozy[, 1], pch = 17, col = "blue")
 