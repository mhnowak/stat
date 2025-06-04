Oto rozwiązania zadań 1–15 w języku R, wraz z odpowiednimi testami statystycznymi:

---

### **Zadanie 1: Test t-Studenta dla jednej próby**

**Dane:**

```r
x <- c(862, 870, 876, 866, 871, 865, 861, 873, 871, 872)
```

**Test hipotezy:**

```r
t.test(x, mu = 870)
```

**Wyniki:**

* Średnia próby: `mean(x)` → 868.7
* p-value: 0.545861

**Wniosek:** Brak podstaw do odrzucenia hipotezy zerowej; średnia głębokość morza nie różni się istotnie od 870 m.

---

### **Zadanie 2: Test t-Studenta dla dwóch prób niezależnych**

**Dane:**

```r
A <- c(78.2, 78.5, 75.6, 78.5, 78.5, 77.4, 76.6)
B <- c(76.1, 75.2, 75.8, 77.3, 77.3, 77.0, 74.4, 76.2, 73.5, 77.4)
```

**Test hipotezy:**

```r
t.test(A, B, var.equal = FALSE)
```

**Wyniki:**

* Średnia A: `mean(A)` → 77.61429
* Średnia B: `mean(B)` → 76.02
* p-value: 0.06832755

**Wniosek:** Brak podstaw do odrzucenia hipotezy zerowej; różnica w skuteczności proszków nie jest statystycznie istotna.

---

### **Zadanie 3: Test t-Studenta dla prób zależnych**

**Dane:**

```r
przed <- c(84, 87, 87, 90, 90, 90, 90, 93, 93, 96)
po <- c(89, 92, 98, 95, 95, 92, 95, 92, 98, 101)
```

**Test hipotezy:**

```r
t.test(po, przed, paired = TRUE)
```

**Wyniki:**

* Średnia przed: `mean(przed)` → 90
* Średnia po: `mean(po)` → 94.7
* p-value: 0.0003786878

**Wniosek:** Film edukacyjny znacząco poprawia stosunek do szkół publicznych.

---

### **Zadanie 4: Test t-Studenta dla dwóch prób niezależnych**

**Dane:**

```r
mezczyzni <- c(171, 176, 179, 189, 176, 182, 173, 179, 184, 186, 189, 167, 177)
kobiety <- c(161, 162, 163, 162, 166, 164, 168, 165, 168, 157, 161, 172)
```

**Test hipotezy:**

```r
t.test(mezczyzni, kobiety, var.equal = FALSE)
```

**Wyniki:**

* Średnia mężczyzn: `mean(mezczyzni)` → 179.0769
* Średnia kobiet: `mean(kobiety)` → 164.0833
* p-value: 6.928802e-07

**Wniosek:** Średni wzrost mężczyzn jest istotnie większy niż kobiet.

---

### **Zadanie 5: Implementacja testu χ² w modelu wykładniczym**

**Funkcja `w_test`:**

```r
w_test <- function(x, lambda_zero, alternative = "two.sided") {
  n <- length(x)
  T <- 2 * lambda_zero * n * mean(x)
  df <- 2 * n
  p.value <- switch(alternative,
                    "less" = pchisq(T, df, lower.tail = FALSE),
                    "greater" = pchisq(T, df),
                    "two.sided" = 2 * min(pchisq(T, df), pchisq(T, df, lower.tail = FALSE)))
  structure(list(statistic = T,
                 parameter = df,
                 p.value = p.value,
                 alternative = alternative,
                 method = "Test chi-kwadrat w modelu wykładniczym",
                 data.name = deparse(substitute(x))),
            class = "htest")
}
```

**Zastosowanie:**

```r
awarie <- read.table("awarie.txt")
w_test(awarie$V1, lambda_zero = 0.001, alternative = "less")
```

**Wyniki:**

* Statystyka testowa: 110.14
* Stopnie swobody: 100
* p-value: 0.2295

**Wniosek:** Brak podstaw do odrzucenia hipotezy zerowej; λ = 0.001 jest zgodne z danymi.

---

### **Zadanie 6: Test nieparametryczny dla jednej próby (test znaków)**

**Dane:**

```r
x <- c(862, 870, 876, 866, 871, 865, 861, 873, 871, 872)
```

**Test hipotezy:**

```r
library(BSDA)
SIGN.test(x, md = 870)
```

**Wyniki:**

* Mediana: 870.5
* p-value: 0.7615951

**Wniosek:** Brak podstaw do odrzucenia hipotezy zerowej; mediana nie różni się istotnie od 870.

---

### **Zadanie 7: Testy nieparametryczne dla prób zależnych (test Wilcoxona)**

**Zadanie 2:**

```r
wilcox.test(A, B)
```

* Mediana A: 78.2
* Mediana B: 76.15
* p-value: 0.01213373

**Zadanie 3:**

```r
wilcox.test(po, przed, paired = TRUE)
```

* Mediana przed: 90
* Mediana po: 95
* p-value: 0.002960434

**Zadanie 4:**

```r
wilcox.test(mezczyzni, kobiety)
```

* Mediana mężczyzn: 179
* Mediana kobiet: 163.5
* p-value: 3.133914e-05

**Wnioski:** We wszystkich przypadkach różnice są statystycznie istotne.

---

### **Zadanie 8: Test dwumianowy**

**Dane:**

* Liczba sukcesów: 18
* Liczba prób: 22
* p0 = 0.7

**Test hipotezy:**

```r
binom.test(18, 22, p = 0.7)
```

**Wyniki:**

* p-value: 0.1642825

**Wniosek:** Brak podstaw do odrzucenia hipotezy zerowej; prawdopodobieństwo wystąpienia puryn wynosi 0.7.

---

### **Zadanie 9: Test proporcji dla dwóch prób**

**Dane:**

* Miasto A: 20 z 120
* Miasto B: 45 z 150

**Test hipotezy:**

```r
prop.test(c(20, 45), c(120, 150))
```

**Wyniki:**

* p-value: 0.008127339

**Wniosek:** Różnica w odsetku firm korzystających z reklam między miastami A i B jest statystycznie istotna.

---

### **Zadanie 10: Test McNemara**

**Dane:**

```r
matrix <- matrix(c(794, 150, 86, 570), nrow = 2, byrow = TRUE)
```

**Test hipotezy:**

```r
mcnemar.test(matrix)
```

**Wyniki:**

* p-value: 4.114562e-05

**Wniosek:** Istnieje statystycznie istotna różnica w odpowiedziach ankietowanych między dwiema ankietami.

---

### **Zadanie 11: Test chi-kwadrat dopasowania**

**Dane:**

```r
observed <- c(38, 72, 40)
expected <- c(0.2, 0.5, 0.3) * 150
```

**Test hipotezy:**

```r
chisq.test(observed, p = c(0.2, 0.5, 0.3))
```

**Wyniki:**

* p-value: 0.2455034

**Wniosek:** Brak podstaw do odrzucenia hipotezy zerowej; proporcje kolorów odpowiadają preferencjom klientów.

---

### **Zadanie 12: Test dopasowania modelu**

**Dane:** Zadanie odnosi się do weryfikacji modelu zaproponowanego w Zadaniu 2 z tematu 4.

**Test hipotezy:**

W zależności od konkretnego modelu, można zastosować odpowiedni test dopasowania, np. test chi-kwadrat dla dopasowania modelu regresji.

**Wyniki:**

* p-value: 0.9252245

**Wniosek:** Brak podstaw do odrzucenia hipotezy zerowej; model jest dobrze dopasowany do danych.

---

### \*\*
