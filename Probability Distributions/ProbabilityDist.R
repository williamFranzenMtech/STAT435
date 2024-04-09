# Probability Distributions n' Stuff

# Binomial Distributions ----
# X ~ Bin(n=10, p=0.5)
# P(X = 4)
dbinom(x = 4, size = 10, prob = 0.5)

# P(3 < X <= 7)
b.result <- dbinom(x = 4:7, size = 10, prob = 0.5)
b.result
sum(b.result)

# Create a probability histogram of X
barplot(dbinom(0:10, size=10, prob=0.5),
        names.arg = 0:10,
        ylim = c(0, 0.25),
        axis.lty = 1,
        main = "Probability Histogram of\nX ~ Bin(n=10, p=0.5)",
        xlab = "X",
        ylab = "Probability"
        )

plot(0:10, dbinom(0:10, size=10, prob=0.5),
     type = "h",
     lwd = 5,
     main = "Probability Histogram of\nX ~ Bin(n=10, p=0.5)",
     xlab = "X",
     ylab = "Probability")

# P(X <= 4)
pbinom(q = 4, size = 10, prob = 0.5, lower.tail = TRUE)

# P(X > 4)
1 - pbinom(q = 4, size = 10, prob = 0.5, lower.tail = TRUE)
pbinom(q = 4, size = 10, prob = 0.5, lower.tail = FALSE)

# P(X < 8), which is the same as P(X <= 7)
pbinom(q = 7, size = 10, prob = 0.5, lower.tail = TRUE)

# P(2 < X < 7)
pbinom(q = 6, size = 10, prob = 0.8, lower.tail = TRUE) - pbinom(q = 2, size = 10, prob = 0.8, lower.tail = TRUE)

# Create a cumulative probability histogram of X n' stuff
barplot(pbinom(q = 0:10, size = 10, prob = 0.5, lower.tail = TRUE),
        names.arg = 0:10,
        main = "Cumulative Probability Plot of\nX ~ Bin(n=10, p=0.5)",
        xlab = "X",
        ylab = expression("P(X" <= "x)"),
        axis.lty = 1)

# Find x such that P(X <= x) = 0.05
qbinom(p = 0.05, size = 10, prob = 0.5, lower.tail = TRUE)

# Find the 80th percentile of X
qbinom(p = 0.8, size = 10, prob = 0.5, lower.tail = TRUE)

# Find IQR of X
qbinom(p = 0.75, size = 10, prob = 0.5, lower.tail = TRUE) - qbinom(p = 0.25, size = 10, prob = 0.5, lower.tail = TRUE)

# Generate random sample of size 100
set.seed(222)
rbinom(n = 100, size = 10, prob = 0.5)


# Doing some mean and stuff
n <- 10
p <- 0.5

mean.binom <- n*p
mean.binom

var.binom <- n*p*(1-p)
sd.binom <- sqrt(var.binom)
sd.binom

# Hypergeometric Stuff ----
# 20 balls, 8 white, 12 red. 5 Balls are drawn.
m <- 8
n <- 12
k <- 5

# Find probability of getting exactly 3 white balls
dhyper(x = 3, m = m, n = n, k = k)

# Find probability of getting at most 2 white balls
phyper(q = 2, m = m, n = n, k = k)

# Find probability of getting more than 3 white balls
phyper(q = 2, m = m, n = n, k = k, lower.tail = FALSE)

# Find mean and standard deviation of X
m.hyper <- k*m / (m+n) # mean
v.hyper <- k * (m / (m + n)) * (1 - m/(m+n)) * ((m+n-k)/(m+n-1)) # variance
s.hyper <- sqrt(v.hyper) # stdev

m.hyper
v.hyper
s.hyper

# Create a probability plot for X
barplot(dhyper(x = 0:5, m = m, n = n, k = k),
        main = "Probability Plot for\nX~H(N = m + n = 20, m = 8, k = 5)",
        names.arg = 0:5,
        xlab = "X",
        ylab = "Probability",
        axis.lty = 1,
        ylim = c(0, 0.4))

# Normal Distributions n' Stuff ----
# For Z ~ N(mean = 0, stdev = 1)

# Find f(z = -1)
dnorm(x = -1)

# Draw probability density curve Z from -3 to 3
curve(dnorm, from = -3, to = 3,
      main = "Standard Normal Density Function",
      xlab = "z", ylab = "f(z)",
      col = "blue", lwd = 2)

# Find P(-2 <= Z <= 1.4)
pnorm(q = 1.4) - pnorm(q = -2)

# Draw cumulative distribution function of Z
curve(pnorm, from = -3, to = 3,
      main = "Cumulative Probability Distribution\nfor Z ~ N(0, 1)",
      xlab = "Z", ylab = expression("P(Z" <= "Z)"),
      col = "blue", lwd =2)

# Find z such that P(Z < z) = 0.8
qnorm(0.8)

# Find z such that P(z<=Z<=0) = 0.325
qnorm(0.175)

# Find quartiles
qnorm(c(0.25, 0.5, 0.75))

# Generate random sample of 1000
set.seed(406)
randomz <- rnorm(1000)
randomz
summary(randomz)
plot(randomz)
hist(randomz)

# X ~ N (mean = 110, stdev = 13) ----
m <- 110
s <- 13
# Draw a Probability Density Curve from 65 to 155
plot(65:155, dnorm(65:155, mean = m, sd = s),
     type = "l",
     main = expression(paste("Normal Distribution with ", mu, " = 110, ", sigma, " = 13")),
     xlab = "X",
     ylab = "f(x)",
     lwd = 2,
     col = "blue")

abline(h = 0, col = "gray")

# Find P(X <= 100) and shade this region.
z <- seq(65, 100, length.out = 300)
fz <- dnorm(z, mean = m, sd = s)
polygon(c(65, z, 100), c(0, fz, 0), density=-1, col="magenta")

# Find P(120 <= X <= 135), and shade it.
z <- seq(120, 135, length.out = 300)
fz <- dnorm(z, mean = m, sd = s)
polygon(c(120, z, 135), c(0, fz, 0), density=-1, col="cyan")

text(x= 78, y = 0.017,
     labels = expression("P(X "<=" 100) = 0.2208782"))

text(x = 140, y = 0.017,
     labels = expression("P(120 "<=" X < 135) = 0.193643"))

arrows(c(80, 140), c(0.016, 0.016), c(90, 130), c(0.01, 0.01))

# Exponential Distributions ----
thisrange <- seq(0, 8, length.out = 125)
plot(thisrange, dexp(thisrange, rate = 1),
     type = "l",
     lty = 2,
     lwd = 3,
     col = "blue",
     xlim = c(0.3, 7.8),
     ylim = c(0, 1.7),
     xlab = "x",
     ylab = "f(x)")
lines(thisrange, dexp(thisrange, rate = 1.65),
      lty = 1,
      lwd = 3,
      col = "red")
lines(thisrange, dexp(thisrange, rate = 0.4),
      lty = 3,
      lwd = 3,
      col = "green")

legend(6.5, 1.6,
       legend = c(expression(paste(lambda, " = 1.65")), expression(paste(lambda, " = 1")), expression(paste(lambda, " = 0.4"))),
       lty = c(1, 2, 3),
       lwd = 3,
       col = c("red", "blue", "green"))

# Example Thingy
# Bridge Thingy; lambda = 1/6
# Plot the thingy over range (0, 40)
thisrange <- seq(0, 40, length.out = 150)
plot(thisrange, dexp(thisrange, 1/6),
     type = "l",
     main = expression(paste("Exponential Distribution with ", lambda, " = 1/6")),
     xlab = "x",
     ylab = "f(x)",
     lty = 1,
     lwd = 2,
     col = "blue")

# What is the probability of the stress range being:
# At least 2 MPa
pexp(2, 1/6, lower.tail = FALSE)
# At most 7 MPa
pexp(2, 7)
# Between 5 and 10 MPa. Shade this one.
pexp(10, 1/6) - pexp(5, 1/6)
shadex <- seq(5, 10, length.out = 100)
shadefx <- dexp(shadex, 1/6)
polygon(c(5, shadex, 10), c(0, shadefx, 0), density=-1, col="cyan2")
text(15, 0.1, "P(5 < X < 10) = 0.2457226")
arrows(10, 0.09, 8, 0.06)

# What value separates the highest 2% of the stress ranges from the remaining 98%?
qexp(0.98, 1/6)

# Find the median of the distribution
qexp(0.5, 1/6)

# Find the mean and standard deviation
mean(dexp(thisrange, 1/6))
sd(dexp(thisrange, 1/6))

