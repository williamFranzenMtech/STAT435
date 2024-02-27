#William Franzen
#Generating Sequences and Replicates

#0.0 0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0
seq(0, 2, 0.2)

#20 18 16 14 12 10  8  6  4  2  0  1  2  3  4  5
c(seq(20, 0, -2), seq(1, 5))

#0.000000  1.666667  3.333333  5.000000  6.666667  8.333333 10.000000
seq(0, 10, length.out = 7)

#1 1 1 1 2 2 2 2 3 3 3 3 1 1 1 1 2 2 2 2 3 3 3 3
rep(seq(1, 3), each=4, 2)

#10 10 10 11 11 11 12 12 12 13 13 13 14 14 14 15 15 15
rep(seq(10,15), times=c(3, 2, 2, 1, 4, 2))

#"A" "A" "B" "B" "A" "A" "B" "B"
rep(c("A", "B"), each=2, 2)


x <- c(7, 2, 4, 4, 7, 6, 9, 3, 8, 4, 5)
#First Four Elements
x[1:4]

#All elements, except 3 and 6
x[c(-3, -6)]

#All elements greater than median (median=5)
x[x > median(x)]

#Proportion of elements equal to 3
mean(x > 3)

#Mean of values lte 5
mean(x[x<=5])