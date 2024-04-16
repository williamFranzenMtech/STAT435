# Quiz April 16
# William Franzen

# 1e
p <- 56
stdev <- 7.5
n <- 36

popul * n

# 1f
meanf <- 205
stdevf <- 11
n <- 40

stdevf / sqrt(n)

# 2a
m <- 20.65
s <- 8.4
n <- 50

s / sqrt(n)

# 2c
pnorm(25, m, s/sqrt(n), lower.tail = TRUE)

#2d
pnorm(20, m, s/sqrt(n), lower.tail = FALSE)

#2e
pnorm(20, m, s/sqrt(n)) - pnorm(15, m, s/sqrt(n))

# 3a
n <- 100
p <- 0.5

pnorm(0.6, p, sqrt(p*(1-p)/n), lower.tail = FALSE)
qnorm(0.32, p, sqrt(p*(1-p)/n), lower.tail = FALSE)


# 4
m <- 124
s <- 11

#a
n <- 1
pnorm(140, m, s/sqrt(n), lower.tail = FALSE)

#c
n <- 4
pnorm(140, m, s/sqrt(n), lower.tail = FALSE)

#d
qnorm(0.05, m, s/sqrt(n), lower.tail = FALSE)
