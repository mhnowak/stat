load(url("http://ls.home.amu.edu.pl/data_sets/Centrala.RData"))

centrala_rozk <- table(Centrala)
centrala_szereg <- prop.table(centrala_rozk)

print(data.frame(cbind(liczebnosc = centrala_rozk, procent = centrala_szereg)))

print(centrala_szereg)

barplot(centrala_szereg,
        main = "Slupkowy",
        xlab = "Odpowiedź",
        ylab = "Liczebność",
        col = rainbow(length(centrala_szereg))
)

# pie(centrala_szereg,
#         main = "Kolowy",
#         col = rainbow(length(centrala_szereg))
# )


print(mean(Centrala$Liczba))
print(median(Centrala$Liczba))
print(sd(Centrala$Liczba)) # odchylenie standardowe
print(var(Centrala$Liczba)) # wariancja
# współczynnik zmienności liczby zgłoszeń.
wspolczynnik_zmiennosci <- sd(Centrala$Liczba) / mean(Centrala$Liczba) * 100
print(wspolczynnik_zmiennosci)
print(summary(Centrala$Liczba)) # podsumowanie statystyczne
