mydf <-
structure(list(X = c("Jack", "Laura", "Ella", "Chris", "Seth"
), Y = c(2, 10, 9, 5, 8), Z = structure(c(2L, 1L, 1L, 2L, 2L), levels = c("F", 
"M"), class = "factor")), class = "data.frame", row.names = c(NA, 
-5L))
mydf1 <-
structure(list(StudentName = c("Jack", "Laura", "Ella", "Chris", 
"Seth"), StudyHours = c(2, 10, 9, 5, 8), Gender = structure(c(2L, 
1L, 1L, 2L, 2L), levels = c("F", "M"), class = "factor")), class = "data.frame", row.names = c(NA, 
-5L))
mydf12 <-
structure(list(StudentName = c("Chris", "Ella", "Jack", "Laura", 
"Seth"), StudyHours = c(5, 9, 2, 10, 8), Gender = structure(c(2L, 
1L, 2L, 1L, 2L), levels = c("F", "M"), class = "factor"), ExamScore = c(88, 
72, 65, 94, 59), Time = c(51, 42, 45, 60, 40)), row.names = c(NA, 
-5L), class = "data.frame")
mydf2 <-
structure(list(StudentName = c("Jack", "Laura", "Ella", "Chris", 
"Seth"), ExamScore = c(65, 94, 72, 88, 59), Time = c(45, 60, 
42, 51, 40)), class = "data.frame", row.names = c(NA, -5L))
myfactor <-
structure(c(4L, 1L, 2L, 2L, 1L, 4L, 3L), levels = c("FR", "SO", 
"JR", "SR"), class = c("ordered", "factor"))
myhospital <-
structure(list(patients = c("Alex", "Fred", "Nancy", "Cloe", 
"Jack", "Emma", "Tom"), pain = structure(c(1L, 4L, 2L, 2L, 3L, 
4L, 2L), levels = c("none", "mild", "medium", "severe"), class = c("ordered", 
"factor")), gender = structure(c(1L, 2L, 1L, 1L, 2L, 1L, 2L), levels = c("F", 
"M"), class = "factor"), age = c(65L, 48L, NA, 29L, 77L, NA, 
35L), weight = c(148L, 205L, 218L, 195L, 226L, NA, 181L)), row.names = c(NA, 
-7L), class = "data.frame")
mylist <-
list(structure(c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 2L, 3L, 
4L), dim = 3:4), c(TRUE, FALSE, TRUE, TRUE), "Hello World!", 
    structure(c(1L, 2L, 2L, 2L, 1L, 2L), levels = c("F", "M"), class = "factor"), 
    structure(c(19781, 19730), class = "Date"))
X <-
c("Jack", "Laura", "Ella", "Chris", "Seth")
Y <-
c(2, 10, 9, 5, 8)
Z <-
structure(c(2L, 1L, 1L, 2L, 2L), levels = c("F", "M"), class = "factor")
