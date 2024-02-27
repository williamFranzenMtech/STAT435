# Video 7 n' stuff 

blood <- c("B", "AB", "O", "A", "O", "O", "A", "B")
blood
blood_factor <- factor(blood)
blood_factor

str(blood_factor)

blood_factor2 <- factor(blood, levels = c("O", "A", "B", "AB"))
blood_factor2

levels(blood_factor) <- c("BT_A", "BT_AB", "BT_B", "BT_O")
blood_factor

factor(blood,
       levels = c("O", "A", "B", "AB"),
       labels = c("BT_O", "BT_A", "BT_B", "BT_AB"))

blood_factor[1] < blood_factor[2]

tshirt <- c("M", "L", "S", "S", "L", "M", "L", "M")
tshirt_factor <- factor(tshirt, ordered = TRUE, levels = c("S", "M", "L"))
tshirt_factor

tshirt_factor[1] < tshirt_factor[2]
