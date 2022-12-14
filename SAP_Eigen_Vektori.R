require(dplyr)

podaci = read.csv("Statistika nogometaša engleske Premier lige.csv", as.is = FALSE)

dim(podaci)


'ZADATAK 2: Dobivaju li u prosjeku viˇse ˇzutih kartona napadaˇci ili igraˇci veznog reda?'

'Koristimo: Pos i CrdY'
'--> napravimo novi dataset koji će sadržavati samo ova 2 stupca(i to samo napadače i vezne'

podaci1 = podaci[complete.cases(podaci$CrdY),]


MF = podaci1[podaci1["Pos"] == "MF",]
FW = podaci1[podaci1["Pos"] == "FW",]


'1. koliko veznih dobiva žute kartone i koliko ih ne dobiva'
MFYP = MF[(MF$CrdY != 0),]

'broj žutih kartona u veznih'
MFY = MF$CrdY
k1 = sum(MFY)

'2. koliko napadača dobiva žute kartone i koliko ih ne dobiva'
FWYP = FW[(FW$CrdY != 0),]

'broj žutih kartona kod napadača'
FWY = FW$CrdY
k2 = sum(FWY)

'H0: Y = NY'
'H1: Y > NY'
'test o proporcijama'

m1 = as.double(nrow(MFYP))
m2 = as.double(nrow(FWYP))
n1 = as.double(nrow(MF))
n2 = as.double(nrow(FW))

prop.test(x = c(m1, m2),
          n = c(n1, n2),
          alternative = "greater")

'ili preko kvantila i p vrijednosti: p =(k1+k2/n1+n2); q=1-p; z=p1-p2/sqrt(p*q*(1/n1+1/n2); pnorm(z, lower.tail = FALSE)'
p1 = n1/m1
p2 = n2/m2
p =((m1+m2)/(n1+n2))
q=1-p
z=(p1-p2)/sqrt(p*q*(1/n1+1/n2))
pnorm(z, lower.tail = FALSE)

'ZAKLJUČAK: Zaključili smo da ne možemo odbaciti H_0 zato što....'
