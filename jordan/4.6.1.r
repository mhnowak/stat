# 1. Wczytaj dane
hamulce <- read.table("http://ls.home.amu.edu.pl/data_sets/hamulce.txt", dec = ",")
x <- hamulce$V1

# 2. Podstawowe statystyki
summary(x)

# 3. Test normalności
shapiro.test(x)

# 4. QQ-plot
qqnorm(x)
qqline(x, col = "red")

# 5. Estymatory odchylenia standardowego
n <- length(x)
x_bar <- mean(x)

S <- sd(x) # klasyczny, nieobciążony
ENW <- S # zakładamy normalność, więc = S
ENMW <- sqrt(sum((x - x_bar)^2) / n) # estymator maksymalnej wiarygodności (MLE)

# 6. Histogram + funkcje gęstości
x_vals <- seq(min(x) - 1, max(x) + 1, length.out = 200)

f_S <- dnorm(x_vals, mean = x_bar, sd = S)
f_ENW <- dnorm(x_vals, mean = x_bar, sd = ENW)
f_ENMW <- dnorm(x_vals, mean = x_bar, sd = ENMW)

hist(x,
    probability = TRUE, breaks = 10, col = "lightgray",
    main = "Histogram długości drogi hamowania + funkcje gęstości",
    xlab = "Droga hamowania [m]"
)

lines(x_vals, f_S, col = "blue", lwd = 2, lty = 1)
lines(x_vals, f_ENW, col = "green", lwd = 2, lty = 2)
lines(x_vals, f_ENMW, col = "red", lwd = 2, lty = 3)
lines(x_vals, x, col = "orange", lwd = 2, lty = 3)

legend("topright",
    legend = c("S (klasyczny)", "ENW", "ENMW (MLE)"),
    col = c("blue", "green", "red"), lty = c(1, 2, 3), lwd = 2
)

# 7. Wypisz estymatory
cat("S (klasyczny) =", round(S, 4), "\n")
cat("ENW =", round(ENW, 4), "\n")
cat("ENMW (MLE) =", round(ENMW, 4), "\n")
