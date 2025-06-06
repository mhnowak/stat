seposa <- print(iris[iris$Species == "setosa",])
seposa_length <- seposa$Sepal.Length
print(seposa_length) # ilościowe ciągłe, cm, z dokladnoscia do 0.1

data <- data.frame(dlugosc_lodygi = seposa_length)

print(data)

print(summary(data))

seposa_length_table <- table(seposa_length)

# print(seposa_length_table_prop)

barplot(seposa_length_table,
        main = "Rozkład długości lodyg",
        xlab = "Długość lodygi",
        ylab = "Liczebność",
        col = rainbow(length(seposa_length_table))
)

seposa_length_table_prop <- prop.table(seposa_length_table)

barplot(seposa_length_table_prop,
        main = "Rozkład długości lodyg",
        xlab = "Długość lodygi",
        ylab = "Liczebność",
        col = rainbow(length(seposa_length_table_prop))
)

hist(seposa_length,
        main = "Histogram długości lodyg",
        xlab = "Długość lodygi",
        probability = TRUE,
        col = rainbow(length(seposa_length))
)

seposa_dnorm <- dnorm(x = seposa_length, mean = mean(seposa_length), sd = sd(seposa_length))
curve(dnorm(x, mean = mean(seposa_length), sd = sd(seposa_length)),
        add = TRUE,
        col = "red",
        lwd = 2
)

library(EnvStats)
enom <- enorm(seposa_length, ci = TRUE, method = "mvue", conf.level = 0.90, ci.param = "mean")

# Estymator średniej (średnia z próby)
mu_hat <- mean(seposa_dnorm)

# Estymator odchylenia standardowego (odchylenie standardowe z próby)
sigma_hat <- sd(seposa_dnorm)

# Wyświetlenie wyników
cat("Estymowana średnia (mu_hat):", mu_hat, "\n")
cat("Estymowane odchylenie standardowe (sigma_hat):", sigma_hat, "\n")
