| **Test**                                              | **Kiedy stosować?**                                      | **Rodzaj danych**     | **Liczba prób / grup** | **Założenia**                             |
| ----------------------------------------------------- | -------------------------------------------------------- | --------------------- | ---------------------- | ----------------------------------------- |
| **Shapiro-Wilka**                                     | Sprawdzenie, czy dane mają rozkład normalny              | Liczbowe              | 1 grupa                | Dane ciągłe, n < 50-2000                  |
| **Test t-Studenta dla jednej próby**                  | Porównanie średniej z daną wartością (np. μ = 0)         | Liczbowe              | 1 grupa                | Rozkład normalny                          |
| **Test t-Studenta dla dwóch prób niezależnych**       | Porównanie średnich w dwóch grupach (np. A vs B)         | Liczbowe              | 2 grupy (niezależne)   | Rozkład normalny, równość wariancji       |
| **Test Welcha (t-Welcha)**                            | Jak wyżej, gdy **wariancje są różne**                    | Liczbowe              | 2 grupy (niezależne)   | Rozkład normalny, brak równości wariancji |
| **Test F-Snedecora**                                  | Sprawdzenie, czy dwie wariancje są równe                 | Liczbowe              | 2 grupy                | Rozkład normalny                          |
| **Test t-Studenta dla prób zależnych (sparowanych)**  | Porównanie średnich przed i po (np. ten sam uczestnik)   | Liczbowe              | 2 grupy (zależne)      | Rozkład normalny różnic                   |
| **Test Manna-Whitneya-Wilcoxona**                     | Porównanie median w dwóch niezależnych grupach           | Liczbowe / porządkowe | 2 grupy                | Brak rozkładu normalnego                  |
| **Test Kołmogorowa-Smirnowa (1 próba)**               | Porównanie rozkładu danych z teoretycznym (np. normalny) | Liczbowe              | 1 grupa                | Dowolny rozkład                           |
| **Test Kołmogorowa-Smirnowa dla dwóch prób**          | Porównanie rozkładów dwóch grup                          | Liczbowe              | 2 grupy                | Niezależne próbki                         |
| **Test istotności dla wskaźnika struktury (1 grupa)** | Czy udział cechy (np. 60%) różni się od założonego       | Kategoryczne          | 1 grupa                | np. p = 0.6                               |
| **Test dwumianowy**                                   | Jak wyżej, ale dla małych prób                           | Kategoryczne (0/1)    | 1 grupa                | Mała liczba sukcesów                      |
| **Test istotności dla dwóch wskaźników struktury**    | Czy proporcje cechy w dwóch grupach są różne             | Kategoryczne          | 2 grupy (niezależne)   | np. % kobiet w A vs B                     |
| **Test McNemary**                                     | Czy liczba zmian stanu (tak/nie) w parach różni się      | Kategoryczne (pary)   | 2 grupy (zależne)      | Dane w parach (przed/po)                  |
| **Test χ²-Pearsona (1 próba)**                        | Czy rozkład cech (np. kolory) różni się od oczekiwań     | Kategoryczne          | 1 grupa                | Wystarczająco duże próby                  |
| **Test χ²-Pearsona dla dwóch prób**                   | Czy zmienne kategoryczne są zależne (np. płeć vs wybór)  | Kategoryczne          | 2 grupy                | Niezależność, duże próby                  |


| **Test**                                      | **Zastosowanie**                        | **R: Przykład użycia**                            |
| --------------------------------------------- | --------------------------------------- | ------------------------------------------------- |
| **Shapiro-Wilka**                             | Sprawdzenie normalności                 | `shapiro.test(x)`                                 |
| **Test t-Studenta (jedna próba)**             | Czy średnia ≠ μ0                        | `t.test(x, mu = μ0)`                              |
| **Test t-Studenta (dwie próby niezależne)**   | Średnia grupy A vs B                    | `t.test(x, y, var.equal = TRUE)`                  |
| **Test Welcha (nierówne wariancje)**          | Jak wyżej, brak równości wariancji      | `t.test(x, y, var.equal = FALSE)` (domyślnie)     |
| **Test F-Snedecora**                          | Porównanie wariancji                    | `var.test(x, y)`                                  |
| **Test t-Studenta (próby zależne)**           | Porównanie wyników przed i po           | `t.test(x, y, paired = TRUE)`                     |
| **Test Manna-Whitneya-Wilcoxona**             | Niezależne grupy, brak normalności      | `wilcox.test(x, y)`                               |
| **Test Kołmogorowa-Smirnowa (1 próba)**       | Rozkład empiryczny vs teoretyczny       | `ks.test(x, "pnorm", mean(x), sd(x))`             |
| **Test Kołmogorowa-Smirnowa (2 próby)**       | Porównanie dwóch rozkładów              | `ks.test(x, y)`                                   |
| **Test dwumianowy (1 grupa)**                 | Czy p ≠ p0 (np. 12 sukcesów na 20 prób) | `binom.test(12, 20, p = 0.5)`                     |
| **Test dla wskaźnika struktury (większe n)**  | Jak wyżej, większe próby                | `prop.test(12, 20, p = 0.5)`                      |
| **Test dla dwóch wskaźników struktury**       | Porównanie udziałów (np. kobiet A vs B) | `prop.test(c(12, 10), c(20, 22))`                 |
| **Test McNemary**                             | Porównanie zmiany decyzji (pary)        | `mcnemar.test(matrix(c(10, 5, 3, 12), nrow = 2))` |
| **Test χ²-Pearsona (1 próbka)**               | Czy rozkład różni się od oczekiwań      | `chisq.test(c(10, 20, 30), p = c(0.3, 0.3, 0.4))` |
| **Test χ²-Pearsona (2 zmienne kategoryczne)** | Czy płeć zależy od wyboru produktu      | `chisq.test(table(płeć, produkt))`                |
