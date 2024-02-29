# Homework 4 Stuff

# Printing fewer or more digits ----
# Use the digits parameter in the print() function
print(pi, digits = 4)
print(pi, digits = 5)

# Use cat() and format()
cat(format(pi, digits = 5), "\n")

# This will also format vectors
print(pnorm(-3:3), digits = 2)


# Redirecting output to files ----
# Use cat with the file parameter
cat("Sonic the Hedgehog!!", file = "sonic.txt")
# sink() can start sinking output to a file.
# source() can retrieve the stuff from a file.


# Listing files ----
# use the list.files() function
list.files()
# Paths can be specified. Using the all.files argument shows hidden files.
list.files(path = "HW 4", all.files = TRUE)


# Reading Fixed Width Stuff ----
# Use tidyverse
install.packages("tidyverse")
library(tidyverse)

# XLSX Files
install.packages("openxlsx")

# SQL Tables
library(RMySQL)

# Exporting objects n' stuff
# Use the save() function.
sonic <- 5
save(sonic, file = "Sonic.R")
