# Lab Assignment 5 - William Franzen
#

planets <- c("Earth", "Mercury", "Venus", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")

type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")

diameter <- c(1, 0.382, 0.949, 0.532, 11.209, 9.449, 4.007, 3.883)

rotation <- c(1, 58.64, -243.02, 1.03, 0.41, 0.43, -0.72, 0.67)

rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Q1 ----

# a: Construct a dataframe and print it.
planets_df <- data.frame(list(planets = planets, type = type, diameter = diameter, rotation = rotation, rings = rings))
planets_df

# b: Use str() to make sure there are 8 observations and5 variables
str(planets_df)
# 'data.frame':	8 obs. of  5 variables:

# Q2 ----

# a: Encode the type as a factor.
typefac <- as.factor(type)
typefac

# b: Overwrite the type in the planets_df with the new factor
planets_df[["type"]] <- typefac
planets_df

# c: Display the structure of planets_df to make sure it's right
str(planets_df)
# $ type    : Factor w/ 2 levels "Gas giant","Terrestrial planet": 2 2 2 2 1 1 1 1

# Q3 ----
# Rename the columns of planets_df using: "NAME", "TYPE", "DIAMETER", "ROTATION", "HAS_RINGS".

names(planets_df) <- c("NAME", "TYPE", "DIAMETER", "ROTATION", "HAS_RINGS")
planets_df

# Q4 ----

# a: Select the type of Jupiter
planets_df[[5, "TYPE"]]

# b: Store the entire rotation column as a vector and print it
rotationvec <- planets_df$ROTATION
rotationvec

# c: Create a data frame closest_planets_df for the first three planets
closest_planets_df <- planets_df[c(2, 3, 1), ]
closest_planets_df

# d: Create a dataframe furthest_planets_df for the last three planets
furthest_planets_df <- planets_df[c(6, 7, 8), ]
furthest_planets_df

# e: Select the diameter and rotation for Venus and save it to venus_data
venus_data <- planets_df[3, c("DIAMETER", "ROTATION")]
venus_data

# f: Select the last 5 rows of only DIAMETER and assign it to furthest_planets_diameter, then print it
furthest_planets_diameter <- planets_df[4:8, "DIAMETER"]
furthest_planets_diameter

# g: Use the $ to create rings_vector that contains all the HAS_RINGS values.
rings_vector <- planets_df$HAS_RINGS
rings_vector

# h: Assign to planets_with_rings_df the data where HAS_RINGS = TRUE
planets_with_rings_df <- subset(planets_df, (HAS_RINGS == TRUE))
planets_with_rings_df

# i: Create a dataframe small_planets_df with planets that have a smaller diameter than Earth.
small_planets_df <- subset(planets_df, (DIAMETER < 1.0))
small_planets_df

# j: Make a dataframe slow_planets_df with planets that have a longer rotation period than Earth.
slow_planets_df <- subset(planets_df, (abs(ROTATION) > 1.0))
slow_planets_df

# k: Write one line of code that identifies the planet with the smallest diameter.
subset(planets_df, DIAMETER == min(planets_df$DIAMETER), NAME)

# Q5 ----

# a: Add the number of moons to planets_df
planets_df$MOON <- c(1, 0, 0, 2, 67, 62, 27, 14)

# b: Add the mass of the planet to planets_df
planets_df$MASS <- c(1.00, 0.06, 0.82, 0.11, 317.8, 95.2, 14.6, 17.2)

# c: Print planets_df
planets_df

# d: Display the structure of planets_df
str(planets_df)

#'data.frame':	8 obs. of  7 variables:
#$ NAME     : chr  "Earth" "Mercury" "Venus" "Mars" ...
#$ TYPE     : Factor w/ 2 levels "Gas giant","Terrestrial planet": 2 2 2 2 1 1 1 1
#$ DIAMETER : num  1 0.382 0.949 0.532 11.209 ...
#$ ROTATION : num  1 58.64 -243.02 1.03 0.41 ...
#$ HAS_RINGS: logi  FALSE FALSE FALSE FALSE TRUE TRUE ...
#$ MOON     : num  1 0 0 2 67 62 27 14
#$ MASS     : num  1 0.06 0.82 0.11 317.8 ...

# e: Write one line of code that identifies the planets that have rings and mass greater than 50.
subset(planets_df, (MASS > 50 & HAS_RINGS), NAME)
# Jupiter and Saturn

# f: Use with() to calculate the average number of moons for the gas giant planets.
gas_giants <- subset(planets_df, TYPE == "Gas giant")
with(gas_giants, mean(MOON))

# Q6 ----

# Resetting the planets to exclude the mass and moons.
planets_df <- data.frame(list(planets = planets, type = type, diameter = diameter, rotation = rotation, rings = rings))
names(planets_df) <- c("NAME", "TYPE", "DIAMETER", "ROTATION", "HAS_RINGS")
# a: Create a dataframe for Pluto.

pluto_df <- data.frame(NAME = "Pluto", TYPE = "Terrestrial planet", DIAMETER = 0.18, ROTATION = -6.38, HAS_RINGS = FALSE)

planets_df_ext <- do.call(rbind, list(planets_df, pluto_df))

# b: Print the new dataframe

planets_df_ext

# Q7 ----

# a: Assign the variable positions the order
positions <- order(planets_df_ext$DIAMETER, decreasing = TRUE)
positions

# b: Create the dataframe largest_first_df using the order from the positions
largest_first_df <- planets_df_ext[positions,]

# c: Print largest_first_df
largest_first_df
