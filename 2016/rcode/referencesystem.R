library(rgdal)
library(raster)

setwd("D:/GESIS/Workshops/GeoDaten/data")
plz <- readOGR("post_pl.shp","post_pl")

crs(plz)

plot(plz)

projection(plz) <- "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"

plot(plz)
