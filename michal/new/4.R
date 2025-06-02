x <- c(43, 47, 30, 45, 51, 48, 36, 41, 34, 36, 42 ,46)

mu_est <- mean(x)
print(mu_est)

sigma_est <- sd(x)
print(sigma_est)

val_est <- dnorm(x, mu_est, sigma_est)
print(val_est)
print(sum(val_est))

hist(x, 
     xlab = "Czas hamowania", 
     main = "Rozkłady empiryczny i teoretyczny czasu hamowania",
     probability = TRUE, 
     col = "lightgreen",
     )
lines(density(x), col = "red", lwd = 2)
curve(dnorm(x, mu_est, sigma_est), 
      add = TRUE, col = "blue", lwd = 2)
legend("topleft", legend = c("empiryczny", "teoretyczny"), col = c("red", "blue"), lwd = 2)

