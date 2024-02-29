#William Franzen
#Problem 3

#Numeric Vector of length 5
my_numeric <- c(1.1, 1.2, 1.3, 1.4, 1.5)
my_numeric

#Character Vector of length 4
my_character <- c("according to", "all known", "laws of", "aviation")
my_character

#Logical Vector of length 3
my_logical <- c(T, T, F)
my_logical

#Integer Vector of length 4
my_integer <- c(-12222L, 0L, 237L, 90000L)
my_integer

#Copy the my_integer vector to vec1_char
vec1_char <- my_integer
#Change the type of vec1_char to character by using the mode() function
mode(vec1_char) <- "character"

#Checks the class of vec1_char, then print it
class(vec1_char)
vec1_char

#Copy the my_logical vector to vec2_num
vec2_num <- my_logical
#Change the type of vec2_num to numeric by using mode()
mode(vec2_num) <- "numeric"

#Checks the class of vec2_num, then print it
class(vec2_num)
vec2_num

#Copy the my_numeric vector to vec3_char
vec3_char <- my_numeric
#Change the type of vec3_char to character by using mode()
mode(vec3_char) <- "character"

#Checks the class of vec3_char, then print it
class(vec3_char)
vec3_char

#Copy the my_character vector to vec4_num
vec4_num <- my_character
#Change the type of vec4_num to numeric by using mode()
mode(vec4_num) <- "numeric"

#Checks the class of vec4_num, then prints it
class(vec4_num)
vec4_num

#Prints the starting vectors
my_numeric
my_character
vec3_char