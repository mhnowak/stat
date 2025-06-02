load(url("http://ls.home.amu.edu.pl/data_sets/Centrala.RData"))

# Poissona
# ---------

lambda_hat <- mean(Centrala$Liczba)
print(lambda_hat)

emp <- prop.table(table(Centrala$Liczba))
print(emp)

x_vals <- as.numeric(names(emp))
theo <- dpois(x_vals, lambda = lambda_hat)
print(theo)

print("Comparison: ")
comparison <- rbind(emp, theo)

barplot(comparison, beside = TRUE,
        col = c("lightblue", "lightgreen"),
        legend.text = c("Empiryczny", "Teoretyczny"),
        names.arg = x_vals,
        main = "Porównanie: empiryczny vs teoretyczny (Poissona)",
        ylab = "Prawdopodobieństwo")



# emp_cdf <- sum(emp[x_vals < 4])
# theo_cdf <- ppois(3, lambda = lambda_hat)

# print(emp_cdf)
# print(theo_cdf)

# observed <- sort(Centrala$Liczba)
# expected <- qpois(ppoints(length(Centrala$Liczba)), lambda = lambda_hat)

# qqplot(expected, observed,
#        main = "Q-Q plot: Poisson vs Dane",
#        xlab = "Teoretyczne kwantyle (Poissona)",
#        ylab = "Empiryczne kwantyle")
# qqline(observed, distribution = function(p) qpois(p, lambda = lambda_hat),
#        col = "red", lwd = 2)

# 