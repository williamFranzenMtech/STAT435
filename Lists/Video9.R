# Video 9
similar_song <- list(title = "R you on time?", duration = 230)
song <- list(title = "Rsome times",
             duration = 190, track = 5,
             similar = similar_song)
song[1]
song[[1]]

song[c(1, 3)]

song[[c(1, 3)]]
song[[1]][[3]]

song[[4]][[1]]
song[[c(4, 1)]]

song[["duration"]]
song["duration"]
x