# Graphics n' Stuff ----
x <- c(3, 1, 4, 8, 25, 18)
y <- c(1, 15, 8, 6, 9, 4)

plot(x, y)

xy_mat <- cbind(x, y)
xy_mat

is.matrix(xy_mat)

plot(xy_mat)

xy_mat <- cbind(x, y, y+3, x/2)
xy_mat
plot(xy_mat[, 2], xy_mat[, 4])

xy_list <- list(x = x, y = y)
xy_list

plot(xy_list$x, xy_list$y)

par()
par("cex")

par("pch", "lty")

colors()


# Doing more stuff with arguments ----

x
y

plot(x, y,
     main = "Scatterplot of X vs Y",
     xlab = "X label",
     ylab = "Y label",
     col = "red")

plot(x, y,
     main = "Scatterplot of X vs Y",
     xlab = "X label",
     ylab = "Y label",
     pch = 16,
     col = "blue",
     font = 2, #Bold
     font.lab = 3, #Italics for labels
     type = "o", #Overplot
     lty = "dotted",
     xlim = c(-1, 27),
     ylim = c(0.5, 16.5)
     )

# Displaying multiple plots in the same window n' stuff ----
par(mfrow = c(2, 2)) # Number of multiple figures, row-wise

plot(x, y)
plot(x^2, y-3)
plot(2*x+y, y)
plot(log(x), log(y))

par(mfcol = c(1, 2)) # Number of multiple figures, column-wise
plot(x, y)
plot(x^2, y-3)

dev.off() # Returns to the default n' stuff
par(mfrow = c(1,1)) # Also returns to the default

# Adding grid to graphics ----
plot(x, y, type = "n")
grid()
points(x, y)

# Overlaying samples on the same plot ----
plot(x, y,
     pch = 16,
     col = "red")

z <- c(15, 18, 22, 5)
w <- c(6, 8, 14, 4)

points(z, w,
       pch = 2,
       col = "blue")

# Adding legends n' stuff ----

legend(x = 10, y = 14,
       legend = c("Sample-1", "Sample-2"),
       pch = c(16, 2),
       cex= 0.8,
       col = c("red", "blue"))

# More plotting and legends ----
plot(x, y, pch = 16, col = "red")
points(z, w, pch = 2, col = "blue")

legend("top",
       legend = c("Sample-1", "Sample-2"),
       pch = c(16, 2),
       cex = 0.8,
       col = c("red", "blue"))

legend("bottomright",
       legend = c("Sample-1", "Sample-2"),
       pch = c(16, 2),
       cex = 0.8,
       col = c("red", "blue"))

# Table creation and cross tabulation n' stuff ----
class(mtcars)
dim(mtcars)
head(mtcars, 5)
tail(mtcars, 3)

cyl.freq <- table(mtcars$cyl)
cyl.freq
names(cyl.freq) <- c("v4", "v6", "v8")
cyl.freq

# Proportions
cyl.prop <- prop.table(table(mtcars$cyl))
names(cyl.prop) <- c("v4", "v6", "v8")
cyl.prop

# Percentages
cyl.percent <- prop.table(table(mtcars$cyl)) * 100
names(cyl.percent) <- c("v4", "v6", "v8")
cyl.percent

# Count
cyl.count <- table(mtcars$cyl)
cyl.count

# Table
cylindermatrix <- cbind(cyl.count, round(cyl.percent, 2))
rownames(cylindermatrix) <- c("V4", "V6", "V8")
colnames(cylindermatrix) <- c("Count", "Percent")
cylindermatrix

# Exercises n' stuff ----
# Create a table of counts for cyl where am = 0
automaticcyl <- table(mtcars$cyl[mtcars$am == 0])

# Create a table of counts for cyl where am = 1
manualcyl <- table(mtcars$cyl[mtcars$am == 1])

automaticcyl
manualcyl

# Create a 2x3 table displaying the counts for cyl and am variables
cylmatrix <- cbind(automaticcyl, manualcyl)
rownames(cylmatrix) <- c("V4", "V6", "V8")
colnames(cylmatrix) <- c("Automatic", "Manual")
cylmatrix

# Create a 2x3 table displaying the percentages
cylmatrixperc <- prop.table(cylmatrix) * 100
cylmatrixperc
