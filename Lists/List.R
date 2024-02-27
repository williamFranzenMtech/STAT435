# List Stuff Examples

x <- c(5, "Dog", "Cat", TRUE)
x
y <- matrix(1:10, "a", "b", nrow = 4, byrow = TRUE)
y

# Creating Lists ----
mylist <- list(matrix(data = 1:4, nrow = 2, ncol = 2),
               c(TRUE, FALSE, TRUE, TRUE),
               "Hello",
               factor(c("F", "M", "M", "M", "F", "M")),
               as.Date(c("2024-02-13", "2024-01-08"))
               )
mylist

str(mylist)

# Building a list from an empty list ----
elist <- list()
elist[[1]] <- seq(0, 30, 5)
elist[[2]] <- "Having fun with R!"
elist[[3]] <- sample(1:50, 6)
elist[[4]] <- mylist[[1]]

elist

# Retrieving stuff ----
mylist
mylist[[1]]
mylist[[2]]
mylist[[3]]

mylist[[1]] + 5.5
mylist[[1]][1,2]
mylist[[1]][2,]
cat(mylist[[3]], "everyone!")

mylist[[5]][1] - mylist[[5]][2]

mylist[[c(2,3)]] #This and the line below do the same thing.
mylist[[2]][[3]]

# List Slicing n' Stuff ----
new_mylist <- mylist[c(2,3)]
new_mylist

newer_list <- mylist[1:3]
newer_list

# Overwriting Stuff ----
mylist
mylist[[3]] <- paste(mylist[[3]], "everyone!")
mylist

mylist[[2]] <- paste(c(FALSE, FALSE, TRUE, TRUE))
mylist                     

# Exercise a ----
mylist[[1]] <- paste(matrix(data = rep(1:5, 2), nrow = 3, ncol = 3))
mylist

# Exercise b ----
mylist[[4]] <- factor(c("no", "mild", "mild", "severe"), ordered = TRUE, levels = c("no", "mild", "severe"))
mylist[[4]]

# Exercise c ----
set.seed(123)
this_sample <- sample(1:100, 10)
this_sample
mylist[[5]] <- paste(this_sample)
mylist

# Exercise d ----
mylist[[6]] <- date()

# Exercise e ----
mylist

# Exercise f ----
mylist <- mylist[-5]
mylist
mylist <- mylist[1:4]
mylist

# Naming Lists ----
names(mylist) <- c("mymatrix", "mylogicals", "mystring", "headache")
mylist
mylist$mymatrix

mylist$mymatrix[,2]

# Naming components of list as it's being created ----
hospital <- list(patients = c("Alex", "Fred", "Nancy", "Cloe", "Jack", "Emma", "Tom"),
                 pain = factor(c("none", "severe", "mild", "mild", "medium", "severe", "mild")),
                 gender = c("F", "M", "F", "M", "F", "M")
                 )
hospital
names(hospital)

# Nesting ----
age_and_weight <- list(age = c(65, 48, 43, 29, 77, 52, 35),
                       weight = c(148, 205, 218, 195, 226, 164, 181))
hospital
hospital$new_info <- age_and_weight
hospital

length(hospital)
names(hospital)
names(hospital$new_info)

new_hospital <- list(patients = c("Alex", "Fred", "Nancy", "Cloe", "Jack", "Emma", "Tom"),
                 pain = factor(c("none", "severe", "mild", "mild", "medium", "severe", "mild")),
                 gender = c("F", "M", "F", "M", "F", "M"),
                 new_info = list(age = c(65, 48, 43, 29, 77, 52, 35),
                                 weight = c(148, 205, 218, 195, 226, 164, 181))
)
new_hospital
length(new_hospital)
names(new_hospital)

# Removing stuff again ----
hospital$gender <- NULL
hospital

mylist <- mylist[c(-2, -3)]
mylist
