x <- c(862, 870, 876, 866, 871, 865, 861, 873, 871, 872)

# sprawdzamy normalność
# H0: normalność
# H1: brak normalności
shapiro.test(x)
qqnorm(x)
qqline(x)
p_value <- 0.5459
alpha <- 0.05
if (p_value <= alpha) {
  print("Odrzucamy H0")
} else if (p_value > alpha) {
  print("Brak podstaw do odrzucenia H0")
}

# ,,test główny'' - test t-Studenta
# H0: mu = 870
# H1: mu < 870
mean(x)
t.test(x, mu = 870, alternative = "less")
 