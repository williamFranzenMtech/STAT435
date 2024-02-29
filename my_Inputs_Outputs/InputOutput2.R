# William Franzen
# More Input/Output and stuff

rm(list = ls())

myhospital <- read.table(file = "hospital.txt", header = TRUE, sep = " ", na.strings = "*")
myhospital$pain <- factor(myhospital$pain, ordered = TRUE, levels = c("none", "mild", "medium", "severe"))
myhospital
str(myhospital)

# Retrieving stuff from an existing .R file ----
source("./sample_objects.R")
ls()

# Storing stuff to a new .R file. ----
dump(list = ls(), file = "all.R")

# Using sink() to redirect R output
myhospital
mean(myhospital$age, na.rm = TRUE)
with(myhospital, summary(weight))


sink(file = "some_results.txt")
subset(myhospital, subset = (pain == "mild" & gender == "F"))
cat("\n\n", "Descriptive statistics on Age variable:", "\n\n", summary(myhospital$age, na.rm=TRUE), "\n")
cat("\n\n", "Descriptive statistics on Weight variable:", "\n\n", with(myhospital, summary(weight)))

sink() # Stops sinking the output.
