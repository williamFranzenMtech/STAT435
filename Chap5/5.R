# Chapter 5 Videos

# Data Frames ----
name <- c("Anne", "Pete", "Frank", "Julia", "Catch")
age <- c(28, 30, 21, 39, 35)
child <- c(FALSE, TRUE, TRUE, FALSE, TRUE)

df <- data.frame(name, age, child)
df

# Naming Data Frames ----
names(df) <- c("Name", "Age", "Child")

# Structure ----
str(df)
df <- data.frame(name, age, child, stringsAsFactors = FALSE)
str(df)

# Subsetting ----
df[3, 2]
df[3, "age"]

df[3,]
df[,"age"]

df[c(3,5), c("age", "child")]

df[2] # Returns a dataframe/list
df[[2]] # Returns a vector

df$age # Returns a vector
df[["age"]] # Returns a vector

df["age"]

# Adding columns ----
height <- c(163, 177, 163, 162, 157)
df$height <- height
df[["height"]] <- height

weight <- c(74, 63, 68, 55, 56)
cbind(df, weight)

df

tom <- data.frame(name = "Tom", age = 37, child = FALSE, height = 183)
rbind(df, tom)

df

# Sorting ----
sort(df$age) # This doesn't work; use order instead

ranks <- order(df$age)
ranks
df$age

df[order(df$age, decreasing = TRUE),]
