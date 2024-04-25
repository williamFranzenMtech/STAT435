# Exam 3
# William Franzen

# 1: Great White Sharks ----
library(openxlsx)
shark <- read.xlsx("./sharks.xlsx", rowNames = FALSE, header = TRUE)

qqnorm(shark[[1]],
       main = "Shark Length of 35 Randomly Selected Great White Sharks",
       ylab = "Length (Feet)")
qqline(shark[[1]],
       col = "blue")


# 2: Calculating Probabilities ----
# a: A standard normally distributed variable is larger than 1.04
pnorm(1.04, mean = 0, sd = 1, lower.tail = FALSE)

# b: Getting 5 out of 5 successes in a binomial distribution with probability 0.8
dbinom(5, size = 5, prob = 0.8)

# c: For a chi^2 distribution with 4 degrees of freedom, P(X >= 2.7)
pchisq(2.7, df = 4, lower.tail = FALSE)

# d: For X ~ Hypergeom(N=20, m=15, k=6), P(X < 5)
phyper(5, m = 15, n = 5, k = 6)

# e: For x ~ Bin(n=10, p=0.6), P(4 <= X < 9)
diff(pbinom(c(4, 9), size = 10, prob = 0.6))


# 3: Fill the blanks with the correct numerical answer ----

# a: For X ~ Poisson(lam = 1.5), the 75h percentile of X is
qpois(0.75, lambda = 1.5)

# b: For X ~ Exp(lam = 0.05), if P(X >= x) = 0.8, x = 
qexp(0.8, rate = 0.05)

# c: For X ~ N(mu = 20, sig = 3), if P(a <= X <= b) = 0.5 (central area), then a = ?, b = ?
qnorm(0.25, mean = 20, sd = 3)
qnorm(0.75, mean = 20, sd = 3)
diff(pnorm(c(17.97653, 22.02347), mean = 20, sd = 3))

# 4: Forest with a uniform distribution between 3 and 70 feet.

# a: What is the probability of a tree taller than 10 feet?
punif(10, min = 3, max = 70, lower.tail = FALSE)

# b: Probability of a tree shorter than 50 feet
punif(50, min = 3, max = 70)

# c: What is the cutoff point of the tallest 20% of trees?
qunif(0.2, min = 3, max = 70, lower.tail = FALSE)

# d: What is the value of the IQR for the tree height distribution?
diff(qunif(c(0.25, 0.75), min = 3, max = 70))


# 5: Tutoring Time Length ----

# a: Probability of taking longer than 10 minutes
pnorm(10, mean = 8, sd = 1.2, lower.tail = FALSE)

# b: Probability of taking between 5 and 7 minutes
diff(pnorm(c(5, 7), mean = 8, sd = 1.2))

# c: Find the time that marks the slowest 5% of students
qnorm(0.05, mean = 8, sd = 1.2, lower.tail = FALSE)

# d: Plot the normal distribution of interest between +-3.5 sigma and shade the probability of part c, the slowest 5% of students.
x <- seq(4.5, 11.5, length.out = 1024)
fx <- dnorm(x=x, mean = 8, sd = 1.2)

plot(x, fx,
     type = "l",
     main = expression(paste("Normal Distribution X~N(", mu ," = 8, ", sigma ," = 1.2)")),
     xlab = "Time (minutes)",
     ylab = "Probability",
     lwd = 3,
     col = "purple4")

slowest <- qnorm(0.05, mean = 8, sd = 1.2, lower.tail = FALSE)
slowest

shadex = seq(slowest, 11.5, length.out = 1024)
shadefx = dnorm(x = shadex, mean = 8, sd = 1.2)

polygon(c(slowest, shadex, 11.5), c(0, shadefx, 0), density=-2, col="violet")


# 6: Income Tax ----

# a: Find mean and standard deviation of the sampled forms
mn <- 2000
sdev <- 560 / sqrt(50)
sdev

# c: What is the probability that the mean tax paid on the sample of 50 forms is at most 2100?
pnorm(2100, mean = mn, sd = sdev)

# d: What is the probability that the mean tax paid on the sample of 50 forms is higher than 1850?
pnorm(1850, mean = mn, sd = sdev, lower.tail = FALSE)


# 7: Marital Status and Depression

married <- c(22, 33, 14)
single <- c(16, 29, 9)
widowed <- c(20, 14, 3)

status <- as.table(cbind(married, single, widowed))

rownames(status) <- c("Severe", "Normal", "Mild")
colnames(status) <- c("Married", "Single", "Widowed/Divorced")

addmargins(status)

statusperc <- round(prop.table(status, margin=2) * 100, digits = 2)

statusperc

# b: Recreate the plot.
x <- barplot(statusperc, beside = TRUE,
             main = "Comparison of Depressive State by Marital Status",
             ylab = "Percent",
             ylim = c(0, 80),
             col = c("blue", "yellow", "pink1"),
             legend.text = c("Severe", "Normal", "Mild"),
             args.legend = list(x = "topleft")
             )
abline(h=0)
text(x, statusperc, labels = statusperc, col = "red", pos = 3)

# c: Do the relevant analysis
xsq <- chisq.test(status)
xsq
