x <- c(242.2, 243.8, 252.8, 245.4, 245.6, 253.6, 247.3, 238.7,
       241.6, 242.8, 251.1, 246.8, 247.0, 245.6, 242.2, 253.9)
nortest::lillie.test(x)
plot(ecdf(x), main = "Dystrybuanty empiryczna i teoretyczna")
curve(pnorm(x, mean(x), sd(x)), col = "blue", add = TRUE, lwd = 2)
 