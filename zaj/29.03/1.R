hamulce <- read.table("http://ls.home.amu.edu.pl/data_sets/hamulce.txt", dec = ",")
head(hamulce)
n <- nrow(hamulce)
# estymatory
(mu_est <- mean(hamulce$V1))
# S
(sigma_est_1 <- sd(hamulce$V1))
# ENW
(sigma_est_2 <- sqrt(mean((hamulce$V1 - mu_est)^2)))
# ENMW
(sigma_est_3 <- sqrt((n - 1) / 2) * gamma((n - 1) / 2) / gamma(n / 2) * sigma_est_1)

# histogram z estymatorem jądrowym gęstości
hist(hamulce$V1, 
     xlab = "Długość drogi hamowania", 
     main = "Rozkłady empiryczny i teoretyczny długości drogi hamowania",
     probability = TRUE, 
     col = "lightgreen")
lines(density(hamulce$V1), col = "red", lwd = 2)
curve(dnorm(x, mu_est, sigma_est_1), 
      add = TRUE, col = "blue", lwd = 2)
curve(dnorm(x, mu_est, sigma_est_2), 
      add = TRUE, col = "green", lwd = 2)

legend("topleft", legend = c("empiryczny", "teoretyczny"), col = c("red", "blue"), lwd = 2)
 