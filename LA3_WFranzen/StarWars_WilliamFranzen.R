# Lab Assignment 3 - William Franzen

# Q1 ----
# Constructing the matrix with a single vector
box.office <- c(460.998, 314.400, 290.475, 247.900, 309.306, 165.800)
star_wars_matrix <- matrix(box.office, ncol = 2, byrow = TRUE)
star_wars_matrix

# Q2 ----
# Constructing the matrix with multiple vectors
New_hope <- c(460.998, 314.400)
Empire_strikes <- c(290.475, 247.900)
Return_jedi <- c(309.306, 165.800)
star_wars_matrix <- rbind(New_hope, Empire_strikes, Return_jedi)
star_wars_matrix

# Q3 ----
# Naming the vectors
colnames(star_wars_matrix) <- c("US", "non-US")
rownames(star_wars_matrix) <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

# Q4 ----
# Sum of both revenues in a worldwide vector
worldwide_vector <- rowSums(star_wars_matrix)
worldwide_vector

# Q5 ----
# Adding the worldwide column to the vector
star_wars_ext <- cbind(star_wars_matrix, worldwide_vector)
colnames(star_wars_ext) <- c("US", "non-US", "Worldwide")
star_wars_ext

# Q6 ----
# Prequel Trilogy Vector
star_wars_matrix2 <- matrix(c(474.5, 552.5, 310.7, 338.7, 380.3, 468.5), ncol = 2, byrow = TRUE, dimnames = list(c("The Phantom Menace", "Attack of the Clones", "Revenge of the Sith"), c("US", "non-US")))
star_wars_matrix2

# Q7 ----
# Combining both vectors
all_wars_matrix <- rbind(star_wars_matrix, star_wars_matrix2)
all_wars_matrix

# Q8 ----
# Total revenue for US and non-US
total_revenue_vector <- colSums(all_wars_matrix)
total_revenue_vector

# Q9 ----
star_wars_matrix[3,1] # US Return of the Jedi
star_wars_matrix[2,2] # non-US Empire Strikes Back
star_wars_matrix[,2] # All non-US Revenue
star_wars_matrix[1,] # A New Hope all revenue

# Q10 ----
# All non-US movies
non_us_all <- mean(star_wars_matrix[,2])
non_us_all

# The first two non-US movies
non_us_some <- mean(star_wars_matrix[c(1,2), 2])
non_us_some

# Q11 ----
# Select all revenue for both figures on A New Hope and Return of the Jedi
star_wars_matrix[c(1,3),]

# Q12 ----
# US Revenue for A New Hope and The Empire Strikes Back using names
star_wars_matrix[c("A New Hope", "The Empire Strikes Back"), "US"]
# Last two rows from both columns using logical vectors
star_wars_matrix[c(FALSE, TRUE, TRUE), c(TRUE, TRUE)]
# Selecting non-US for The Empire Strikes Back using any technique
star_wars_matrix["The Empire Strikes Back", c(FALSE, TRUE)]

# Q13 ----
# View count matrices
view_count_1 <- matrix(c(2, 1, 5, 0, 2, 1, 2, 0, 2, 0, 3, 0, 4, 2, 2, 0, 5, 3, 2, 0, 4, 1, 3, 1), ncol = 4, byrow = TRUE, 
                       dimnames = list(c("A New Hope", "The Empire Strikes Back", "Return of the Jedi", "The Phantom Menace", "Attack of the Clones", "Revenge of the Sith"), c("Mark", "Brian", "Sheldon", "Rachel")))


view_count_2 <- matrix(c(1, 3, 2, 3, 2, 4, 3, 2, 1, 3, 2, 1, 1, 2, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0), ncol = 4, byrow = TRUE, 
                       dimnames = list(c("A New Hope", "The Empire Strikes Back", "Return of the Jedi", "The Phantom Menace", "Attack of the Clones", "Revenge of the Sith"), c("Chris", "Monica", "Walker", "Zack")))

# Printing them
view_count_1
view_count_2

# Combining the matrices and printing the outcome
view_count_all <- cbind(view_count_1, view_count_2)
view_count_all

# Subsetting by the "loudest" debaters
view_count_loud <- view_count_all[, c("Mark", "Sheldon", "Monica")]
view_count_loud

# Calculating Totals
total_views_loud <- colSums(view_count_loud)
total_views_loud
