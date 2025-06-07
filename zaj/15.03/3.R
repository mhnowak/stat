awarie <- read.table("http://ls.home.amu.edu.pl/data_sets/awarie.txt")
head(awarie)
colnames(awarie) <- "czas"

data.frame(cbind(liczebnosc = table(awarie$czas),
                 procent = prop.table(table(awarie$czas))))

breaks_hist <- hist(awarie$czas, plot = FALSE)$breaks
cut(awarie$czas, breaks = breaks_hist)

data.frame(cbind(liczebnosc = table(cut(awarie$czas, breaks = breaks_hist)),
                 procent = prop.table(table(cut(awarie$czas, breaks = breaks_hist)))))

hist(awarie$czas)
 