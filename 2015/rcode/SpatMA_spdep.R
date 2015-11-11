# R-Package spdep - neighbours and distance  
# Jan-Philipp Kolb
# Wed Nov 11 10:28:18 2015

## ----warning=F,message=F-------------------------------------------------
library(maptools)
data(wrld_simpl)
Africa <- wrld_simpl[wrld_simpl@data$REGION==2,]
plot(Africa)

## ----warning=F,message=F-------------------------------------------------
library(sp)
Af <- coordinates(Africa)
plot(Africa)
points(x=Af[1,1],y=Af[1,2],col="red",pch=20)

## ----warning=F,message=F-------------------------------------------------
library(spdep)
Af_nb <- tri2nb(Af)

## ----warning=F,message=F-------------------------------------------------
Af_nb[1]

## ----warning=F,message=F-------------------------------------------------
plot(Africa)
plot(Africa[1,],col="red",add=T)
plot(Africa[Af_nb[1][[1]],],col="orange",add=T)

## ----warning=F,message=F-------------------------------------------------
IDs <- row.names(as(Africa, "data.frame"))
Af10_nb <- knn2nb(knearneigh(Af, k = 10), row.names = IDs)
plot(Africa)
plot(Africa[1,],col="red",add=T)
plot(Africa[Af10_nb[1][[1]],],col="orange",add=T)

## ----warning=F,message=F-------------------------------------------------
Af <- coordinates(Africa) # get centroid
library(raster)
pointDistance(Af[1:4,], lonlat=TRUE) # compute distance

## ----warning=F,message=F-------------------------------------------------
Dist_Af <- pointDistance(Af, lonlat=TRUE)
Af_color <- Dist_Af[,1]
Af_color <- Af_color/max(Af_color)
Af_color <- rgb(Af_color,0,0)
plot(Africa,col=Af_color)

