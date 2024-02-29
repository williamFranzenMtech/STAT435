# William Franzen
# Matrices 2 (from the videos)

# Naming Matrices ----
matrix(1:6, nrow = 2)
matrix(1:6, ncol = 3)
matrix(1:6, nrow = 2, byrow = TRUE)
matrix(1:3, nrow = 2, ncol = 3)
matrix(1:4, nrow = 2, ncol = 3)

cbind(1:3, 1:3)
rbind(1:3, 1:3)
m <- matrix(1:6, byrow = TRUE, nrow = 2)
rbind(m, 7:9)
cbind(m, c(10, 11))

rownames(m) <- c("row1", "row2")
colnames(m) <- c("col1", "col2", "col3")
m

# Subsetting Matrices ----
m <- matrix(sample(1:15, 12), nrow = 3)
m
m[1,3]
m[3,2]
m[3,]
m[,3]
m[4]
m[9]
m[2, c(2, 3)]
m[c(1, 2), c(2, 3)]
# Subsetting by name ====
rownames(m) <- c("r1", "r2", "r3")
colnames(m) <- c("a", "b", "c", "d")
m
m[2, 3]
m["r2", "c"]
# Subsetting by logical vector ====
m[c(FALSE, FALSE, TRUE), c(FALSE, FALSE, TRUE, TRUE)]
m[c(FALSE, FALSE, TRUE), c(FALSE, TRUE)]

m[c(FALSE, FALSE, TRUE), c(FALSE, TRUE, FALSE, TRUE)]

# Matrix Arithmetic
the_fellowship <- c(316, 556)
two_towers <- c(343, 584)
return_king <- c(378, 742)
lotr_matrix <- rbind(the_fellowship, two_towers, return_king)
colnames(lotr_matrix) <- c("US", "non-US")
rownames(lotr_matrix) <- c("Fellowship", "Two Towers", "Return King")
lotr_matrix

lotr_matrix / 1.12
lotr_matrix - 50

theater_cut <- matrix(rep(c(50, 80, 100), 2), nrow = 3)
theater_cut

lotr_matrix - theater_cut
lotr_matrix - c(50, 80, 100)

matrix(c(50, 80, 100), nrow = 3, ncol = 2)

rates <- matrix(c(1.11, 0.99, 0.82), nrow = 3, ncol = 2)
rates

lotr_matrix * rates
