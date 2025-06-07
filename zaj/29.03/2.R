load(url("http://ls.home.amu.edu.pl/data_sets/Centrala.RData"))
head(Centrala)
lambda_est <- mean(Centrala$Liczba)
lambda_est

probs <- dpois(sort(unique(Centrala$Liczba)), lambda = lambda_est)
sum(probs)
counts <- matrix(c(prop.table(table(Centrala$Liczba)), probs), nrow = 2, byrow = TRUE)
rownames(counts) <- c("empiryczny", "teoretyczny")
colnames(counts) <- sort(unique(Centrala$Liczba))
counts

# ???
barplot(counts, 
        xlab = "Liczba błędów", ylab = "Prawdopodobieństwo",
        main = "Rozkłady empiryczny i teoretyczny liczby błędów",
        col = c("red", "blue"), legend = rownames(counts), beside = TRUE)

# ???
# wykres kwantyl-kwantyl
qqplot(rbinom(length(liczba_bledow), size = m, prob = p_est), liczba_bledow)
qqline(liczba_bledow, distribution = function(probs) { qbinom(probs, size = m, prob = p_est) })

# przedziały ufności
library(EnvStats)
epois(Centrala$Liczba, ci = TRUE, conf.level = 0.95, ci.method = "exact")
# (1.561968, 1.932765)
?epois
# ???