median_cint <- function(x, conf_level = 0.95) {
    n <- length(x)
    x2_bar <- mean(x^2)
    z <- qnorm(1 - (1 - conf_level) / 2) # Kwantyl z rozkładu normalnego

    ln2 <- log(2)

    # Dolny i górny kraniec przedziału ufności
    l <- sqrt(ln2 * x2_bar * (1 - z / sqrt(n)))
    r <- sqrt(ln2 * x2_bar * (1 + z / sqrt(n)))

    # Szacowana wartość funkcji parametrycznej ENW # nolint: indentation_linter.
    est <- sqrt(x2_bar * ln2)

    return(structure(
        list(
            title = "Rayleigh median (approximate CI)",
            est = est,
            l = l,
            r = r,
            conf_level = conf_level
        ),
        class = "confint"
    ))
}

print.confint <- function(x) {
    cat(x$conf_level * 100, "percent confidence interval:", "\n")
    cat(x$l, " ", x$r, "\n")
}

summary.confint <- function(x) {
    cat("\n", "Confidence interval of", x$title, "\n", "\n")
    cat(x$conf_level * 100, "percent confidence interval:", "\n")
    cat(x$l, " ", x$r, "\n")
    cat("sample estimate", "\n")
    cat(x$est, "\n")
}


wind_speeds <- c(
    0.9, 6.2, 2.1, 4.1, 7.3,
    1.0, 4.6, 6.4, 3.8, 5.0,
    2.7, 9.2, 5.9, 7.4, 3.0,
    4.9, 8.2, 5.0, 1.2, 10.1,
    12.2, 2.8, 5.9, 8.2, 0.5
)

result <- median_cint(wind_speeds, conf_level = 0.95)
print(result)
summary(result) # Jeżeli zaimplementujesz metodę summary.confint
