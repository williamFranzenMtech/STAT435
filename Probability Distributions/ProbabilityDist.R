# Probability Distributions n' Stuff

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
