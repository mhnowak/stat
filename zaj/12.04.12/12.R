dane <- matrix(c(50, 20, 10, 90, 50, 6), nrow = 3)
dane
chisq.test(dane)
# Odrzucamy H0. Stwierdzamy, że metody dają istotnie różne rozkłady zmiennej jakości.