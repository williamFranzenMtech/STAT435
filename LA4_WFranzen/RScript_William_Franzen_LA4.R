# Lab Assignment 4 - By William Franzen

# 1a ----
shining_list <- list(title = "The Shining",
                     actors = c("Jack Nicholson", "Shelley Duvall", "Scatman Crothers", "Danny Lloyd", "Barry Nelson"),
                     reviews = factor(c("Good", "Perfect", "Bad", "Good", "OK", "Perfect", "Good"),
                            levels = c("Bad", "OK", "Good", "Perfect"), ordered = TRUE)
                    )
shining_list

# Select the actors from shining_list, assign the result to act and print it.
act <- shining_list[[2]]
act

# Create a new list containing only the title and reviews to sublist.
sublist <- shining_list[c(1,3)]
sublist

# Display the structure of sublist.
str(sublist)

# Select from the shining_list the first actor, assign it to first_actor and print it.
first_actor <- shining_list[[2]][1]
first_actor

# Select from the shining_list the fourth review, assign it to fourth_review and print it.
fourth_review <- shining_list[[3]][4]
fourth_review

# Write the command that returns "Scatman Crothers"
shining_list[[2]][3]

# Write the command that returns only the "Bad" reviews
shining_list[[3]][shining_list[[3]] == "Bad"]

# 1b ----
# Add the release year under the name "year" and director under "director"
shining_list$year <- 1980
shining_list$director <- "Stanley Kubrick"

# Print the shining_list
shining_list

# Display the structure of shining_list
str(shining_list)

# 1c ----
# Extend the list with a list of opinions "Hate it!" and "Love it!"
shining_list_ext <- c(shining_list, opinions = list(c("Hate it!", "Love it!")))
shining_list_ext

# 2a ----
# Making the list with its names.
my.list <- list(
  mydays = c("Mon", "Tue", "Wed", "Thu", "Fri"),
  myvector = c(5, -2, 4, 4, 7, -6, -9, 3, 8, 7),
  mymatrix = matrix(1:8, nrow = 4, ncol = 2, byrow = TRUE)
)
my.list

# 2b ----
# Extend mydays by adding "Sat" and "Sun" to it
my.list$mydays <- c(my.list$mydays, "Sat", "Sun")
my.list$mydays

# 2c ----
# Use the built-in letters function to add a-h as a fourth component.
my.list$myletters <- letters[1:8]

# Printing my.list
my.list

# 2d ----
# Use one line of code to select all elements in myvector that are greater than or equal to five and calculate their median
median(my.list$myvector[my.list$myvector >= 5])

# 2e ----
# Use one line to find the proportion of observations with negative values
length(my.list$myvector[my.list$myvector < 0]) / length(my.list$myvector)

# 2f ----
# Use one line of code to overwrite mymatrix
my.list$mymatrix <- rbind(t(my.list$mymatrix), 10:13)
my.list

# 2g ----
# Overwrite the second row in the matrix from largest to smallest
my.list$mymatrix[2,] <- sort(my.list$mymatrix[2,], decreasing = TRUE)
my.list

# 2h ----
# Remove the first and third components of my.list and print it
my.list <- my.list[c(-1, -3)]
my.list
