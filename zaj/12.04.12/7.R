przed <- c(84, 87, 87, 90, 90, 90, 90, 93, 93, 96)
po <- c(89, 92, 98, 95, 95, 92, 95, 92, 98, 101)
boxplot(przed, po)
# Test nieparametryczny - test Manna-Whitneya-Wilcoxona
# dla dwóch prób zależnych
median(przed)
median(po)
wilcox.test(przed, po, alternative = "less")
# lub
median(po)
median(przed)
wilcox.test(po, przed, alternative = "greater")
# Odrzucamy H0. Zatem stosunek się poprawił po obejrzeniu filmu.