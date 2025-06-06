szampon_a <- c(4.44, 4.77, 6.56, 5.07, 5.13, 6.72, 5.46, 3.73, 4.31, 4.55)  
szampon_b <- c(0.89, 0.75, 0.38, 1.70, 3.13, 0.96, 1.18, 1.69, 1.93, 2.97, 2.70)  

out <- t.test(szampon_a, szampon_b, var.equal = FALSE)

print(out)
