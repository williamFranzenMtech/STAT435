# William Franzen
# Exam 2 ----

# Q1 ----
# a: Read the excel file into a dataframe named Survey
library(openxlsx)
Survey <- read.xlsx("StuSurvey.xlsx", colNames = TRUE, na.strings = "*")

# b: Display first 8 rows and first 10 variables
Survey[1:8, 1:10]

# c: List CreditHr and Work values for 15th and 50th rows of Survey.
Survey[c(15, 50), c("CreditHr", "Work")]

# d: Subset the Male data to a new dataframe MSurvey
MSurvey <- with(Survey,
                subset(Survey, Gender == "Male"))

# e: Subset the dataset for all students who are younger than the median age.
medianage <- median(Survey$Age)
newSurvey <- with(Survey,
                  subset(Survey, Age < medianage))


# Q2 ----
install.packages("car")
library(car)

# a: Plot education on X, income on Y.
Duncan1 <- with(Duncan,
                subset(Duncan, prestige <= 80))

Duncan2 <- with(Duncan,
                subset(Duncan, prestige > 80))

plot(Duncan1$education, Duncan1$income,
     xlim = c(0, 100),
     ylim = c(0, 100),
     main = "Plot of Education (percentage of high-school graduates in each occupation)\nversus Income (percentage of Individuals earning $3,500 or more)\nfor the 45 U.S. Occupations in 1950",
     xlab = "Education",
     ylab = "Income",
     pch = 1,
     col = "black"
     )

points(Duncan2$education, Duncan2$income,
       pch = 16,
       col = "blue")

legend("topleft",
       legend = c("prestige <= 80", "prestige > 80"),
       col = c("black", "blue"),
       pch = c(1, 16))

# b: Bar plot
typePercent <- table(Duncan$type) / sum(table(Duncan$type)) * 100
names(typePercent) <- c("blue-collar", "professional\n& managerial", "white-collar")
barplot(typePercent,
        ylim = c(0, 50),
        main = "Barplot of Occupation Type\nfor the 45 U.S. Occupations in 1950",
        xlab = "Type of Occupation",
        ylab = "Percent",
        font.lab = 2,
        col.main = "red",
        axis.lty = 1,
        )


# Q3 ----
# a: Use a single line of code to display summary of statistics of magnitude with depth less than 400 km
with(quakes, summary(quakes[depth < 400,"mag"]))

# b: Select records that have magnitude >= 5, and write them to a table-formatted q5.txt file.
mag5 <- with(quakes,
             subset(quakes, mag >= 5))
write.table(mag5, file = "q5.txt", sep = ";", row.names = FALSE, col.names = TRUE)

# c: Read this file back in as q5.dframe
q5.dframe <- read.table(file = "q5.txt", sep = ";", header = TRUE)

# d: Use q5.dframe to get the number of stations for the highest magnitude earthquake.
with(q5.dframe,
     subset(q5.dframe, mag == max(mag), stations))

# e: Produce a plot of depth vs magnitude
plot(q5.dframe$depth, q5.dframe$mag,
     xlim = c(0, 650),
     ylim = c(5, 6.4),
     main = "Depth versus Magnitude (at least 5), of Earthquakes\noccurred in a cube near Fiji since 1964",
     xlab = "Depth (km)",
     ylab = "Magnitude",
     )
abline(h=mean(q5.dframe$mag), lty = "dashed", lwd = 2, col = "red")

# Q4 ----
# a: Use with() and tapply() to find the mean weights of the chicks for each feed type
with(chickwts, tapply(weight, feed, mean))

# b: Produce the given table
feedCount <- table(chickwts$feed)
feedPerc <- feedCount / sum(feedCount) * 100

feedtable <- cbind(feedCount, feedPerc)
colnames(feedtable) <- c("Count", "Percent")
feedtable

# Q5 ----
# a: Store all the created objects into an all.R file.
dump(list = ls(), file = "all.R")

# b: List all the objects in the workspace.
ls()

# c: Remove all the objects in the workspace, and make sure they are gone.
rm(list = ls())
ls()

# d: Retrieve the stuff from all.R, then check to see if they are there.
source(file = "all.R")
ls()

# e: Using the Survey dataframe, recreate this histogram.
par(mfcol = c(1,2))

FSurvey <- with(Survey,
                subset(Survey, Gender == "Female"))

hist(FSurvey$Ht,
     freq = FALSE,
     main = "Histogram of Heights\n(Female Students)",
     xlab = "Height (in inches)",
     ylab = "Density",
     xlim = c(60, 80),
     col = "#add8e6")
hist(MSurvey$Ht,
     freq = FALSE,
     main = "Histogram of Heights\n(Female Students)",
     xlab = "Height (in inches)",
     ylab = "Density",
     xlim = c(60, 80),
     col = "#ffff00")
