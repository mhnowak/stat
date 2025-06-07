a <- c(78.2, 78.5,75.6,78.5,78.5,77.4,76.6)
b <- c(76.1, 75.2,75.8,77.3,77.3,77.0,74.4,76.2,73.5,77.4)

boxplot(a, b)

shapiro.test(a)
qqnorm(a)
qqline(a)

shapiro.test(b)
qqnorm(b)
qqline(b)

# równość wariancji
var(a)
var(b)
var.test(a, b, alternative = "less")

# ,,test główny'' - test t-Studenta
# H0: mu_1 = mu_2
# H1: mu_1 > mu_2
mean(a)
mean(b)
t.test(a, b, alternative = "greater", var.equal = TRUE)