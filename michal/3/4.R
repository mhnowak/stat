wspolczynnik_zmiennosci <- function(x, na.rm = FALSE) { 
  sd(x, na.rm = na.rm) / mean(x, na.rm = na.rm) * 100
}

inpt = c(1, NA, 3)
wspolczynnik_zmiennosci(inpt, na.rm = TRUE)

