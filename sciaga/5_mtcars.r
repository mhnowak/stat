# Zadanie 5 - Analiza regresji dla zbioru danych mtcars

# 1. Wczytanie i przygotowanie danych
data(mtcars)
str(mtcars)

# 2. Podstawowa analiza danych
summary(mtcars[, c("vs", "mpg", "drat")])

# 3. Wizualizacja zależności
par(mfrow = c(1, 2))
plot(mtcars$mpg, mtcars$vs, main = "vs vs mpg", xlab = "mpg", ylab = "vs")
plot(mtcars$drat, mtcars$vs, main = "vs vs drat", xlab = "drat", ylab = "vs")

# 4. Konstrukcja modelu regresji logistycznej
# Ponieważ zmienna vs jest binarna (0/1), używamy regresji logistycznej
model <- glm(vs ~ mpg + drat, data = mtcars, family = binomial(link = "logit"))

# 5. Podsumowanie modelu
summary(model)

# 6. Analiza dopasowania modelu
# Obliczanie pseudo R-kwadrat
null_model <- glm(vs ~ 1, data = mtcars, family = binomial(link = "logit"))
pseudo_r2 <- 1 - (logLik(model)/logLik(null_model))
cat("\nPseudo R-kwadrat:", pseudo_r2, "\n")

# 7. Redukcja modelu
# Testowanie istotności zmiennych
drop1(model, test = "Chisq")

# 8. Wizualizacja wyników
# Wykres reszt
par(mfrow = c(2, 2))
plot(model)

# 9. Predykcje
# Przykładowe predykcje dla nowych danych
new_data <- data.frame(
  mpg = c(20, 25, 30),
  drat = c(3.5, 4.0, 4.5)
)
predictions <- predict(model, newdata = new_data, type = "response")
print("Predykcje dla nowych danych:")
print(data.frame(new_data, predicted_prob = predictions))

# 10. Wnioski
cat("\nWnioski:\n")
cat("1. Współczynniki modelu:\n")
print(coef(model))
cat("\n2. Istotność zmiennych:\n")
print(summary(model)$coefficients)

# 11. Analiza reszt
# Obliczanie reszt Pearsona
pearson_residuals <- residuals(model, type = "pearson")
cat("\nPodsumowanie reszt Pearsona:\n")
print(summary(pearson_residuals))

# 12. Analiza wpływu obserwacji
# Obliczanie statystyk wpływu
influence_measures <- influence.measures(model)
print("\nPodsumowanie statystyk wpływu:")
print(summary(influence_measures))