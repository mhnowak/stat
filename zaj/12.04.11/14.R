x <- c(242.2, 243.8, 252.8, 245.4, 245.6, 253.6, 247.3, 238.7,
       241.6, 242.8, 251.1, 246.8, 247.0, 245.6, 242.2, 253.9)
library(nortest)
lillie.test(x)
plot(ecdf(x))
curve(pnorm(x, mean(x), sd(x)), add = TRUE, col = "blue")
 