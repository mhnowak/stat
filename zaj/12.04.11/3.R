# próby zależne
przed <- c(84, 87, 87, 90, 90, 90, 90, 93, 93, 96)
po <- c(89, 92, 98, 95, 95, 92, 95, 92, 98, 101)

boxplot(przed, po)

shapiro.test(przed)
qqnorm(przed)
qqline(przed)

p_value <- 0.7026
alpha <- 0.05
if (p_value <= alpha) {
  print("Odrzucamy H0 na korzyść H1.")
} else {
  print("Brak podstaw do odrzucenia H0.")
}

shapiro.test(po)
qqnorm(po)
qqline(po)

# H0: mu_przed = mu_po
# H1: mu_przed < mu_po

# estymatory
mean(przed)
mean(po)
t.test(przed, po, paired = TRUE, alternative = "less")
 