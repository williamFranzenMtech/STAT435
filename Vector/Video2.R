suits <- c("hearts", "diamonds", "spades", "clubs")
remain <- c(11, 12, 11, 13)
print(remain)

names(remain) <- suits

print(remain)

remain <- c(spades = 11, hearts = 12, diamonds = 11, clubs = 13)
print(remain)
remain <- c("spades" = 11, "hearts" = 12, "diamonds" = 11, "clubs" = 13)

str(remain)

my_apples <- 5
my_oranges <- "six"

length(my_apples)
length(my_oranges)
length(suits)

drawn_ranks <- c(7, 4, "A", 10, "K", 3, 2, "Q")
print(drawn_ranks)
class(drawn_ranks)