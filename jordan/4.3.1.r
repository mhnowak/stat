hamulce <- read.table("http://ls.home.amu.edu.pl/data_sets/hamulce.txt", dec = ",")
head(hamulce)

hist(hamulce$V1,
    xlab = "Długość drogi hamowania",
    main = "Rozkład empiryczny długości drogi hamowania",
    probability = TRUE,
    col = "lightgreen"
)
# lines(density(hamulce$V1), col = "red", lwd = 2)


# mu <- mean(hamulce$V1)
# sigma <- sd(hamulce$V1)
# curve(dnorm(x, mean = mu, sd = sigma),
#     col = "blue", lwd = 2, add = TRUE
# )

# barplot(dpois(x = 0:28, lambda = 7),
#     names.arg = 0:28,
#     xlab = "k", ylab = "P(X=k)", main = "Funkcja prawdopodobieństwa"
# )
