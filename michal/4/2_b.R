load(url("http://ls.home.amu.edu.pl/data_sets/Centrala.RData"))

#Dwumianowy
# ---------

m <- 200
p_est <- mean(Centrala$Liczba) / m
print(p_est)

probs <- dbinom(sort(unique(Centrala$Liczba)), size = m, prob = p_est)
print(probs)

suma <- sum(probs)
print(suma)

counts <- matrix(c(prop.table(table(Centrala$Liczba)), probs), nrow = 2, byrow = TRUE)
rownames(counts) <- c("empiryczny", "teoretyczny")
colnames(counts) <- sort(unique(Centrala$Liczba))
print(counts)

barplot(counts, 
        xlab = "Liczba błędów", ylab = "Prawdopodobieństwo",
        main = "Rozkłady empiryczny i teoretyczny liczby błędów",
        col = c("red", "blue"), legend = rownames(counts), beside = TRUE)
