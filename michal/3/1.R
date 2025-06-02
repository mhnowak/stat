ankieta <- read.table("~/Documents/studia/stat/3/ankieta.txt", header = TRUE)

# print(head(ankieta))
zad2 <- data.frame(cbind(
  licz = table(pods_ankieta),
  proporcja = prop.table(table(pods_ankieta))
))

# zad2

pods_ankieta <- ankieta[ankieta$szkola == "p", "wynik"]

# pods_ankieta

zad3 <- data.frame(cbind(
  licz = table(pods_ankieta),
  proporcja = prop.table(table(pods_ankieta))
))

# zad3

# bar <- barplot(
#  table(ankieta$wynik),
#  xlab = "Odpowiedzi",
#  ylab = "Liczebność",
#  main = "Wyniki ankiety",
#  col = c(1, 2, 3, 4, 5)
# )
# 
# prop <- prop.table(table(ankieta$wynik))

emp <- barplot(
 prop.table(table(ankieta$wynik)),
 xlab = "Liczba zgłoszeń",
 ylab = "Prawdopodobienstwo",
 main = "Rozkład empiryczny liczby zgłoszeń",
 col = c(1, 2, 3, 4, 5)
)

emp <- barplot(
 cbind(table(ankieta[ankieta$plec == "m", "wynik"]),
       table(ankieta[ankieta$plec == "k", "wynik"])),
 xlab = "Liczba zgłoszeń",
 ylab = "Prawdopodobienstwo",
 main = "Rozkład empiryczny liczby zgłoszeń",
 col = rainbow(5),
 beside = TRUE,
)

# pie <- pie(
#   table(ankieta$wynik),
#   col = c(1, 2, 3, 4, 5)
# )