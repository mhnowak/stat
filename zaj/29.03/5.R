# histogram z estymatorem jądrowym gęstości
# ???
hist(hamulce$V1, 
     xlab = "Długość drogi hamowania", 
     main = "Rozkłady empiryczny i teoretyczny długości drogi hamowania",
     probability = TRUE, 
     col = "lightgreen")
lines(density(hamulce$V1), col = "red", lwd = 2)
curve(dnorm(x, mu_est, sigma_est), 
      add = TRUE, col = "blue", lwd = 2)
legend("topleft", legend = c("empiryczny", "teoretyczny"), col = c("red", "blue"), lwd = 2)

# wykres kwantyl-kwantyl
set.seed(123)
# ???
qqplot(rpois(length(Centrala$Liczba), lambda = lambda_est), Centrala$Liczba,
       xlab = "Kwantyle teoretyczne", ylab = "Kwantyle empiryczne")
qqline(Centrala$Liczba, distribution = function(probs) { qpois(probs, lambda = lambda_est) })

# ???
# przedział ufności
eexp()