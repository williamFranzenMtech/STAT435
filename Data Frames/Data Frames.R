# Data Frames n' Stuff ----

x <- c("Jack", "Lauraa", "Ella", "Chris", "Seth") #Names of students
y <- c(2, 10, 9, 5, 8)                            #No. of Hours
z <- factor(c("M", "F", "F", "M", "M"))           #Gender

mydata <- data.frame(x, y, z)
mydata

mydata <- data.frame(x = c("Jack", "Lauraa", "Ella", "Chris", "Seth"),
                     y = c(2, 10, 9, 5, 8),
                     z = factor(c("M", "F", "F", "M", "M")))
mydata

is.data.frame(mydata)
class(mydata)
str(mydata)

is.vector(y)
as.data.frame(y)

# Sizes n' stuff ----
nrow(mydata)
ncol(mydata)
dim(mydata)

# Naming data frames ----
names(mydata) <- c("StudentName", "StudyHours", "Gender")
mydata

mydata <- data.frame(StudentName = x, StudyHours = y, Gender = z)
mydata

mydata <- data.frame(StudentName = c("Jack", "Lauraa", "Ella", "Chris", "Seth"),
                     StudyHours = c(2, 10, 9, 5, 8),
                     Gender = factor(c("M", "F", "F", "M", "M")))
mydata

# Subsetting n' stuff ----
mydata[[2]]
mydata[2]
mydata[c(1, 2)]

mydata[,2]
mydata[1,2]
mydata[4,3]

mydata[["StudyHours"]][2]
mydata$StudyHours[2]

mydata["StudyHours"]
mydata[c("StudentName", "StudyHours")]

# Select the second element of StudyHours
mydata[["StudyHours"]][2]

# StudyHours from Chris
mydata[4,2]
mydata$StudyHours[mydata$StudentName == "Chris"]

# Subset of only male students
mydata[mydata["Gender"] == "M",]

# Omit the gender column of the subsetted data frame above
mydata[mydata["Gender"] == "M", c(-3)]

# More Subsetting n' stuff (With the subset() function) ----
subset(x = mydata, select = StudyHours)
subset(x = mydata, select = c(StudentName, Gender))

subset(x = mydata, subset = (StudyHours <= 5))
subset(x = mydata, subset = (StudyHours > 5 & Gender == "F"))

# Exercise: Subset mydata keeping only StudentName and Gender with students who studied for more than 5 hours
subset(x = mydata,
       subset = (StudyHours > 5),
       select = c(StudentName, Gender))

# Converting Lists n' stuff ----
hospital <- list(patients = c("Alex", "Fred", "Nancy", "Cloe", "Jack", "Emma", "Tom"),
                 pain = factor(c("none", "severe", "mild", "mild", "medium", "severe", "mild"), ordered = TRUE, levels = c("none", "mild", "medium", "severe")),
                 gender = c("F", "M", "F", "F", "M", "F", "M"))

hospital

hospital_dfrm <- data.frame(hospital)
hospital_dfrm

hospital_dfrm <- as.data.frame(hospital)
hospital_dfrm

str(hospital_dfrm)

# Constructing data frames from row data n' stuff ----
s1 <- data.frame(name = "Alice", age = 25, smoke = "Y")
s2 <- data.frame(name = "Fred", age = 32, smoke = "N")
s3 <- data.frame(name = "Max", age = 40, smoke = "N")
s4 <- data.frame(name = "Jesse", age = 35, smoke = "N")

s1234 <- list(s1, s2, s3, s4)
s1234

s1234_dfrm <- do.call(rbind, s1234)
s1234_dfrm

class(s1234_dfrm)
str(s1234_dfrm)

# Creating two-row data frame ----
fred.jesse_df <- do.call(what = rbind, args = s1234[c(2,4)])
fred.jesse_df

mean_age <- do.call(what = mean, args = list(s1234_dfrm$age))
mean_age

iqr_age <- do.call(what = IQR, args = list(s1234_dfrm$age))
iqr_age

# Same thing, but from list origins ----
s1l <- list(name = "Alice", age = 25, smoke = "Y")
s2l <- list(name = "Fred", age = 32, smoke = "N")
s3l <- list(name = "Max", age = 40, smoke = "N")
s4l <- list(name = "Jesse", age = 35, smoke = "N")

s1234l <- list (s1l, s2l, s3l, s4l)
s1234l

s1234l_dfrm <- do.call(rbind, Map(as.data.frame, s1234l))
s1234l_dfrm

# Adding columns to an existing dataframe ----
hospital <- list(patients = c("Alex", "Fred", "Nancy", "Cloe", "Jack", "Emma", "Tom"),
                 pain = factor(c("none", "severe", "mild", "mild", "medium", "severe", "mild"), ordered = TRUE, levels = c("none", "mild", "medium", "severe")),
                 gender = c("F", "M", "F", "F", "M", "F", "M"))
hospital_dfrm <- data.frame(hospital)
hospital_dfrm

age <- c(65, 48, 43, 29, 77, 52, 35)

hospital_dfrm[["age"]] <- age
hospital_dfrm

weight <- c(148, 205, 218, 195, 226, 164, 181)
hospital_dfrm <- cbind(hospital_dfrm, weight)

ageweight <- data.frame(list(age = age, weight = weight))
ageweight

hospital_dfrm <- cbind(hospital_dfrm, ageweight)
hospital_dfrm

# Adding rows to an existing dataframe ----
hospital <- list(patients = c("Alex", "Fred", "Nancy", "Cloe", "Jack", "Emma", "Tom"),
                 pain = factor(c("none", "severe", "mild", "mild", "medium", "severe", "mild"), ordered = TRUE, levels = c("none", "mild", "medium", "severe")),
                 gender = c("F", "M", "F", "F", "M", "F", "M"))
hospital_dfrm <- data.frame(hospital)
hospital_dfrm
age <- c(65, 48, 43, 29, 77, 52, 35)
hospital_dfrm[["age"]] <- age
hospital_dfrm
weight <- c(148, 205, 218, 195, 226, 164, 181)
hospital_dfrm <- cbind(hospital_dfrm, weight)

newrow <- data.frame(patients = c("Matthew", "Carol"),
                      pain = c("mild", "medium"),
                      gender = c("M", "F"),
                      age = c(81, 60),
                      weight = c(205, 137))

hospital_dfrm <- rbind(hospital_dfrm, matthew, newrow)

hospital_dfrm

# Sorting a dataframe ----
hospital_dfrm[order(hospital_dfrm$age), ] # Ascending
hospital_dfrm[order(hospital_dfrm$age, decreasing = TRUE), ] # Descending

# Editing a dataframe ----
temp <- edit(hospital_dfrm)
temp

hospital_dfrm <- temp
hospital_dfrm

# Omitting NA values from a dataframe ----
temp1 <- edit(hospital_dfrm)
temp1

hospital_clean <- na.omit(temp1)
hospital_clean


# Merging data ----
mydata1 <- data.frame(studentName = c("Jack", "Laura", "Ella", "Chris", "Seth"),
                      studyhHours = c(2, 10, 9, 5, 8),
                      Gender = factor(c("M", "F", "F", "M", "M")))
mydata2 <- data.frame(studentName = c("Jack", "Laura", "Ella", "Chris", "Seth"),
                      examScore = c(5, 10, 15, 20, 25),
                      Time = c(30, 40, 15, 25, 32))

mydata3 <- merge(mydata1, mydata2, by = "studentName")
mydata3

# Accessing individual columns ----
plot(mydata3$studyhHours, mydata3$examScore)

# Accessing by using with() ----
with(data = mydata3, expr = plot(studyhHours, examScore))
with(mydata3, mean(studyhHours))

summary(mydata3$examScore[mydata3$Gender == "M"])

with(mydata3, summary(examScore[Gender == "M"]))
with(mydata3, summary(examScore[Gender == "F"]))
