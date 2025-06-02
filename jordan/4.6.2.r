load(url("http://ls.home.amu.edu.pl/data_sets/Centrala.RData"))


zgloszenia <- table(Centrala)

# barplot
barplot(zgloszenia,
    main = "Liczba zgłoszeń do centrali",
    ylab = "Liczba zgłoszeń",
    col = rainbow(6),
    names.arg = Centrala$Miesiac
)

lambda <- mean(Centrala$Liczba)
x <- prop.table(zgloszenia)

# barplot(dbinom(x = 0:5, size = 200, prob = 1.74 / 200),
#     names.arg = 0:5,
#     xlab = "k", ylab = "P(X=k)", main = "Funkcja prawdopodobieństwa"
# )

curve(dpois(x, lambda),
    col = "blue", lwd = 2,
    xlab = "k", ylab = "P(X=k)",
    main = "Funkcja prawdopodobieństwa",
    add = TRUE
)
