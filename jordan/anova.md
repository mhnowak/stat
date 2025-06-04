Oto **proste i przejrzyste notatki** z Twojego tekstu o **analizie wariancji (ANOVA)**:

---

## 📌 **Czym jest analiza wariancji (ANOVA)?**

* To metoda statystyczna do porównywania **średnich** cech (np. wzrostu, reakcji na lek) w **więcej niż dwóch grupach**.
* Badamy, czy różnice między grupami są istotne, czy wynikają z przypadku.

---

## 🧩 **Podstawowe pojęcia**

* **Y** – cecha liczbowo mierzona (np. reakcja na lek).
* **X** – zmienna grupująca (np. dawka leku), czyli grupy, do których należą obserwacje.
* **Grupy** – np. 5 różnych dawek: 0 ml, 10 ml, 20 ml, 30 ml, 40 ml.

---

## 🧪 **Model ANOVA**

Dla każdej obserwacji:

```
y_ij = μ_i + ε_ij
```

* `y_ij` – wartość obserwacji j w grupie i
* `μ_i` – średnia w grupie i
* `ε_ij` – losowy błąd (ma rozkład normalny N(0, σ²))

---

## 🧠 **Hipotezy**

* **H₀**: wszystkie średnie w grupach są równe (μ₁ = μ₂ = ... = μₐ)
* **H₁**: przynajmniej jedna średnia się różni

---

## 📊 **Podział wariancji**

Suma całkowitej zmienności:

```
SST = STR + SSE
```

* **SST** – całkowita suma kwadratów (całość)
* **STR** – suma kwadratów między grupami (obiekty)
* **SSE** – suma kwadratów w grupach (błąd)

---

## 🧮 **Tabela ANOVA**

| Źródło zmienności | Stopnie swobody | Suma kwadratów | Średni kwadrat    |
| ----------------- | --------------- | -------------- | ----------------- |
| Grupy (STR)       | a - 1           | SSR            | MSR = SSR / (a-1) |
| Błąd (SSE)        | n - a           | SSE            | MSE = SSE / (n-a) |
| Całość (SST)      | n - 1           | SST            | -                 |

---

## 🧪 **Test F**

Statystyka testowa:

```
F = MSR / MSE
```

* Porównywana z wartością krytyczną z rozkładu F-Snedecora.
* Jeśli F > F\_kryt, odrzucamy H₀ → są różnice między grupami.

---

## 📈 **Przykład – dane `vaccination`**

* Dane: reakcje organizmu na 5 różnych dawek leku.
* Średnie reakcji różnią się między grupami.
* Wynik testu ANOVA: **p < 0.001**, więc odrzucamy H₀ – dawka **ma wpływ** na reakcję.

---

## ✅ **Założenia ANOVA**

1. **Normalność reszt** – sprawdzamy testem Shapiro-Wilka.
2. **Równość wariancji** między grupami – testy:

   * Bartletta
   * Levene’a
   * Flingera-Killeena
   * Browna-Forsytha

Jeśli te założenia są złamane → używamy **testu Kruskala-Wallisa** (nieparametryczna wersja ANOVA).

---

Jeśli chcesz, mogę zrobić też **graficzną ściągę** albo uproszczony diagram pokazujący przepływ analizy.
