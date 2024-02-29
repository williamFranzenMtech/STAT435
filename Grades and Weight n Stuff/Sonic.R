#William Franzen

# Some stuff with plots and stuff----
#

x <- c(3, 5, 7, 8)
y <- c(7, 2, 5, 3)

plot(y, x)
plot(log(x), y)

# Code Completion Stuff----
#

ht <- c(66, 72, 60, 69, 65)
wt <- c(133, 175, 172, 194, 182)

plot(x = ht, y = wt, pch = "*", main = "Scatterplot of Height vs Weight", xlab = "Height (inches)", ylab = "Weight (pounds)")


# Importing Excel files n' stuff----
#
grades.data <- read.table(file="clipboard", header=TRUE, sep="\t")
grades.data

# Edit data sets ----
#
x <- edit(grades.data)
x

# Moving stuff from history n' stuff ----
#
temp <- pi + 1
