#NA are used for missing observations n' stuff
x <- c(0, 7, NA, 2, 3, 1)

mean(x)
mean(x, na.rm=TRUE)
sd(x)
sd(x, na.rm=TRUE)

2:9
seq(2, 9)
seq(from = 2 ,to = 9, by = 3)
seq(2, 9, length.out = 4)
seq(along.with = c(20, 40, 60))
seq(2, 9, along.with = 1:3)
seq(1, 10, a = c(2, 4, 6, 8))
seq(1, 10, a = c("a", "b", "c"))
seq(1, 10, a = c(TRUE, FALSE))

8:1
seq(from = 8, to = 1)
seq(from = 8, to = 1, by = -0.5)

rep(5, times = 4)
rep(5, 4)
rep(c(1, 2, 3), 4)
rep(c(1, 2, 3), each = 4)
rep(2:5, e=3)
rep(2:5, times = c(1, 2, 3, 2))

a <- 7
b <- 18
a + b
x <- c(3, 6, 4, 2, 1, 5)

x <-c (4, 9, 36, 25)
sqrt(x)

c(1,2,3)^2-3

a <- c(1, 4, 12)
b <- c(1, 2, 3)
a+2
a-1
a*3
a/2
a^2

a+b
a-b
a/b
a*b
a^b

x <- c(3, 6, 4, 2, 1, 5)
x[4]
x[1:3]
x[c(1, 4)]
x[-2]
x[-c(1, 6)]

aa <- c("A", "B", "C", "D")
aa[3]
aa[c(1, 4)]
bb <- c(TRUE, TRUE, FALSE)
bb[2]

x <- c(3, 6, 4, 2, 1, 5)
x < 5
x[x < 5]

score <- c(35, 67, 94, 82, 61, 55)
names(score) <- c("John", "Amy", "Sofia", "Dave", "Josh", "Alex")
score
score["Dave"]
score[c("Amy", "Josh", "Alex")]

remain <- c(spades = 11, hearts = 12, diamonds = 11, clubs = 13)
remain[1]
remain[3]
remain["spades"]
remain_black <- remain[c(1, 4)]
remain_black
remain[c("clubs", "spades")]
remain[-1]
remain[c(FALSE, TRUE, FALSE, TRUE)]
remain[c(TRUE, FALSE)]
remain[c(TRUE, FALSE, TRUE, FALSE)]
remain[c(TRUE, FALSE, TRUE)]
remain[c(TRUE, FALSE, TRUE, TRUE)]

x <- 4
x == 2^2
x != 2*2
x < 5
x > 10/2
x <= exp(2)
x >= log(5)

x <- c(3, 5, 6, 2)
y <- c(4, 2, 6, 7)
x == y
x != y
x < y
x > y
x <= y
x >= y

x <- c(3, 5, 6, 2)
x == sqrt(25)
x != 3
x >= pi

any(x <= pi)
all(x != 3*2)
sum(x)

x <- c(3, 6, 4, 2, 1, 5, 4)
sum(x > 3)
sum(x[x>3])

(1:7)*(x>3)

mean(x>3)
mean(x[x>3])
mean(x[x<=5])
mean(x!=4)

x <- seq(1:10)
y <- seq(2,6,2)
x
y

x + y