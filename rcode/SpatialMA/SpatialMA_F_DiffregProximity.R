##################################
# Spatial Mannheim
# Jan-Philipp Kolb
# 24.11.2014
#
# Different regions - proximity
#
##################################



#--------------------------------#
# Set path
#--------------------------------#

graph.path <- "D:/Dropbox/RForschung/SpatialMannheim/Rslides/SpatialMA_F_Neighbourhood/figure"

#--------------------------------#
# Libraries
#--------------------------------#

library(maptools)


#--------------------------------#
# Get the right map
#--------------------------------#

data(wrld_simpl)

Africa <- wrld_simpl[wrld_simpl$REGION==2,]
plot(Africa)

Antarctic <- wrld_simpl[wrld_simpl$REGION==0,]
plot(Antarctic)

setwd(graph.path)
png("Antarctic.png")
par(mai=c(0,0,0,0))
plot(Antarctic)
dev.off()


Australia <- wrld_simpl[wrld_simpl$REGION==9,]
plot(Australia)

png("Australia.png")
par(mai=c(0,0,0,0))
plot(Australia)
dev.off()


America <- wrld_simpl[wrld_simpl$REGION==19,]
plot(America)

png("America.png")
par(mai=c(0,0,0,0))
plot(America)
dev.off()

Asia <- wrld_simpl[wrld_simpl$REGION==142,]
plot(Asia)

png("Asia.png")
par(mai=c(0,0,0,0))
plot(Asia)
dev.off()

Europe <- wrld_simpl[wrld_simpl$REGION==150,]
plot(Europe)

png("Europe.png")
par(mai=c(0,0,0,0))
plot(Europe)
dev.off()

    # deleting a country

Europe2 <- Europe[-which(Europe$NAME=="Russia"),]
plot(Europe2,col="orange")

png("Europe2.png")
par(mai=c(0,0,0,0))
plot(Europe2,col="orange")
dev.off()

#--------------------------------#
# The sp-package
#--------------------------------#

library(sp)

png("Europe2POP2005.png")
spplot(Europe2,"POP2005")
dev.off()

#--------------------------------#
# Proximity
#--------------------------------#

library(sp)
library(spdep)

Af <- coordinates(Africa)


Af_nb <- tri2nb(Af)

Af_nb[1]


plot(Africa)
plot(Africa[1,],col="red",add=T)
plot(Africa[Af_nb[1][[1]],],col="orange",add=T)


IDs <- row.names(as(Africa, "data.frame"))
Af10_nb <- knn2nb(knearneigh(Af, k = 10), row.names = IDs)
plot(Africa)
plot(Africa[1,],col="red",add=T)
plot(Africa[Af10_nb[1][[1]],],col="orange",add=T)


library(raster)

Af <- coordinates(Africa) # get centroid
pointDistance(Af[1:4,], lonlat=TRUE) # compute distance


Dist_Af <- pointDistance(Af, lonlat=TRUE)
Af_color <- Dist_Af[,1]
Af_color <- Af_color/max(Af_color)
Af_color <- rgb(Af_color,0,0)
plot(Africa,col=Af_color)
plot(Africa)
points(x=Af[1,1],y=Af[1,2],col="red",pch=20)
