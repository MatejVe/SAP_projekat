require(dplyr)

podaci = read.csv("Statistika nogometaša engleske Premier lige.csv", as.is = FALSE)

youngerThan25 = podaci[podaci["Age"] <= 25,]

teamAndMinutes = youngerThan25[c("Team","Min")]
teamAndMinutes["Min"] <- as.numeric(as.character(teamAndMinutes$Min))

hist(teamAndMinutes$Min)

data_by_team <- group_by(.teamAndMinutes, )