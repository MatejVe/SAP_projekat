require(dplyr)

podaci = read.csv("Statistika nogometaša engleske Premier lige.csv", as.is = FALSE)
dim(podaci)

names(podaci)

summary(podaci)

podaci = podaci[!podaci$MP == 0,]

