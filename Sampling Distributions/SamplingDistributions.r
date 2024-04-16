## Sampling Distributions


# Example: Let X ~ N(100,5)

set.seed(1234)

pop <- rnorm(n = 10000, mean = 100, sd = 5)

par(mfrow = c(2,2))


hist(pop, freq=FALSE, xlim = c(85,115), xlab = "X",
     main = "Population Distribution \nX ~ N(100, 5)")

x <- seq(85,115, length.out = 300)
fx <- dnorm(x,mean=100,sd=5)

lines(x,fx,lty=1, lwd=2,col="blue")

for(i in c(3,20,50)){ # iterate through the values of n we want
  itr <- 500 #number of samples
  
  n <- i # number of observations per sample
  
  xbar <- rep(NA,itr)
  
  for(i in 1:itr){
    smp <- sample(pop,n) # take sample
    xbar[i] <- mean(smp) # calculate mean and store it in ith index in the vector
  }
  
  hist(xbar,xlim=c(85,115),freq=FALSE,
       xlab="Sample Mean",
       main = paste("Sampling Distribution of x-bar \nwith n =", n, ""))
  abline(v=100,lty = "dotted",lwd=2,col="red")
}

dev.off()


# Sampling from a Non-normal Discrete Population

baseball.url <- "https://jse.amstat.org/datasets/baseball.dat.txt"
baseball <- read.table(file = baseball.url, header=FALSE, sep="")
dim(baseball)

home.runs <- baseball[,8]

pop <- home.runs
mean(pop)
par(mfrow = c(2,2))

hist(pop,freq=FALSE,xlim=c(0,50),
     main = "Population Distribution of Home Runs")
for(i in c(5,30,100)){
  itr <- 700
  n <- i
  
  xbar <- rep(NA<itr)
  
  for(i in itr){
    smp <- sample(pop,n) # take sample
    xbar[i] <- mean(smp) # calculate mean of each sample and store it
  }
  hist(xbar,xlim=c(0,50),freq=FALSE,
       xlab="Sample Mean",
       main = paste("Sampling Distribution of x-bar \nwith n= ", n,""))
  abline(v = mean(pop), lty = "dotted", lwd = 2, col = "red")
}
dev.off()

# Example

ex.mean <- 8
ex.sd <- .95

prob = 1 - pnorm(9,mean = ex.mean, sd = ex.sd,lower.tail=TRUE)
prob

#b)
pnorm(9, mean = ex.mean, sd = ex.sd/(sqrt(4)),lower.tail=FALSE)

# Example 2
#a)
xs <- c(0,1,2,3,4,5)
probs <- c(.52,.22,.13,.09,.03,.01)

mu <- sum(xs*probs)
mu

sigma <- sqrt(sum((xs**2)*probs)-(mu**2))
sigma

#b)
n = 64
m.xbar <- mu
s.xbar <- sigma/(sqrt(n))
m.xbar
s.xbar

#c)
x.dist <- data.frame(xs, probs)
x.dist
sum(x.dist$probs[x.dist$xs > 1])

#d)
pnorm(1,mean=m.xbar, sd=s.xbar,lower.tail=FALSE)

# Example: Testing a fair coin with 200 times ----
n <- 200
p <- 0.5

# Using a binomial distribution
diff(pbinom(c(80, 120), n, p))

# Using a normal distribution
diff(pnorm(c(80, 120), n*p, sqrt(n*p*(1-p))))

# Doing proportions n' stuff
pnorm(0.6, p, sqrt(p*(1-p)/n)) - pnorm(0.4, p, sqrt(p*1*(1-p)/n))
