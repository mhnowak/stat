awarie <- read.table("http://ls.home.amu.edu.pl/data_sets/awarie.txt")
head(awarie)
lambda_e <- 1 / mean(awarie$V1)
lambda_e
 