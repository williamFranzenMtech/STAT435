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
cylmatrix <- rbind(automaticcyl, manualcyl)
colnames(cylmatrix) <- c("V4", "V6", "V8")
rownames(cylmatrix) <- c("Automatic", "Manual")
cylmatrix

# Create a 2x3 table displaying the percentages
cylmatrixperc <- prop.table(cylmatrix) * 100
cylmatrixperc

# Bar Plots ----
barplot(c(11, 7, 14))
# or
barplot(table(mtcars$cyl))

barplot(cyl.freq,
        main = "Performance Car Counts by No. of Cylinders",
        col.main = "blue",
        xlab = "No. of Cylinders",
        ylab = "Frequency",
        names.arg = c("v4", "v6", "v8"),
        col = "lightblue",
        axis.lty = 1)

bar.means <- tapply(mtcars$mpg, mtcars$cyl, mean)
bar.means

barplot(bar.means,
        axis.lty = 1,
        main = "Mean MPG by Number of Cylinders",
        xlab = "No. of Cylinders",
        ylab = "Mean",
        names.arg = c("v4", "v6", "v8"),
        ylim = c(0, 30))

bar.sd <- tapply(mtcars$mpg, mtcars$cyl, sd)
bar.sd

barplot(bar.sd,
        axis.lty = 1,
        main = "Standard Deviation of MPG\nby Number of Cylinders",
        xlab = "No. of Cylinders",
        ylab = "Mean",
        names.arg = c("v4", "v6", "v8"),
        ylim = c(0, 5))

# Create a table of frequencies by am
am.freq <- table(mtcars$am)
am.freq

names(am.freq) <- c("automatic", "manual")
am.freq

# Produce barplot of am.freq
barplot(am.freq,
        axis.lty = 1,
        main = "Performance Car Counts by Transmission",
        xlab = "Transmission",
        ylab = "Frequency",
        ylim = c(0, 20),
        font.lab = 2,
        col = "pink",
        )

mean.mpg <- tapply(mtcars$mpg, mtcars$am, mean)
mean.mpg
barplot(mean.mpg,
        axis.lty = 1,
        main = "Mean MPG (Miles/US Gallon) by Transmission Type",
        xlab = "Transmission",
        ylab = "Mean",
        ylim = c(0, 25),
        col.main = "red",
        font.axis = 2
        )

barplot(cylmatrix,
        horiz = TRUE, # Makes it horizontal instead of vertical
        main = "Performance car counts\nby Transmission and Cylinders",
        xlab = "Counts",
        beside = TRUE, # Sets them clustered instead of stacked
        xlim = c(0, 14),
        las = 1, # Labels to appear horizontally
        cex.main = 1.5 # Size of title
        )

legend("bottomright",
       legend = c("manual", "automatic"),
       fill = c("gray", "black"),
       cex = 1)

# Pie Charts ----
group.per <- c(18, 30, 32, 10, 10)
pie(group.per,
    labels = c("A, 18%", "B, 30%", "C, 32%", "D, 10%", "F, 10%"),
    col = c("gray", "white", "gray", "black", "gray90"),
    main = "Letter Grade Distribution")

# Produce a pie chart for cyl for mtcars
cyltab <- table(mtcars$cyl)
cyltab
pie(cyltab,
    labels = c("V4, 11", "V6, 7", "V8, 14"),
    main = "Count of Performance Cars\nby Number of Cylinders",
    col = c("white", "blue", "pink"))

cyltabperc <- prop.table(table(mtcars$cyl))*100
pie(cyltabperc,
    labels = c("V4, 34.375%", "V6, 21.875%", "V8, 43.750%"),
    main = "Count of Performance Cars\nby Number of Cylinders",
    col = c("white", "blue", "pink"))

# Adding lines n' stuff ----
x <- c(3, 1, 9, 8, 25, 18)
y <- c(2, 13, 8, 6, 11, 9)

plot(x, y)

abline(h=4)
abline(v=5)

abline(h=10, col="red", lty=2)
abline(v=15, col="green", lwd=2, lty=3)

plot(x, y)
lines(x = c(15, 25), y = c(4, 10), lty = "dashed", col = "blue", lwd = 2)


segments(x0 = 5, y0 = 12, x1 = 20, y1 = 4)
segments(x0 = 5, y0 = 12, x1 = 20, y1 = 4, lty = 2, col = "blue")
segments(x0 = 5, y0 = 10, x1 = 25, y1 = 5, lty = "dotted", col = "red", lwd = 2)

# Exercise: Plot the graph displayed in the notesheets n' stuff
plot(x, y, pch=19)
abline(h=10, col="blue", lty="dashed", lwd=2)
abline(h=5, col="blue", lty="dashed", lwd=2)
lines(x = c(5,5), y = c(5,10), col="red", lty="dotted", lwd = 2)
lines(x = c(20,20), y = c(5,10), col="red", lty="dotted", lwd = 2)

# Histograms n' stuff ----
hist(mtcars$hp)

hist(mtcars$hp,
     breaks = 15,
     main = "Histogram of Gross Horsepower",
     xlab = "HP",
     col = "lightgreen")

hist(mtcars$hp,
     breaks = 15,
     main = "Histogram of Gross Horsepower",
     xlab = "HP",
     col = "lightgreen",
     freq = FALSE, # Density instead of frequency
     )

hist(mtcars$hp,
     breaks = seq(from = 0, to = 400, by = 25),
     main = "Histogram of Gross Horsepower\nfor 32 automobiles (1973-74 models)",
     xlab = "HP",
     col = "lightblue"
     )

# lines() can be used, but segments() is more efficient n' stuff.
#lines(x = c(mean(mtcars$hp), mean(mtcars$hp)), y = c(0, 8),
#      lty = "dashed", col = "red", lwd = 2)
#lines(x = c(median(mtcars$hp), median(mtcars$hp)), y = c(0, 8),
#      lty = "dotted", col = "red", lwd = 2)

segments(x0 = c(mean(mtcars$hp), median(mtcars$hp)), y0 = c(0, 0),
         x1 = c(mean(mtcars$hp), median(mtcars$hp)), y1 = c(8, 8),
         col = "red",
         lty = c("dashed", "dotted"),
         lwd = 2)

legend("topright", legend = c("mean HP", "median HP"),
       lty = c("dashed", "dotted"),
       lwd = 2, col = "red")

# Density for histograms n' stuff ----
hist(mtcars$hp,
     breaks = 6,
     freq = FALSE,
     xlab = "HP",
     main = "Histogram of Gross Horsepower",
     col = "lightblue")

lines(density(mtcars$hp), col = "red", lwd = 2)

# Histogram for discrete variables ----
set.seed(111)
disc.samp <- sample(1:6, size = 100, replace = TRUE)
disc.samp

plot(table(disc.samp),
     type = "h",
     lwd = 10,
     xlab = "Outcomes",
     ylab = "Frequency")

barplot(prop.table(table(disc.samp)),
       names.arg = 1:6,
       xlab = "Outcomes",
       ylab = "Probability",
       axis.lty = 1,
       ylim = c(0, 0.25))

# Boxplots n' Stuff ----
boxplot(mtcars$hp)

boxplot(mtcars$hp ~ mtcars$cyl,
        main = "Boxplots of Gross Horsepower\nby Number of Cylinders",
        xlab = "No. of Cylinders",
        ylab = "Horsepower",
        pch = 16,
        names = c("v4", "v6", "v8"))


# Calculating mean of hp by cyl and adding this to the plot n' stuff
tapply(mtcars$hp, mtcars$cyl, mean)

text(x = 1, y = 280,
     labels = "Means:\nv4 = 82.636\nv6 = 122.286\nv8 = 209.214",
     col = "blue")


# Exercises ----
# Exercise 1 ====
boxplot(mtcars$wt ~ mtcars$am,
        main = "Boxplots for Comparing Weights of Automobiles\nby Transmission Type",
        xlab = "Transmission",
        ylab = "Weight (1000 lbs)",
        names = c("automatic", "manual"),
        col = c("gray", "lightblue")
        )

tapply(mtcars$wt, mtcars$am, median)

text(x = 2, y = 5,
     labels = "Medians:\nautomatic = 3.52\nmanual = 2.32",
     col = "red")

# Exercise 2 ====
boxplot(mtcars$wt ~ mtcars$am,
        main = "Boxplots for Comparing Weights of Automobiles\nby Transmission Type",
        xlab = "Transmission",
        ylab = "Weight (1000 lbs)",
        names = c("automatic", "manual"),
        col = c("gray", "lightblue")
        )
text(x = 2.1, y = 5,
     labels = "outliers",
     col = "red",
     font = 2)
arrows(x0 = 2, x1 = 1.02,
       y0 = 5, y1 = 5.32,
       col = "red")
arrows(x0 = 2, x1 = 1.02,
       y0 = 5, y1 = 2.4,
       col = "red")

# Generic plot() function
source("useful.R")
str(myhospital)

plot(myhospital$pain) # Bar plot
plot(myhospital$gender, myhospital$pain) # Stacked Bar Plot
plot(myhospital$age, myhospital$weight) # Scatterplot

# Scatterplots ----
which(colnames(iris) == "Petal.Length")
which(colnames(iris) == "Petal.Width")
plot(iris[,3], iris[,4],
     xlab = "Petal Length (cm)",
     ylab = "Petal Width (cm)")

with(iris, plot(Petal.Length, Petal.Width,
                xlab = "Petal Length (cm)",
                ylab = "Petal Width (cm)"))

plot(iris[,3], iris[,4],
     type = "n",
     xlab = "Petal Length (cm)",
     ylab = "Petal Width (cm)")
points(iris[iris$Species == "setosa", 3],
       iris[iris$Species == "setosa", 4], pch = 1, col = "black")
points(iris[iris$Species == "versicolor", 3],
       iris[iris$Species == "versicolor", 4], pch = 2, col = "blue")
points(iris[iris$Species == "virginica", 3],
       iris[iris$Species == "virginica", 4], pch = 3, col = "red")

legend("topleft", legend = c("setosa", "versicolor", "virginica"),
       pch = c(1, 2, 3),
       col = c("black", "blue", "red"))


plot(iris[,1:4], pch = rep(1:3, each = 50))

pairs(iris[,1:4], pch = rep(1:3, each = 50),
      col = rep(c("black", "red", "blue"), each = 50),
      main = "Scatterplot matrix of the \"iris\" data set",
      cex.labels = 0.75,
      cex = 0.75
      )


# Q-Q Plots n' Stuff ----
head(iris)
qqnorm(iris$Sepal.Length, main = "Normal Q-Q Plot: Sepal.Length")
qqline(iris$Sepal.Length)

par(mfrow = c(1, 3))
qqnorm(iris$Sepal.Length[iris$Species == "setosa"], main = "Q-Q Plot: Sepal.Length\nfor Setosa")
qqline(iris$Sepal.Length[iris$Species == "setosa"])
qqnorm(iris$Sepal.Length[iris$Species == "virginica"], main = "Q-Q Plot: Sepal.Length\nfor Virginica")
qqline(iris$Sepal.Length[iris$Species == "virginica"])
qqnorm(iris$Sepal.Length[iris$Species == "versicolor"], main = "Q-Q Plot: Sepal.Length\nfor Versicolor")
qqline(iris$Sepal.Length[iris$Species == "versicolor"])


# Curve Function ----
par(mfrow = c(1, 1))
curve(dnorm, from = -3.5, to = 3.5,
      main = "Standard Normal Density Function",
      col = "blue",
      lwd = 3,
      xlab = "Z",
      ylab = "Density")

# Other curve types
curve(x^2-3*x, from = -2, to = 2, col = "green", lwd = 2)
curve(x^2-2, add = TRUE, col = "violet", lwd = 2, lty = 2)

# Exercise Thingy
z <- seq(-3.5,3.5, length.out = 100)
fz <- dnorm(z)
plot(z, fz, main = "Standard Normal Distribution", type = "l",
     ylab = "Density", xlab = "Z",
     col = "blue", lwd = 3)
abline(h=0)
region.z <- z[-0.5 < z & z < 2]
region.fz <- fz[-0.5 < z & z < 2]
region.z <- c(region.z[1], region.z, tail(region.z,1))
region.fz <- c(0, region.fz, 0)
polygon(region.z, region.fz, density=-2, col="red")

region2.z <- z[z < -0.5]
region2.fz <- fz[z < -0.5]
region2.z <- c(region2.z[1], region2.z, tail(region2.z,1))
region2.fz <- c(0, region2.fz, 0)
polygon(region2.z, region2.fz, density=-2, col="coral")

