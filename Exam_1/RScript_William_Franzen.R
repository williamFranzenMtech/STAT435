# William Franzen
# STAT 435 Exam 1

# Q2 ----
# Creating Vectors; seq; rep
# a: "2" "Dog" "15" "Horse" "TRUE"
q2a <- c("2", "Dog", "15", "Horse", "TRUE")
q2a

# b: 5.0 5.5 6.0 6.5 7.0 7.5 8.0 8.5 9.0 9.5 10.0
q2b <- seq(5.0, 10.0, 0.5)
q2b

# c: -12 -11 -10 -9 -8 -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12
q2c <- seq(-12, 12)
q2c

# d: 1 1 2 2 3 3 4 4 5 5 6 6 7 7 1 1 2 2 3 3 4 4 5 5 6 6 7 7
q2d <- rep(1:7, 2, e=2)
q2d

# e: 1 1 1 1 4 4 4 4 4 5 5 5 5 5 5 3 3
q2e <- rep(c(1,4,5,3), e=c(4, 5, 6, 2))
q2e

# f: "F" "F" "F" "F" "F" "M" "M" "M" "M" "M"
q2f <- rep(c("F", "M"), e=5)
q2f

# g: TRUE FALSE TRUE TRUE FALSE TRUE TRUE FALSE TRUE
q2g <- rep(c(TRUE, FALSE, TRUE), 3)
q2g

# Q3 ----
# Students Scores
# a: R Code that will result in the given output.
q3a <- c(57, 85, 90, 72, 69)
names(q3a) <- c("John", "Mary", "Steve", "Bill", "Anna")
q3a

# b: Calculate the mean and standard deviation of these scores.
q3sd <- sd(q3a)
q3mean <- mean(q3a)

q3sd
q3mean

# c: Print using sentence form
cat("The average score on the exam is", q3mean, "with a standard deviation of", q3sd, ".\n")

# d: Print Mary and Bill's scores.
q3a[c(2, 4)]

# Q4 ----
# For x <- c(16, 7, 9, 14, 4, 3, 10, 11, 9, 8), do the following:
x <- c(16, 7, 9, 14, 4, 3, 10, 11, 9, 8)
# a: Select the fourth element
x[4]

# b: Select the first five elements
x[1:5]

# c: Select the second and fifth elements
x[c(2, 5)]

# d: Select all elements except the fifth
x[-5]

# e: Select all except first and fourth
x[-c(1, 4)]

# f: Select all elements less than 5
x[x < 5]

# g: Select all elements greater than or equal to 10
x[x >= 10]

# h: Transform x into a character vector
x_char <- as.character(x)

# i: Check if x_char is actually a character vector
is.character(x_char)

# j: Print x_char
x_char

# Q5 ----
# Matrices
y <- matrix(c(0, 8, 4, 2, 10, 6, 4, 0, 8, 6, 2, 10), nrow = 3)
y

# a: List the elements from the first two rows
y[1:2,]

# b: List the elements from the third column
y[, 3]

# c: List the element in the second row and fourth column
y[2, 4]

# d: List 6 and 8 from the last row
y[3, 2:3]

# e: Use Jan, Feb, Mar for row names, and A, B, C, D for column names.
rownames(y) <- c("Jan", "Feb", "Mar")
colnames(y) <- c("A", "B", "C", "D")
y

# f: Bind Apr <- c(1, 3, 4, 2) as a fourth row and print it.
Apr <- c(1, 3, 4, 2)
y2 <- rbind(y, Apr)
y2

# g: Bind E <- c(1, 2, 3, 4) to y2 as a column.
E <- c(1, 2, 3, 4)
y3 <- cbind(y2, E)
y3

# Q6 ----
# Cars Spreadsheet
# a: Import the dataset from the clipboard
cars <- read.table(file="clipboard", header=TRUE, sep="\t")
# I couldn't read the clipboard in my Linux installation of RStudio for some reason, so I just exported the data as a .csv and read it as a workaround.
#cars <- read.csv(file="cars.csv", header=TRUE)
cars

# b: Find proportion of cars that have six cylinders:
cyl <- cars[,"Cylinders"]
length(cyl[cyl == 6]) / length(cyl)

# c: Use apply() to calculate the median MPG
apply(cars[, 3:6], 2, median)["MPG"]

# d: Find the frequencies of each country
table(cars[,"Country"])

# Q7 ----
# Factors
survey_vec <- c("R", "R", "L", "R", "L", "R", "R")

# a: Convert survey_vec to a factor using "Right" and "Left" instead of "L" and "R"
survey_fac <- factor(survey_vec, levels = c("L", "R"), labels = c("Left", "Right"))

# b: Print survey_fac
survey_fac

# c: Look at the internal structure using str().
str(survey_fac)

# d: Find the percentages of "Right" and "Left"
100 * table(survey_fac) / length(survey_fac)
