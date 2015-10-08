# Spatial Visualisations
# Jan-Philipp Kolb
# Thu Oct 08 09:32:33 2015


library(raster)
LUX1 <- getData('GADM', country='LUX', level=1)
plot(LUX1)

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

# download from http://datahub.io/de/dataset/postal-codes-de
setwd("D:/Daten/Daten/GeoDaten")
library(rgdal)
PLZ <- readOGR ("post_pl.shp","post_pl")

## ----cache=ca,warning=F--------------------------------------------------
MA <- PLZ[PLZ@data$PLZORT99=="Mannheim",]
plot(MA)

## ----cache=T,message=F,warning=F-----------------------------------------

# download from http://www.geodatenzentrum.de/geodaten/gdz_rahmen.gdz_div?gdz_spr=deu&gdz_akt_zeile=5&gdz_anz_zeile=1&gdz_unt_zeile=14&gdz_user_id=0
library(maptools)
setwd("D:/Daten/Daten/GeoDaten/vg250_ebenen")
krs <- readShapePoly("vg250_krs.shp")
plot(krs)

## ------------------------------------------------------------------------
fds <- substr(krs@data$AGS,1,2)

plot(krs[fds=="05",])

## ----cache=T-------------------------------------------------------------
# download from http://www.bundesnetzagentur.de/SharedDocs/Downloads/DE/Sachgebiete/Telekommunikation/Unternehmen_Institutionen/Nummerierung/Rufnummern/ONVerzeichnisse/ONBGrenzen/ONB_Grenzen.html

setwd("D:/Daten/Daten/GeoDaten")
onb <- readShapePoly("onb_grenzen.shp")

head(onb@data)

## ----cache=T-------------------------------------------------------------
VW <- substr(onb@data$VORWAHL,1,2)
plot(onb[VW=="06",])

## ----cache=T-------------------------------------------------------------
Com <- onb@data$NAME
plot(onb[VW=="06",])
plot(onb[Com=="Mannheim",],col="red",add=T)
plot(onb[Com=="Heidelberg",],col="green",add=T)
plot(onb[Com=="Kaiserslautern",],col="blue",add=T)

## ----message=F,warning=F-------------------------------------------------
library(mapdata)

