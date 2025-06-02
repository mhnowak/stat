# # 1.

# pole <- function(a, b, c) {
#     area <- 0.5 * abs((b$x - a$x) * (c$y - a$y) - (b$y - a$y) * (c$x - a$x))
#     return(area)
# }

# A <- list(x = 0, y = 0)
# B <- list(x = 1, y = 0)
# C <- list(x = 0, y = 1)
# pole_trójkąta <- pole(A, B, C)
# print(paste("Pole trójkąta o wierzchołkach A(1, 2), B(3, 4), C(5, 6) wynosi:", pole_trójkąta))


# 4.

x <- c(43, 47, 30, 45, 51, 48, 36, 41, 34, 36, 42, 46)

hist(rbind(sort(x)),
    main = "Czasy",
    col = rainbow(6),
)
