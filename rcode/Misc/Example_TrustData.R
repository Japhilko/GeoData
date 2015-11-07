Datapath <- "C:/Users/Floor/SkyDrive/Sociologie/Spacial social science/Data"
setwd(Datapath)
read.csv("Trust in others.csv")
library(sp)
Trust <-read.csv("Trust in others.csv",sep=";")
install.packages("tmap")
library(tmap)
data(Europe)
qtm(Europe)
matchmap <- match(Trust[,2],Europe@data$name)

Europe@data$name

Trust[,2] <- as.character(Trust[,2])
Trust[,2][Trust[,2]=='Czech Republic'] <- "Czech Rep."

matchmap <- match(Trust[,2],Europe@data$name)


matchmap2 <- match(Europe@data$name,Trust[,2])
Europe@data$Trust <- as.numeric(Trust[matchmap2,4])

qtm(Europe,'Trust')

Trust[is.na(matchmap),2]
sort(Europe@data$name)
