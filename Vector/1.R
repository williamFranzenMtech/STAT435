numeric_vector <- c(1, 2, 3)
print(numeric_vector)

character_vector <- c("a", "b", "c")
print(character_vector)

boolean_vector <- c(TRUE, TRUE, FALSE)
print(boolean_vector)

XYZ <- c("X", "Y", "Z")
names(numeric_vector) <- XYZ
print(numeric_vector)

print(length(numeric_vector))
length(c(TRUE,FALSE))

mode(c(5.4, "hi!"))
class(c(5.4, "hi1"))