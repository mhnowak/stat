# histogram z estymatorem jądrowym gęstości
hist(awarie$V1, 
     xlab = "Czas", 
     main = "Rozkłady empiryczny i teoretyczny czasu",
     probability = TRUE, 
     col = "lightgreen")
lines(density(awarie$V1), col = "red", lwd = 2)
curve(dexp(x, lambda_e), 
      add = TRUE, col = "blue", lwd = 2)
legend("topright", legend = c("empiryczny", "teoretyczny"), col = c("red", "blue"), lwd = 2)

# wykres kwantyl-kwantyl
set.seed(1234)
qqplot(rexp(length(awarie$V1), rate = lambda_e), awarie$V1,
       xlab = "Kwantyle teoretyczne", ylab = "Kwantyle empiryczne")
qqline(awarie$V1, distribution = function(probs) { qexp(probs, rate = lambda_e) })

# przedział ufności
eexp(awarie$V1, ci = TRUE)
# (0.0006739116, 0.0011763746)

# wartość oczekiwana
1 / lambda_e
c(1 / 0.0011763746, 1 / 0.0006739116)
 