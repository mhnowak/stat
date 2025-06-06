```R
install.packages("VGAM")  # jeśli jeszcze nie zainstalowany
library(VGAM)
```

Zestawienie sześciu wybranych rozkładów prawdopodobieństwa: **dwumianowego, Poissona, jednostajnego, normalnego, wykładniczego i Rayleigha**, wraz z:

* ✅ typem zmiennej,
* ✅ możliwymi wartościami,
* ✅ przykładem zastosowania,
* ✅ przykładowym użyciem funkcji gęstości lub masy prawdopodobieństwa w języku **R**.

---

## 📊 Tabela: Rozkłady a typ zmiennej

| Rozkład         | Typ zmiennej        | Wartości zmiennej            | Przykład z życia                                                     | R: funkcja gęstości / prawdop.                            |
| --------------- | ------------------- | ---------------------------- | -------------------------------------------------------------------- | --------------------------------------------------------- |
| **Dwumianowy**  | Dyskretna całkowita | 0, 1, ..., n                 | Liczba sukcesów w serii prób (np. liczba wygranych w 10 grach)       | `dbinom(3, size = 10, prob = 0.5)`                        |
| **Poissona**    | Dyskretna całkowita | 0, 1, 2, ...                 | Liczba zdarzeń w jednostce czasu (np. liczba klientów na godzinę)    | `dpois(4, lambda = 2.5)`                                  |
| **Jednostajny** | Ciągła              | Przedział \[a, b]            | Losowy punkt na odcinku                                              | `dunif(0.3, min = 0, max = 1)`                            |
| **Normalny**    | Ciągła              | Wszystkie liczby rzeczywiste | Wzrost, IQ, błędy pomiaru                                            | `dnorm(180, mean = 175, sd = 10)`                         |
| **Wykładniczy** | Ciągła              | Liczby rzeczywiste ≥ 0       | Czas do wystąpienia zdarzenia (np. czas do awarii, czas oczekiwania) | `dexp(3, rate = 0.5)`                                     |
| **Rayleigha**   | Ciągła              | Liczby rzeczywiste ≥ 0       | Prędkość cząstek, sygnały RF                                         | `x <- 2; sigma <- 1; (x/sigma^2) * exp(-x^2/(2*sigma^2))` |

---

## 🧪 Objaśnienia funkcji R:

| Funkcja w R                              | Znaczenie                                               |
| ---------------------------------------- | ------------------------------------------------------- |
| `dbinom(x, size, prob)`                  | Gęstość/m. prawdopodobieństwa dwumianowego: P(X = x)    |
| `dpois(x, lambda)`                       | Prawdopodobieństwo w rozkładzie Poissona: P(X = x)      |
| `dunif(x, min, max)`                     | Gęstość rozkładu jednostajnego w przedziale \[min, max] |
| `dnorm(x, mean, sd)`                     | Gęstość normalna w punkcie `x`                          |
| `dexp(x, rate)`                          | Gęstość wykładnicza; `rate = 1/średni czas oczekiwania` |
| Rayleigh                                 | Brak wbudowanej funkcji — zapisujemy wzór ręcznie:      |
| `(x / sigma²) * exp(−x² / (2 * sigma²))` |                                                         |

---

## 🧠 Przykład praktyczny:

Załóżmy, że mierzysz **czas między autobusami** (ciągła zmienna dodatnia).
Pytania i wybór:

* **Jakiego typu jest zmienna?** — Ciągła, dodatnia
* **Jakie są jej wartości?** — Czas ≥ 0
* **Rozkład?** — Wykładniczy
* **Funkcja gęstości w R?** — `dexp(5, rate = 0.2)`

---

Jeśli chcesz, mogę dodać także **wykresy tych rozkładów w R**, albo podpowiedzieć jak je dopasować do danych empirycznych.
