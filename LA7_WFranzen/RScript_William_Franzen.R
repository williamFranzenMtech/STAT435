# STAT 435 Lab 7
# William Franzen

# 1. X ~ Bin(n = 20, p = 0.73) ----
n <- 20
p <- 0.73

# a. P(X = 16)
dbinom(15, n, p)

# b. Plot the Probability Distribution Plot of x.
plot(0:22, dbinom(0:22, n, p),
     type = "h",
     lwd = 8,
     main = "X ~ B(n = 20, p = 0.73)",
     xlab = "x",
     ylab = "Probability")

# c. Find P(10 < X < 15)
pbinom(14, n, p) - pbinom(10, n, p)

# d. Find P(14 <= X < 18)
pbinom(17, n, p) - pbinom(14, n, p)

# e. Find P(X > 12)
pbinom(12, n, p, lower.tail = FALSE)

# f. Find x such that P(X > x) = 0.4
qbinom(0.4, n, p)

# g. Find mean and standard deviation of X.
# Mean:
n * p
# STDev:
(n * p * (1-p))**0.5



# 2. X ~ N(mean = 20, stdev = 3) ----
m <- 20
s <- 3

# a. Find f(x = 18)
dnorm(18, m, s)

# b. Draw a probability density curve of X over range 10 to 30.
plot(10:30, dnorm(10:30, m, s),
     type = "l",
     lwd = 2,
     main = expression(paste("Density Curve of X ~ N(", mu, " = 20, ", sigma, " = 3)")),
     xlab = "x",
     ylab = "Probability")

# c. Find P(X > 23)
pnorm(23, m, s, lower.tail = FALSE)

# d. Find P(12 <= X < 21)
pnorm(21, m, s) - pnorm(12, m, s)

# e. Find 70th percentile of X
qnorm(0.7, m, s)

# f. Find a and b such that P(a <= X <= b) = 0.8 (central area)
left <- qnorm(0.1, m, s)
offset <- 20 - left
right <- 20 + offset
left
right
pnorm(right, m, s) - pnorm(left, m, s)

# g. Find the quintiles of X and report them here.
qnorm(seq(0.2, 0.8, by = 0.2), m, s)

# h. Find the IQR of X
qnorm(0.75, m, s) - qnorm(0.25, m, s)

# i. Set the seed to 435 and generate a random sample of size 1000.
set.seed(435)
rnd <- rnorm(1000, m, s)

hist(rnd, breaks = 18,
     main = "Histogram of 1000 random samples of\nX~N(20, 3)",
     xlab = "X",
     ylab = "Freq")
mean(rnd)
sd(rnd)

# 3. X ~ U(2.1, 10.5) ----
a <- 2.1
b <- 10.5

# a. What is the probability of waiting over 3.1 weeks?
punif(3.1, a, b, lower.tail = FALSE)

# b. What is the probability of receiving it in under a month?
month <- 31 / 7
punif(month, a, b)

# c. What is the probability of waiting between 4 and 6 weeks?
punif(6, a, b) - punif(4, a, b)

# d. What value of X separates the longest 5% of the times from the remaining?
qunif(0.95, a, b)

# e. Find mean and standard deviation of X
# Mean:
(a + b) / 2
# STDev:
sqrt((b-a)**2 / 12)

# 4. Exponential Distribution with lambda = 0.25
lam <- 0.25

# a. Find P(X > 7)
pexp(7, lam)

# b. Find P(5 <= X < 20)
pexp(20, lam) - pexp(5, lam)

# c. Find 90th percentile of X
qexp(0.9, lam)

# d. Find P(X <= 5) and recreate this graph.
j <- pexp(5, lam)
thisrange <- seq(0, 30, length.out = 800)
plot(thisrange, dexp(thisrange, lam),
     type = "l",
     col = "blue",
     lwd = 2,
     ylim = c(0, 0.25),
     xlim = c(0, 30),
     main = expression(paste("Exponential Distribution with ", lambda, " = 0.25")),
     xlab = "X",
     ylab = "f(x)")
shade <- seq(0, 5, length.out = 200)
fshade <- dexp(shade, lam)
polygon(c(0, shade, 5), c(0, fshade, 0), density=-1, col="gray")

text(x = 12, y = 0.1,
     labels ="P(X <= 5) = 0.7134952",
     col = "red")
arrows(11, 0.09, 5, 0.07,
       col = "red",
       lwd = 2)

# 5 ----
# Recreate the graph
range5 <- seq(0, 60, length.out = 800)
plot(1, 1,
     type="n",
     xlim = c(0, 60),
     ylim = c(0, 0.2),
     xlab = "X",
     ylab = "f(x)")
lines(dnorm(range5, 20, 6))
lines(dnorm(range5, 30, 10))
lines(dnorm(range5, 40, 2))
