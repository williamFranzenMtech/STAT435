# William Franzen
# Lab Excel Exercise

# Creating and plotting a histogram----
x <- rnorm(250, 5, 1)
hist(x, col="lightblue", main="Histogram of N(Mean = 5, SD = 1)")

# Making a second histogram----
p <- hist(x)

# Importing ideal weights and editing them
ideal_weights <- read.table(file="clipboard", header=TRUE, sep="\t")
ideal_weights <- edit(ideal_weights)
