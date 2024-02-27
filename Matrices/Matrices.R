# William Franzen
# Matrices

# New matrix by column ----
x <- matrix(1:12, nrow = 3)
x

# New matrix by row ----
x <- matrix(1:12, ncol = 4, byrow = TRUE)
x

# rownames and colnames ----
x <- matrix(1:12, nrow = 3)
rownames(x) <- c("A", "B", "C")
colnames(x) <- c("I", "II", "III", "IV")
x

# Labelgin with dimnames ----
x <- matrix(1:12, nrow = 3, dimnames = list(c("A", "B", "C"), c("I", "II", "III", "IV")))
x

# Transposition function ----
t(x)

# cbind and rbind ----
cbind(1:3, 4:6)
cbind(c(2, 4, 6, 8), c(0, 1, 2, 3))
rbind(1:3, 4:6)
rbind(c(10, 11, 12, 13), c(0, 1, 0, 1))

# cbind and rbind to existing matrices ----
x <- matrix(1:8, nrow = 2, byrow = TRUE)
cbind(x, c(9, 10))
rbind(x, 9:12)

# Recycling ----
x <- matrix(1:5, nrow = 4, ncol = 3)
x

# Subsetting matrices ----
y <- matrix(sample(1:10, 12, replace = TRUE), nrow = 3)
y
y[2, 4] #Element at 2, 4
y[,3] #Whole 3rd column
y[2,] #Whole 2nd row
y[5] #5th element, column by colujmn from top to bottom and left to right
y[, c(1,3)] #All rows and only 1st and 3rd columns
y[3, c(2, 4)] #3rd row and only 2nd and 4th columns

# Arithmetic ----
y <- matrix(1:12, nrow = 3)
y
apply(y, 1, mean) #The second argument (MARGIN) selects either rows (1) or columns (2) or both c(1, 2)
apply(y, 2, mean)
apply(y, 2, median)

# Built-in arithmetic functions ----
colMeans(y)
colSums(y)
rowMeans(y)
rowSums(y)

# More arithmetic stuff ----
z <- matrix(seq(0, 55, 5), nrow = 3)
z
z + 2
z - 4
z / 5
z * 3
z ^ 2

# Arithmetic with multiple matrices
z1 <- matrix(seq(0, 25, 5), ncol = 2)
z2 <- matrix(rep(1:3, 2), ncol = 2)
z1
z2
z1 - z2
z1 + 3*z2
z1 / z2
z1 * z2
z1 %*% t(z2)
z1 %*% t(z1)

# Atomic Types ----
y <- matrix(1:12, nrow = 3)
z <- matrix(c("X1", "X2", "X3"), ncol = 1)

zy <- cbind(z, y)
zy
