# Chi-Squared Goodness-of-Fit Tests n' Stuff

rats <- c(23, 36, 31)
rats

perc <- prop.table(rats) * 100
perc <- round(perc, digits = 2)
names(perc) <- c("Door 1", "Door 2", "Door 3")
perc

barplot(perc, beside = TRUE,
        main = "Barplot of Rats' Door Preferences",
        ylab = "Percent")
abline(h = 0)

text(perc, labels = perc, col = "red", pos = 3)


xsq <- chisq.test(rats)
xsq

xsq$expected
xsq$p.value

# Fail to reject Null Hypothesis at 10% significance level
# There is not enough data to provide statistically significant evidence suggesting that rats have a preference of the choice of door.

doors <- read.table(file = "rats.txt", header = TRUE)
head(doors, 5)

table(doors)

perc <- prop.table(table(doors)) * 100
perc <- round(perc, digits = 3)
names(perc) <- c("Door 1", "Door 2", "Door 3")
perc

x <- barplot(perc, main = "Barplot of Rats' DOor Preferences",
        ylab = "Percent",
        ylim = c(0, 45))
abline(h=0)
text(x, perc, labels = perc, col = "blue", pos = 1)

xsq <- chisq.test(table(doors))
xsq

# M&M Observations n' stuff:
obs.counts <- c(2, 8, 9, 13, 13, 10)

samp.per <- round(prop.table(obs.counts) * 100, digits = 3)
samp.per

clr <- c("Yellow", "Red", "Orange", "Brown", "Green", "Blue")

mm <- data.frame(color = clr, Percent = samp.per)
mm

x <- barplot(samp.per,
             main = "Milk Chocolate M&M Color Distribution",
             ylab = "Percent",
             ylim = c(0, 35),
             names.arg = clr)
abline(h = 0)
text(x, samp.per, labels = samp.per, col = "blue", pos = 1, cex = 0.7)

hyp.probs <- c(0.14, 0.13, 0.20, 0.13, 0.16, 0.24)

xsq <- chisq.test(x = obs.counts, p = hyp.probs)
xsq

xsq$observed
xsq$expected

# p = 0.03151 < 0.05
# Reject the null hypothesis.
# Accept the alt. hypothesis that the M&M counts are NOT what are listed on the website.