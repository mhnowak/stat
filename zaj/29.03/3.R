barplot(counts, 
        xlab = "Liczba zgłoszeń", ylab = "Prawdopodobieństwo",
        main = "Rozkłady empiryczny i teoretyczny liczby zgłoszeń",
        col = c("red", "blue"), legend = rownames(counts), beside = TRUE)

# wykres kwantyl-kwantyl
set.seed(123)
qqplot(rpois(length(Centrala$Liczba), lambda = lambda_est), Centrala$Liczba,
       xlab = "Kwantyle teoretyczne", ylab = "Kwantyle empiryczne")
qqline(Centrala$Liczba, distribution = function(probs) { qpois(probs, lambda = lambda_est) })

# przedziały ufności
library(EnvStats)
epois(Centrala$Liczba, ci = TRUE, conf.level = 0.95, ci.method = "exact")
# (1.561968, 1.932765)
?epois
epois(Centrala$Liczba, ci = TRUE, conf.level = 0.95, ci.method = "pearson.hartley.approx")
epois(Centrala$Liczba, ci = TRUE, conf.level = 0.95, ci.method = "normal.approx")
 