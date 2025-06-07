m <- c(171, 176, 179, 189, 176, 182, 173, 179, 184, 186, 189, 167, 177)
k <- c(161, 162, 163, 162, 166, 164, 168, 165, 168, 157, 161, 172)

boxplot(m, k, ylab = "Wzrost (cm)")

# sprawdzanie normalności
shapiro.test(m)
qqnorm(m)
qqline(m)
p_value <- 0.8595
alpha <- 0.05
if (p_value <= alpha) {
  print("Odrzucamy H0 na korzyść hipotezy H1.")
} else if (p_value > alpha) {
  print("Brak podstaw do odrzucenia H0.")
}

shapiro.test(k)
qqnorm(k)
qqline(k)

# sprawdzamy równość wariancji
var(m)
var(k)
var.test(m, k, alternative = "greater")
p_value <- 0.04689
if (p_value <= alpha) {
  print("Odrzucamy H0 na korzyść hipotezy H1.")
} else if (p_value > alpha) {
  print("Brak podstaw do odrzucenia H0.")
}
# Brak równości wariancji.

# Test Welcha
mean(m)
mean(k)
t.test(m, k, var.equal = FALSE, alternative = "greater")
# Odrzucamy H0.