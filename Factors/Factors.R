# Factors n' Stuff

# Creating factors ----
patients <- c("Alex", "Fred", "Nancy", "Cloe", "Jack", "Emma", "Tom")
patients

sex.num <- c(0, 1, 0, 0, 1, 0, 1) # 0 for female, 1 for male
sex.num

sex.char <- c("female", "male", "female", "female", "male", "female", "male")
sex.char

pain <- c("none", "severe", "mild", "mild", "medium", "severe", "mild")
pain

sex.num.fac <- factor(sex.num)
sex.num.fac

sex.char.fac <- factor(sex.char)
sex.char.fac

pain.fac <- factor(pain)
pain.fac

# Viewing levels ----
levels(sex.num.fac)
levels(sex.char.fac)
levels(pain.fac)

# Assigning new labels for levels
levels(sex.num.fac) <- c("1", "2")
levels(sex.num.fac)

# Using labels argument to relabel
sex.num <- c(0, 1, 0, 0, 1, 0, 1)
sex.num.fac2 <- factor(sex.num, labels = c("female", "male"))
sex.num.fac2

# Using levels argument inside of factor()
pain <- c("none", "severe", "mild", "medium", "severe", "mild")
pain.fac2 <- factor(pain, levels = c("none", "mild", "medium", "severe"))
pain.fac2

pain.fac3 <- factor(pain,
                    levels = c("none", "mild", "medium", "severe"),
                    labels = c("AM_none", "AM_mild", "AM_medium", "AM_severe"))
pain.fac3

# Nominal and ordinal stuff
sex.char <- c("female", "male", "female", "female", "male", "female", "male")
sex.char.fac <- factor(sex.char)
sex.char.fac
sex.char.fac[1] < sex.char.fac[2] # Doesn't do anything because there is no order

pain <- c("none", "severe", "mild", "mild", "medium", "severe", "mild")
pain.fac3 <- factor(pain, ordered = TRUE, levels = c("none", "mild", "medium", "severe"))
pain.fac3

pain.fac3[1] > pain.fac3[2]
pain.fac3[5] < pain.fac3[6]

# Summary
summary(pain.fac)
summary(pain.fac)/length(pain.fac)
(summary(pain.fac)/length(pain.fac))*100

summary(sex.char.fac)
summary(sex.char.fac)/length(sex.char.fac)
(summary(sex.char.fac)/length(sex.char.fac))*100

# Subsetting
pain <- c("none", "severe", "mild", "mild", "medium", "severe", "mild")
pain.fac <- factor(pain)
pain.fac
pain.fac[3]
pain.fac[2:5]
pain.fac[c(2, 3, 4, 5)]
pain.fac[c(3, 4, 7)]
pain.fac[-1]
pain.fac[-c(1, 7)]

# Logical Operators n' stuff
pain.fac
pain.fac != "none"
sex.char.fac == "male"
pain.fac[pain.fac != "none"]
pain.fac[sex.char.fac == "female"]
pain.fac[sex.char.fac == "male"]

# Using character vectors to select elements from a factor
pain.fac[patients == "Emma"]
pain.fac[patients == "Alex" | patients == "Emma"]
pain.fac[patients == "Fred" | patients == "Nancy" | patients == "Tom"]

# Using a logical vector concerning a factor to select elements from a vector
patients[sex.char.fac == "male"]
patients[pain.fac == "mild"]

patients[sex.char.fac == "male" & pain.fac == "severe"]
patients[sex.char.fac == "female" & pain.fac == "mild"]
