dane <- matrix(c(50, 20, 10, 90, 50, 6), nrow = 3)
dane
chisq.test(dane)
dane[, 1] / colSums(dane)[1]
dane[, 2] / colSums(dane)[2]
 