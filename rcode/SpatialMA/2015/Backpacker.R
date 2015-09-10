

graph.path <- "C:/Users/kolbjp/Documents/GitHub/GeoData/data/figure"

data.path <- "J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/data"
  
setwd(graph.path)

#-----------------#
## RoadMap
#-----------------#

### Satelite map

MP <- qmap(location = "Peru Machu Pichu", zoom = 14, maptype = "satellite")

WS <- qmap(location = "Weisser Stein Schriesheim", zoom = 14, maptype = "satellite")


### Code snipet Roadmap

library(ggmap)
qmap("Mannheim")


png("ggmapRoadmapMannheim10osm.png")
qmap("Mannheim",zoom=10, source = "osm")
dev.off()

# Topographic map

SanSeb <- qmap("San Sebastian")

setwd(graph.path)
png("SanSebastian.png")
SanSeb
dev.off()


London <- qmap("London")

London14 <- qmap("London",zoom=14)

png("qmapLondon15.png")
London15 <- qmap("London",zoom=15)
London15
dev.off()


#----------------------------#
# hostel Barcelona
#----------------------------#

library(geosmdata2)

hostels <- get_osm_nodes("hostel","Barcelona")

info <- extract_info_op(OSM.Data=hostels,value="hostel")


cafes <- get_osm_nodes("cafe","Barcelona")
info_cafes <- extract_info_op(OSM.Data=cafes,value="cafe")

setwd(data.path)
saveXML(cafes,file="Barcelona_cafes.xml")

# Get all hostels in Barcelona

infoCA <- with(info_cafes,data.frame(type=amenity,name,lat,lon))

infoHS <- with(info,data.frame(type=tourism,name,lat,lon))

infoALL <- rbind(infoCA,infoHS)


BA_map12 <- qmap(location = 'Barcelona', 
                 zoom = 12,
                 maptype="toner",
                 source="stamen")

png("qmap_BA_12.png")
BA_map12 + 
  geom_point(aes(x = lon, y = lat,col=type),
             data = infoALL)
dev.off()








library(geosmdata2)

hostels <- get_osm_nodes("hostel","Barcelona")

info <- extract_info_op(OSM.Data=hostels,value="hostel")

Namen <- as.character(info$name)

info2 <- list()
for (i in 22:nrow(info)){
  info2[[i]] <- geocode_osm(paste("Barcelona",
                                  info$name[i],
                                  output="all"))
  cat(i,"/n")
}



BA_map <- qmap(location = 'Barcelona', 
               zoom = 14,
               maptype="toner",
               source="stamen")

png("qmap_BA_14.png")
BA_map
dev.off()

BA_map10 <- qmap(location = 'Barcelona', 
                 zoom = 10,
                 maptype="toner",
                 source="stamen")

png("qmap_BA_10.png")
BA_map10
dev.off()

BA_map13<- qmap(location = 'Barcelona', 
                 zoom = 13,
                 maptype="toner",
                 source="stamen")

BA_map13+ 
  geom_point(aes(x = lon, y = lat,col=name),
             data = info)

info$contact.website

library(leaflet)
library(magrittr)

geoc <- geocode_osm("Barcelona")
m <- leaflet() %>% setView(lng = 41.382560, lat = 2.177135, zoom = 12)
m %>% addTiles() 





