# Lab Assignment 3 - William Franzen
# Problem 1

# Constructing the matrix with a single vector
box.office <- c(460.998, 314.400, 290.475, 247.900, 309.306, 165.800)
star_wars_matrix <- matrix(box.office, ncol = 2, byrow = TRUE)
star_wars_matrix

# Constructing the matrix with multiple vectors
New_hope <- c(460.998, 314.400)
Empire_strikes <- c(290.475, 247.900)
Return_jedi <- c(309.306, 165.800)
star_wars_matrix <- rbind(New_hope, Empire_strikes, Return_jedi)
star_wars_matrix

# Naming
colnames(star_wars_matrix) <- c("US", "non-US")
rownames(star_wars_matrix) <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

# Sum of both revenues
worldwide_vector <- rowSums(star_wars_matrix)
worldwide_vector

star_wars_ext <- cbind(star_wars_matrix, worldwide_vector)
colnames(star_wars_ext) <- c("US", "non-US", "Worldwide")
star_wars_ext

# Prequel Trilogy
star_wars_matrix2 <- matrix(c(474.5, 552.5, 310.7, 338.7, 380.3, 468.5), ncol = 2, byrow = TRUE, dimnames = list(c("The Phantom Menace", "Attack of the Clones", "Revenge of the Sith"), c("US", "non-US")))
star_wars_matrix2

all_wars_matrix <- rbind(star_wars_matrix, star_wars_matrix2)
all_wars_matrix
