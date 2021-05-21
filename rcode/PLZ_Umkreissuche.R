# PLZ Umkreissuche
# Jan-Philipp Kolb
# Fri May 21 17:21:15 2021


data_path <- "C:/Arbeit/data/plz-gebiete.shp/"


# R Pakete laden ----------------------------------------------------------


library(maptools)
library(sp)
library(raster)


# PLZ Bereiche einlesen ---------------------------------------------------

# Quelle: https://www.suche-postleitzahl.org/downloads

plz <- readShapePoly(paste0(data_path,"plz-gebiete.shp"))
# spplot(plz)

plz6 <- plz[substr(plz@data$plz,1,1)==6,]

p6 <- coordinates(plz)

distances <- pointDistance(p6,lonlat = T)

# Links -------------------------------------------------------------------

# https://github.com/Japhilko/GeoData/blob/master/2017/slides/spdep.pdf
                     