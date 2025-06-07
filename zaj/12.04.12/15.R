library(UsingR)
head(homework)
ks.test(homework$Private, homework$Public)
plot(ecdf(homework$Private), main = "Dystrybuanty empiryczne")
lines(ecdf(homework$Public), col = "blue")
 