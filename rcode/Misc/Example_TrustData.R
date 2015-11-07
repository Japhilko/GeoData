# Visualize trust data
# Floor Veerman and Jan-Philipp Kolb
# Sat Nov 07 12:56:03 2015

library(sp)
# install.packages("tmap")
library(tmap)

link <- "https://raw.githubusercontent.com/Japhilko/GeoData/master/data/TrustData.csv"

Trust <- read.csv2(link,sep=";")

Trust[,2] <- as.character(Trust[,2])
Trust[,4] <- as.character(Trust[,4])
Trust[,4] <- gsub(",",".",Trust[,4])
Trust[,4] <- as.numeric(Trust[,4])

data(Europe)

Trust[,2][Trust[,2]=='Czech Republic'] <- "Czech Rep."

matchmap2 <- match(Europe@data$name,Trust[,2])
Europe@data$Trust <- as.numeric(as.character(Trust[matchmap2,4]))

qtm(Europe,'Trust')

