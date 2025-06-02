library(UsingR)
boxplot(homework)

print(shapiro.test(homework$Private))

qqnorm(homework$Private)
qqline(homework$Private)

var(homework$Private)
print(var.test(homework$Private, homework$Public, alternative = "less"))

print(t.test(homework$Private, homework$Public,
    var.equal = TRUE, alternative = "greater"
))
