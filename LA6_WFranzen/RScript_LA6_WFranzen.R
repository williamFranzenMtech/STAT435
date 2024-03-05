# Lab Assignment 6
# By William Franzen

# Q1: HCC.txt ----

# b: Using read.table() to store the data to a dataframe.
HCC <- read.table(file = "HCC.txt", skip = 9, header = TRUE)

# c: Displaying the structure of the dataframe
str(HCC)

# d: Convert Reason and Month into factors using relevant labels.
HCC$Reason <- factor(HCC$Reason, levels = c(1, 2), labels = c("normal", "other"))
HCC$Month <- factor(HCC$Month, levels = 1:6, labels = c("January", "February", "March", "April", "May", "June"))

# e: Check the structure again.
str(HCC)

# f: Use head() to look at the first 5 entries. Use tail() to look at the last 7 entries for the first and third variables.
head(HCC, n = 5)
tail(HCC[,c(1,3)], n = 7)

# g: Write a command that will give the average length of the stays for April.
with(HCC,
     mean(subset(HCC, subset = (Month == "April"), select = Length)[[1]])
)

# h: Write a command that will give the longest stay for a normal discharge in January.
with(HCC,
     max(subset(HCC, subset = (Month == "January" & Reason == "normal"))[[3]])
)


# Q2: Install and load dslabs ----
install.packages("dslabs")
library(dslabs)

# a: Use ?murders and look at the documentation.
?murders

# b: Using sink(), create sumstats.txt.
sink("sumstats.txt")

# c: Add the statistics for murders for the South region.
cat("Summary Statistics on No. Gun Murders in the South", "\n")
summary(
  murders$total[murders$region == "South"]
  #subset(murders, subset = (region == "South"), select = total)
)

# d: Leave a blank line, then the statistics for murders for the West region.
cat("\n", "Summary Statistics on No. of Gun Murders in the West", "\n")
summary(
  murders$total[murders$region == "West"]
  #subset(murders, subset = (region == "West"), select = total)
)

# e: Use sink() to close the sink
sink()

# f: Use write.table() to write the murders to a new file murdersUS.txt.
write.table(murders, file = "murdersUS.txt", quote = FALSE, sep = "\t", row.names = FALSE)


# Q3: stu_surveys.pdf ----
# a: Create an empty dataframe, name it survey.
survey <- data.frame()

# b: Use edit() to enter the data from the pdf into the survey dataframe.
newsurvey <- edit(survey)

# c: Print the entered data.
newsurvey

# d: Write the dataframe to a survey.csv file.
write.csv(newsurvey, file = "survey.csv", quote = FALSE, row.names = FALSE)

# e: Read this csv into survey_in
survey_in <- read.csv(file = "survey.csv")

# f: Display the structure of this dataframe. 5 obs, 18 variables.
str(survey_in)

# g: Calculate statistics for age in years.
summary(survey_in$age / 12)

# h: Percentage of students who slept at least 7 hours
100 * sum(survey_in$sleephours >= 7) / length(survey_in$sleephours)


# Q4: Reading remote files ----
beef <- read.table(file = "http://jse.amstat.org/v22n1/kopcso/BeefDemand.txt", header = TRUE)

beef

# Print data from 1990 to 2000
beef.demand.sub <- with(beef, subset(beef, subset = (Year >= 1990)))
beef.demand.sub
