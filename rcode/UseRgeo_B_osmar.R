##############################################################
# UseR - Georeferencing
# Jan-Philipp Kolb
# 12.06.2014
#
# Geocoding and information about souroundings
#
##############################################################


#------------------------------------------------------------#
# libraries
#------------------------------------------------------------#

library(ggmap)
library(osmar)

#------------------------------------------------------------#
# Functions
#------------------------------------------------------------#


getBuildingShapes <- function(ua,what){
  ua_ids <- find(ua, way(tags(k == what)))
  ua_ids2 <- find_down(ua, way(ua_ids))
  bg <- subset(ua, ids = ua_ids2)
  
  bg_erg <- as_sp(bg, "polygons")  
  return(bg_erg)
}

#------------------------------------------------------------#
# Download data
#------------------------------------------------------------#

src <- osmsource_api()

bb_MA2 <- center_bbox(8.462844, 49.48569, 1000, 1000)
ua_MA2 <- get_osm(bb_MA2, source = src)

#------------------------------------------------------------#
# Transfer data to shapefiles
#------------------------------------------------------------#

MA_building_poly <- getBuildingShapes(ua=ua_MA2,what="building")

#------------------------------------------------------------#
# Georeferencing
#------------------------------------------------------------#

  # georeferencing GESIS Mannheim
gesisID<- with(ua_MA2$nodes$tags,id[agrep("GESIS",v)])
gesisP <- which(ua_MA2$nodes$attrs$id==gesisID)


fast_foodID <- with(ua_MA2$nodes$tags,id[agrep("fast_food",v)])
fast_foodP <- which(ua_MA2$nodes$attrs$id %in% fast_foodID)

#------------------------------------------------------------#
# plot graph
#------------------------------------------------------------#



plot(MA_building_poly,col="ivory",border="snow4")
with(ua_MA2$nodes$attr,points(x=lon[fast_foodP],
                              y=lat[fast_foodP],
     col="magenta4",pch=20,cex=1.5))
with(ua_MA2$nodes$attr,points(x=lon[gesisP],
                              y=lat[gesisP],
                              col="red",pch=20,cex=2))


