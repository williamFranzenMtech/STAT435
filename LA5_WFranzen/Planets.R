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
