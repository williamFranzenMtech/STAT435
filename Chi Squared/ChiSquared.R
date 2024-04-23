# Chi-Squared Stuff
# Test of Independence or whatever

# Example 1 ----
shift1 <- c(15, 21, 45, 13)
shift2 <- c(26, 31, 34, 5)
shift3 <- c(33, 17, 49, 20)

defects <- as.table(rbind(shift1, shift2, shift3))

defects

dimnames(defects) <- list(Shift = c("I", "II", "III"),
                          Defect = c("A", "B", "C", "D"))

defects

# This basically adds the Sum statistics to the edges n' stuff.
addmargins(defects)

shift1p <- round(prop.table(shift1) * 100, 2)
shift2p <- round(prop.table(shift2) * 100, 2)
shift3p <- round(prop.table(shift3) * 100, 2)

defectsp <- as.table(cbind(shift1p, shift2p, shift3p))

dimnames(defectsp) <- list(Defect = c("A", "B", "C", "D"),
                          Shift = c("I", "II", "III"))
defectsp

barplot(defectsp, beside = TRUE,
        ylim = c(0, 50),
        main = "Comparison of Defect Types by Production Shift",
        ylab = "Percent",
        xlab = "Shift",
        col = c("cyan3", "magenta3", "yellow3", "gray24"),
        legend.text = c("A", "B", "C", "D"),
        args.legend = list(x = "topleft")
        )
abline(h = 0)

alpha <- 0.05

xsq <- chisq.test(defects)
xsq

xsq$observed
xsq$expected

O <- xsq$observed
E <- xsq$expected

round(((O-E)^2), digits = 4)

sink("furniture.doc")
xsq
sink()


pval <- pchisq(q = 19.178, df = 6, lower.tail = FALSE)
pval
plot(seq(from = 0, to = 25, length.out = 200), dchisq(x = seq(from = 0, to = 25, length.out = 200), df = 6),
     type="l",
     main = expression(paste("Density Function of X ~ ", chi[df == 6]^2)),
     xlab = "x", ylab = "f(x)"
     )

polygon(c(19.178, seq(19.178, 25), 25), c(0, dchisq(seq(19.178, 25), 6), 0), col = "red")

arrows(23, 0.06, 20, 0.005, col="darkgreen",
       lwd = 2, length = 0.2, angle = 20)
text(18, 0.065,
     labels=("p-value = P(" ~chi[df == 6]^2 >= "19.178 | is true) = 0.00387"),
     font = 2, col = "darkgreen")


# Example 2 ----
library(openxlsx)
student <- read.xlsx("Student.xlsx")
gender <- student$Gender
seatbelt <- student$Belts

genderbelt <- table(seatbelt, gender)
genderbelt
xsq <- chisq.test(genderbelt)

xsq
# p = 0.1004; don't accept the alt. hypothesis.
# Gender and Seatbelt usage are independent from each other.

barplot(genderbelt, beside = TRUE,
        main = "Comparison of Seatbelt Usage by Gender",
        xlab = "Gender",
        ylab = "Percent",
        col = c("cyan3", "magenta3", "yellow3", "gray24"),
        legend.text = c("Always", "Never", "Sometimes", "Usually"),
        args.legend = list(x = "topright"))

# Example 3 ----
grade2 <- c(14.71, 32.35, 26.47, 26.47)
grade4 <- c(23.53, 44.12, 26.47, 5.88)
grade6 <- c(9.38, 75.00, 12.50, 3.12)

reasonstable <- as.table(cbind(grade2, grade4, grade6))
reasonstable

dimnames(reasonstable) <- list(Type = c("External", "Internal", "Introject", "Irrelev"),
                               Grade = c("Grade2", "Grade4", "Grade6"))

reasonstable
xsq <- chisq.test(reasonstable)
xsq
# p < 0.05, accept the alt. hypothesis; they are dependent of age.

barplot(reasonstable, beside = TRUE,
        main = "Comparison of Types of Reasons for Doing Homework\nwithin each School Grade Category",
        xlab = "School Grade (age)",
        ylab = "Percent",
        col = c("cyan3", "magenta3", "yellow3", "gray24"),
        legend.text = c("External", "Internal", "Introjected", "Irrelevant"),
        args.legend = list(x = "topleft"))
