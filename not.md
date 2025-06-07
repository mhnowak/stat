Oto poprawiona wersja egzaminu w formacie Markdown:

⸻

EGZAMIN

ZADANIE 1

Czy estymator największej wiarygodności jest zawsze estymatorem nieobciążonym?
Odpowiedź uzasadnij:

Nie, estymator największej wiarygodności (EMW) nie jest zawsze estymatorem nieobciążonym. W wielu przypadkach EMW jest asymptotycznie nieobciążony, tzn. wraz ze wzrostem liczby obserwacji estymator zbiega do prawdziwej wartości parametru. Jednak dla małych prób może być obciążony. Przykładem jest estymator wariancji w rozkładzie normalnym — klasyczny EMW jest obciążony, natomiast wersja nieobciążona wymaga podzielenia przez n - 1 zamiast n.

⸻

ZADANIE 2

Kiedy wykonywanie testów post hoc ma sens i dlaczego?

Testy post hoc mają sens wtedy, gdy wcześniej wykonany test ogólny (np. ANOVA) wykazał istotność statystyczną, czyli istnienie różnic między grupami. Testy post hoc pozwalają zidentyfikować, które konkretne pary grup różnią się istotnie między sobą, przy kontrolowaniu poziomu błędu I rodzaju w wielu porównaniach.

⸻

ZADANIE 3

Zbiór danych iris zawiera dane dotyczące trzech odmian irysów. Wybierz z tego zbioru dane tylko dla irysów Setosa, a następnie wykonaj poniższe polecenia dla zmiennej Sepal.Length:

a) Jakiego typu jest badana zmienna? Jakie są wartości tej zmiennej?

Zmienna Sepal.Length jest zmienną ilościową ciągłą. Wartości tej zmiennej to długość działki kielicha (sepal) podana w centymetrach.

b) Przedstaw rozkład empiryczny badanej zmiennej z pomocą szeregu rozdzielczego

Przykład szeregu rozdzielczego (dane pogrupowane w klasy):

Przedział (cm)	Liczność
4.3–4.6	5
4.6–4.9	10
4.9–5.2	20
5.2–5.5	10
5.5–5.8	5

c) Zilustruj rozkład empiryczny badanej zmiennej za pomocą odpowiednich wykresów
	•	Histogram
	•	Wykres pudełkowy (boxplot)
	•	Wykres gęstości

d) Oblicz (jeśli to możliwe) odpowiednie statystyki opisowe
	•	Średnia
	•	Mediana
	•	Odchylenie standardowe
	•	Wariancja
	•	Wartość minimalna i maksymalna
	•	Kurtoza, skośność

e) Zasugeruj rozkład teoretyczny badanej zmiennej

Na podstawie histogramu i wykresu gęstości można zaproponować rozkład normalny, jeśli dane są symetryczne i mają dzwonowaty kształt.

f) Oblicz wartość estymatora/estymatorów parametru/parametrów rozkładu teoretycznego

Dla rozkładu normalnego:
	•	Estymator średniej: \hat{\mu} = \text{średnia z próby}
	•	Estymator odchylenia standardowego: \hat{\sigma} = \text{odchylenie standardowe z próby}

g) Wyznacz 90% przedziały ufności dla parametrów rozkładu teoretycznego

Przykład dla średniej:
CI_{90\%} = \bar{x} \pm t_{(n-1, 0.95)} \cdot \frac{s}{\sqrt{n}}

h) Sprawdź i zilustruj dopasowanie rozkładu teoretycznego za pomocą odpowiednich wykresów
	•	Wykres QQ-plot
	•	Nakładka rozkładu normalnego na histogram
	•	Test Shapiro–Wilka (dla normalności)

⸻

ZADANIE 4

W celu zbadania dwóch rodzajów szamponów A i B przeprowadzono eksperyment, w wyniku którego uzyskano następujące obserwacje:

szampon_a <- c(4.44, 4.77, 6.56, 5.07, 5.13, 6.72, 5.46, 3.73, 4.31, 4.55)
szampon_b <- c(0.89, 0.75, 0.38, 1.70, 3.13, 0.96, 1.18, 1.69, 1.93, 2.97, 2.70)

Pytanie: Czy istnieją istotne różnice w średniej wartości badanej zmiennej dla poszczególnych szamponów?

Analiza:
	1.	Sprawdzenie założeń:
	•	Normalność (np. test Shapiro–Wilka)
	•	Homogeniczność wariancji (np. test Levene’a lub F)
	2.	Dobór testu:
	•	Jeśli założenia spełnione: test t dla dwóch prób niezależnych
	•	Jeśli nie: test nieparametryczny (np. U Manna–Whitneya)
	3.	Hipotezy:
	•	H_0: brak różnic średnich
	•	H_1: średnie się różnią
	4.	Wyniki testu + wniosek statystyczny i praktyczny

⸻

ZADANIE 5

W zbiorze danych mtcars mamy informacje o szeregu zmiennych opisujących samochody.

Zbuduj model regresyjny opisujący zależność między zmienną Vs (0 lub 1) a dwiema zmiennymi niezależnymi mpg i drat. Wykonaj pełną analizę modelu, wraz z ewentualną redukcją.

Etapy analizy:
1.	Sprawdzenie typu zmiennej zależnej – Vs to zmienna binarna → regresja logistyczna.
2.	Model początkowy:

```r
model <- glm(Vs ~ mpg + drat, data = mtcars, family = binomial)
```

3.	Ocena istotności współczynników:
	•	Testy Wald’a (p-value)
	•	Współczynniki istotne statystycznie pozostają w modelu
4.	Redukcja modelu (np. stepwise regression)
5.	Ocena jakości modelu:
	•	AIC
	•	ROC curve, AUC
	•	Accuracy, confusion matrix
6.	Wniosek: Jaka jest relacja między Vs a mpg, drat i czy można uprościć model?
