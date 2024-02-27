#William Franzen
#Feeling Lucky?

#Assigning values and names to the poker vector.
poker_vector <- c(Monday = 140, Tuesday = -50, Wednesday = 20, Thursday = -120, Friday = 240)

#Printing different details for the poker vector.
length(poker_vector)
mean(poker_vector)
median(poker_vector)
var(poker_vector)
sd(poker_vector)

#Assigning values and names to the roulette vecotr.
roulette_vector <- c(Monday = -24, Tuesday = -50, Wednesday = 100, Thursday = -350, Friday = 10)

#Printing different details for the roulette vector.
length(roulette_vector)
mean(roulette_vector)
median(roulette_vector)
var(roulette_vector)
sd(roulette_vector)

#Using a vector to store the days.
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

poker_vector
roulette_vector