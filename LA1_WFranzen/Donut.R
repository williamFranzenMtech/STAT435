#William Franzen
#Problem 2

#R Code to calculate the Volume of a Donut
#Created by William Franzen

r <- 3 #Inner Radius
R <- 7 #Outer Radius

class(r)
class(R)

vol_donut <- 2 * (pi**2) * (r**2) * R
vol_donut

cat("If the inner radius is", r, "and the outer radius is", R, "then the volume of a donut is", vol_donut, "\n")

ls()