wspolczynnik_zmiennosci <- function(x, na.rm = FALSE) {
    if (is.numeric(x) == FALSE) {
        stop("argument nie jest liczbą")
    }

    res <- sd(x, na.rm) / mean(x, na.rm = na.rm) * 100

    return(res)
}

x <- c(1, NA, 3)


print(wspolczynnik_zmiennosci(x))
## [1] NA
print(wspolczynnik_zmiennosci(x, na.rm = TRUE))
## [1] 70.71068
print(wspolczynnik_zmiennosci())
## Error in wspolczynnik_zmiennosci() :
##   argument "x" is missing, with no default
print(wspolczynnik_zmiennosci(c("x", "y")))
## Error in wspolczynnik_zmiennosci(c("x", "y")) : argument nie jest liczbą
