load(url("http://ls.home.amu.edu.pl/data_sets/Centrala.RData"))

regular = table(Centrala)
regular_prop = prop.table(regular)

zad2 <- data.frame(cbind(liczebnosc = regular, procent = regular_prop))
zad2

barplot(
  regular,
  xlab = "Liczba zgloszen",
  ylab = "liczebnosc",
  main = "Rozkład empiryczny liczby zgłoszeń",
  col = c(1, 2, 3, 4, 5, 6)
)

pie(
  regular,
  main = "Rozkład empiryczny liczby zgłoszeń",
  col = c(1, 2, 3, 4, 5, 6)
)