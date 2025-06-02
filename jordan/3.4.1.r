# 1. Zaimportuj dane z pliku ankieta.txt do zmiennej ankieta.

# Odczyt tabeli z pliku tekstowego
ankieta <- read.table("http://ls.home.amu.edu.pl/data_sets/ankieta.txt", header = TRUE, dec = "\t")


# 2. Przedstaw rozkład empiryczny zmiennej wynik za pomocą szeregu rozdzielczego.
# Szereg kategorii pola wynik
szereg_kat <- table(ankieta$wynik)
print("szereg_kat")
print(szereg_kat)

# Tabela częstości w procentach
czestosci_wzgledne <- prop.table(szereg_kat)
print(data.frame(cbind(liczebnosc = szereg_kat, procent = czestosci_wzgledne)))

# 3. Przedstaw rozkład empiryczny zmiennej wynik tylko dla osób z wykształceniem podstawowym za pomocą szeregu rozdzielczego.
podstawowe <- subset(ankieta, szkola == "p") # alternatywa: podstawowe <- ankieta[ankieta$szkola == "p", ]
szereg_kat_podst <- table(podstawowe$wynik)
czestosci_wzgledne_podst <- prop.table(szereg_kat_podst)
print(czestosci_wzgledne_podst)


# 4. Przedstaw jako wykres słupkowy i kołowy

barplot(czestosci_wzgledne,
        main = "Rozkład odpowiedzi",
        xlab = "Odpowiedź",
        ylab = "Prawdopodobieństwo",
        col = rainbow(length(czestosci_wzgledne))
)

barplot(czestosci_wzgledne,
        main = "Rozkład odpowiedzi",
        xlab = "Odpowiedź",
        ylab = "Prawdopodobieństwo",
        col = rainbow(length(czestosci_wzgledne))
)

pie(czestosci_wzgledne,
        main = "Rozkład odpowiedzi – osoby z wykształceniem podstawowym",
        col = rainbow(length(czestosci_wzgledne))
)

# Zilustruj wyniki ankiety za pomocą wykresu słupkowego z podziałem na kobiety i mężczyzn.

kobiety <- table(ankieta[ankieta$plec == "k", "wynik"])
mezczyzni <- table(ankieta[ankieta$plec == "m", "wynik"])
data <- rbind(kobiety, mezczyzni) # tworzenie macierzy z wynikami dla kobiet i mężczyzn o rónych długosciach
barplot(data,
        beside = TRUE,
        main = "Wyniki ankiety z podziałem na płeć",
        ylab = "Liczba odpowiedzi",
        legend.text = c("Kobiety", "Mężczyźni")
)

# rbind grupuje dane w wiersze, a cbind w kolumny
