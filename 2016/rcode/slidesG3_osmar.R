# Nutzung von GeoDaten in den Sozialwissenschaften
# Slides G3 - osmar
# Jan-Philipp Kolb
# Fri Apr 08 07:50:07 2016

## ----message=F-----------------------------------------------------------
library(ggmap)
library(osmar)

## ------------------------------------------------------------------------
api <- osmsource_api()

## ----cache=Ca,message=F,eval=F-------------------------------------------
## cityC <- geocode("Trier")
## bb <- center_bbox(cityC$lon,cityC$lat,200, 200)
## ua <- get_osm(bb, source = api)

## ----eval=F,echo=F-------------------------------------------------------
## setwd("C:/Users/kolbjp/Documents/GitHub/GeoData/2016/slides/data")
## save(ua,file="uaTrier.RData")

## ----echo=F--------------------------------------------------------------
load("data/uaTrier.RData")

## ----eval=Ex-------------------------------------------------------------
names(ua)

## ----eval=F--------------------------------------------------------------
## summary(ua$nodes)

## ----eval=F,echo=F-------------------------------------------------------
## datatable(summary(ua$nodes)[[6]])

## ----eval=Ex,echo=F------------------------------------------------------
kable(head(summary(ua$nodes)[[6]]))

## ----eval=Ex,cache=Ca----------------------------------------------------
bg_ids <- find(ua, way(tags(k=="building")))
bg_ids <- find_down(ua, way(bg_ids))
bg <- subset(ua, ids = bg_ids)

## ----eval=Ex,cache=Ca----------------------------------------------------
plot(bg)

## ----eval=Ex,cache=Ca----------------------------------------------------
bg_poly <- as_sp(bg, "polygons")  
plot(bg_poly)

## ----eval=F--------------------------------------------------------------
## map <- get_osm(complete_file(),
##                 source = osmsource_file("map.osm"))

## ------------------------------------------------------------------------
citation("osmar")

