## ----setup, include=FALSE,echo=F-----------------------------------------
knitr::opts_chunk$set(echo = TRUE,cache=T,eval=F,warning=F,message=F)

## ----echo=F--------------------------------------------------------------
library(knitr)

## ------------------------------------------------------------------------
library(raster)

## ----warning=F,message=F,eval=T------------------------------------------
LUX1 <- getData('GADM', country='LUX', level=1)
plot(LUX1)

## ----eval=F,echo=F-------------------------------------------------------
## LUXA <- LUX1[1,]
## plot(LUXA)

## ----eval=T--------------------------------------------------------------
LUX1@polygons[[1]]@Polygons[[1]]@coords

## ----echo=F,eval=T-------------------------------------------------------
head(LUX1@polygons[[1]]@Polygons[[1]]@coords)

## ----eval=F--------------------------------------------------------------
## head(LUX1@data)

## ----eval=T,echo=F-------------------------------------------------------
kable(head(LUX1@data))

## ----LUX3,warning=F,eval=T-----------------------------------------------
LUX3 <- getData('GADM', country='LUX', level=3)
plot(LUX3)

## ----LUX4,warning=F,eval=T-----------------------------------------------
LUX4 <- getData('GADM', country='LUX', level=4)
plot(LUX4)

## ----DEU3,warning=F,eval=F-----------------------------------------------
## DEU3 <- getData('GADM', country='DEU', level=3)
## plot(DEU3)

## ----eval=F,echo=F-------------------------------------------------------
## setwd("D:/Daten/Daten/GeoDaten")

## ------------------------------------------------------------------------
library(rgdal)

## ----echo=T,message=F,eval=F---------------------------------------------
## PLZ <- readOGR ("post_pl.shp","post_pl")

## ----warning=F,message=F,eval=F,echo=F-----------------------------------
## library(maptools)
## PLZ <- readShapePoly("post_pl.shp")

## ----echo=F--------------------------------------------------------------
#bbox4 <- bbox(MA)

## ----eval=F,warning=F----------------------------------------------------
## MA <- PLZ[PLZ@data$PLZORT99=="Mannheim",]
## plot(MA)

## ----eval=F,echo=F-------------------------------------------------------
## setwd("D:/Daten/Daten/GeoDaten/vg250_ebenen")

## ----cache=F,message=F,warning=F,eval=F----------------------------------
## library(maptools)
## krs <- readShapePoly("vg250_krs.shp")
## plot(krs)

## ----eval=F--------------------------------------------------------------
## fds <- substr(krs@data$AGS,1,2)
## 
## plot(krs[fds=="05",])

## ----eval=F,echo=F-------------------------------------------------------
## setwd("D:/Daten/Daten/GeoDaten")
## par(mai=c(0,0,0,0))

## ----eval=F--------------------------------------------------------------
## onb <- readShapePoly("onb_grenzen.shp")
## 
## kable(head(onb@data))

## ----eval=F--------------------------------------------------------------
## VW <- substr(onb@data$VORWAHL,1,2)
## plot(onb[VW=="06",])

## ----eval=F--------------------------------------------------------------
## Com <- onb@data$NAME
## plot(onb[VW=="06",])
## plot(onb[Com=="Mannheim",],col="red",add=T)
## plot(onb[Com=="Heidelberg",],col="green",add=T)
## plot(onb[Com=="Kaiserslautern",],col="blue",add=T)

## ----echo=F,eval=F-------------------------------------------------------
## setwd("D:/Daten/Daten/GeoDaten/WPI_Shapefile")

## ----message=F,warning=F,eval=F,echo=T-----------------------------------
## library(rgdal)
## WPI <- readOGR ("WPI.shp","WPI")
## plot(WPI)

## ----eval=F,echo=F-------------------------------------------------------
## git.path <- "C:/Users/kolbjp/Documents/GitHub/GeoData"
## setwd(git.path)

## ----message=F,warning=F-------------------------------------------------
library(mapdata)

