# William Franzen
# Inputs and Outputs and Stuff

# Built-in Datasets ----

Orange
ChickWeight

ChickWeight[1:5,]

head(ChickWeight, 10)
head(ChickWeight)

dim(ChickWeight)

mean(ChickWeight[,1])


# Installing the tseries library ----

install.packages("tseries")
library("tseries")

data(ice.river)

head(ice.river)
tail(ice.river)
dim(ice.river)

# Read External Files ----
myhospital <- read.table(file = "myhospital.txt",
                         header = TRUE, sep = " ",
                         na.strings = "*")
myhospital

class(myhospital)
dim(myhospital)

# Grades.txt file exercise ----
my_grades <- read.table(file = "grades.txt", header = TRUE, skip = 7, na.strings = "*", sep = "\t")
my_grades
str(my_grades)

my_grades[my_grades$Participation >= 5, ]

# Choosing files ----
file.choose()

myhospital <- read.table(file = "C:\\Users\\wfranzen\\Documents\\R Stuff\\my_Inputs_Outputs\\myhospital.txt",
                         header = TRUE,
                         sep = " ",
                         na.strings = "*")


myhospital <- read.table(file = file.choose(),
                         header = TRUE,
                         sep = " ",
                         na.strings = "*")

myhospital
str(myhospital)

myhospital$pain <- factor(myhospital$pain, ordered = TRUE, levels = c("none", "mild", "medium", "severe"))
myhospital$gender <- factor(myhospital$gender, ordered = FALSE, levels = c("F", "M"))
myhospital

str(myhospital)

# Spreadsheet Workbooks ----

install.packages("openxlsx")
library("openxlsx")

cars <- read.xlsx(xlsxFile = "cars1.xlsx",
                      sheet = 1,
                      startRow = 1,
                      colNames = TRUE,
                      rowNames = FALSE,
                      skipEmptyRows = TRUE,
                      skipEmptyCols = TRUE)
cars

dim(cars)


cars2 <- read.xlsx(xlsxFile = "cars1.xlsx",
                   sheet = 1,
                   startRow = 1,
                   colNames = TRUE,
                   rowNames = FALSE,
                   skipEmptyRows = TRUE,
                   skipEmptyCols = TRUE,
                   rows = 1:11,
                   cols = 1:4)
cars2

mean(cars2$MPG)

# Reading CSV External Files ----
cars3 <- read.table("cars2.csv", header = TRUE, sep = ",")
cars3
cars4 <- read.csv("cars2.csv", header = TRUE, sep = ",")
cars4

x <- scan("quiz.txt", sep = "")
x

# Editing a loaded vector n' stuff ----
fix(x)
x

x.temp <- edit(name = x)
x.temp
x <- x.temp
x

edit (name = x, file = "new_quiz.txt")

x.df <- data.frame(score = scan(file = "quiz.txt", sep = ""))
class(x.df)
x.df

x.df.temp <- edit(name = x.df)
head(x.df.temp)
x.df <- x.df.temp
x.df

# Displaying files ----
file.show("myhospital.txt")
file.show("cars1.xlsx")

# Retrieving remote files from web ----
baseball.url <- "http://jse.amstat.org/datasets/baseball.dat.txt"

baseball <- read.table(file = baseball.url, header = FALSE, sep = "")

head(baseball)
