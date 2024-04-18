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


# Example 3 ----