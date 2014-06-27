##############################################################
# UseR - GeoData
# Jan-Philipp Kolb
# 25.06.2014
#
# Usage maptools
#
##############################################################


#------------------------------------------------------------#
# libraries
#------------------------------------------------------------#

library(maptools)

#------------------------------------------------------------#
# paths
#------------------------------------------------------------#

data.path <- "D:/Daten/GeoDaten"
DEU.path <- paste(data.path,"/DEU_adm",sep="")
USA.path <- paste(data.path,"/USA_adm",sep="")
BRA.path <- paste(data.path,"/BRA_adm",sep="")

graph.path <- "J:/Work/Statistik/Kolb/Vorträge/20140630_UseR_LA/Folien/figure"

#------------------------------------------------------------#
# read data
#------------------------------------------------------------#

setwd(DEU.path)
D<-readShapePoly("DEU_adm2.shp")


setwd(USA.path)
U<-readShapePoly("USA_adm2.shp")

setwd(BRA.path)
B<-readShapePoly("BRA_adm1.shp")

#------------------------------------------------------------#
# make plots
#------------------------------------------------------------#

plot(U,col="royalblue")

setwd(graph.path)
png("Brazil.png")
par(mai=c(0,0,0,0))
plot(B,col="chartreuse4")
dev.off()


plot(D[D$NAME_2=="Berlin",]
     ,col="royalblue")


setwd(graph.path)
pdf("Berlin.pdf")
par(mai=c(0,0,0,0))
plot(D[D$NAME_2=="Berlin",]
     ,col="royalblue")
dev.off()
