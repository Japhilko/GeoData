# Nutzung von GeoDaten in den Sozialwissenschaften
# Slides C3 - Quellen für Polygone
# Jan-Philipp Kolb
# Thu Apr 07 07:55:06 2016

## ----cache=ca,warning=F,message=F----------------------------------------
library(raster)
LUX1 <- getData('GADM', country='LUX', level=1)
plot(LUX1)

## ----eval=F,echo=F-------------------------------------------------------
LUXA <- LUX1[1,]
plot(LUXA)

## ----eval=F--------------------------------------------------------------
LUX1@polygons[[1]]@Polygons[[1]]@coords

## ----echo=F--------------------------------------------------------------
head(LUX1@polygons[[1]]@Polygons[[1]]@coords)

## ------------------------------------------------------------------------
head(LUX1@data)

## ----cache=ca,warning=F--------------------------------------------------
LUX3 <- getData('GADM', country='LUX', level=3)
plot(LUX3)

## ----cache=ca,warning=F--------------------------------------------------
LUX4 <- getData('GADM', country='LUX', level=4)
plot(LUX4)

## ----cache=ca,warning=F--------------------------------------------------
DEU3 <- getData('GADM', country='DEU', level=3)
plot(DEU3)

## ----eval=F,echo=F-------------------------------------------------------

# hier muss der eigene Pfad angegeben werden
setwd("C:/")

## ----eval=Ex2,echo=T,message=F-------------------------------------------
library(rgdal)
PLZ <- readOGR ("post_pl.shp","post_pl")

## ----echo=F--------------------------------------------------------------
bbox4 <- bbox(MA)

## ----cache=ca,eval=F,warning=F-------------------------------------------
MA <- PLZ[PLZ@data$PLZORT99=="Mannheim",]
plot(MA)

# hier muss der eigene Pfad angegeben werden Beispiel:
# setwd("C:/")

## ----cache=F,message=F,warning=F,eval=Ex3--------------------------------
library(maptools)
krs <- readShapePoly("vg250_krs.shp")
plot(krs)

## ----eval=Ex4------------------------------------------------------------
fds <- substr(krs@data$AGS,1,2)

plot(krs[fds=="05",])

# hier muss der eigene Pfad angegeben werden Beispiel:
# setwd("C:/")

par(mai=c(0,0,0,0))

## ----eval=F--------------------------------------------------------------
onb <- readShapePoly("onb_grenzen.shp")
 
head(onb@data)

## ----eval=F--------------------------------------------------------------
VW <- substr(onb@data$VORWAHL,1,2)
plot(onb[VW=="06",])

## ----eval=F--------------------------------------------------------------
Com <- onb@data$NAME
plot(onb[VW=="06",])
plot(onb[Com=="Mannheim",],col="red",add=T)
plot(onb[Com=="Heidelberg",],col="green",add=T)
plot(onb[Com=="Kaiserslautern",],col="blue",add=T)

# hier muss der eigene Pfad angegeben werden Beispiel:
# setwd("C:/")


## ----message=F,warning=F,eval=F,echo=T-----------------------------------
library(rgdal)
WPI <- readOGR ("WPI.shp","WPI")
plot(WPI)

## ----message=F,warning=F-------------------------------------------------
library(mapdata)

