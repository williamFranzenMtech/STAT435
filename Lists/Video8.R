# Video 8

c("Rsome time", 190, 5)
list("Rsome times", 190, 5)

song <- list ("Rsome times", 190, 5)
is.list(song)

names(song) <- c("title", "duration", "track")
song

song <- list(title = "Rsome times",
             duration = 190,
             track = 5)
str(song)

similar_song <- list(title = "R you on time?",
                     duration = 230)
song <- list(title = "Rsome times",
             duration = 190, track = 5,
             similar = similar_song)
str(song)
