#William Franzen
#Cell Phone Related Car Accidents

car_accidents <- c(8, 12, 15, 9, 11, 25, 16)
names(car_accidents) <- c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat")
car_accidents

#Mean and Median of workdays (Mon-Fri)
mean(car_accidents[2:6])

#Days with at least 15 accidents
car_accidents[car_accidents >= 15]

#Output the weekends
car_accidents[c("Sat", "Sun")]

#Proportion of weekdays with number of accidents above 10
mean(car_accidents[2:6] > 10)

#Total Number of accidents
sum(car_accidents)