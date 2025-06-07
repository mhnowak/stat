# Zadanie 4
m <- c(171, 176, 179, 189, 176, 182, 173, 179, 184, 186, 189, 167, 177)
k <- c(161, 162, 163, 162, 166, 164, 168, 165, 168, 157, 161, 172)

boxplot(m, k)

# sprawdzamy normalność - do domu

# sprawdzamy równość wariancji
var(m)
var(k)
var.test(m, k, alternative = "greater")
# var.test(k, m, alternative = "less")
# Wariancje nie są równe.

# Test Welcha
mean(m)
mean(k)
t.test(m, k, var.equal = FALSE, alternative = "greater")
# Odrzucamy H0.

(mean(m) - mean(k)) / sqrt((var(m) + var(k)) / 2)
 