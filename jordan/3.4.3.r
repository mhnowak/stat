awarie <- read.table("http://ls.home.amu.edu.pl/data_sets/awarie.txt")

# Szereg rozdzielczy w postaci tabeli
cuty <- cut(awarie$V1, breaks = seq(0, 3500, by = 500), right = TRUE)
tabela <- data.frame(cbind(
        liczebnosc = table(cuty),
        procent = prop.table(table(cuty))
))

print(tabela)
