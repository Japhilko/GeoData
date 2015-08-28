#-------------------------------#
# Get OSM pictures
# Jan-Philipp Kolb
# Fri Aug 28 15:08:46 2015
#-------------------------------#


#-------------------------------#
# Paths
#-------------------------------#

main.path <- "J:/Work/Statistik/Kolb/Paper/UseOSMdata/"
data.path <- paste(main.path,"data/XML/",sep="")

graph.path <- paste(main.path,"figure/",sep="")

#-------------------------------#
# Libraries
#-------------------------------#

library(geosmdata2)
library(ggmap)
library(XML)
  
#-------------------------------#
# Prepare data
#-------------------------------#

place <- "Hamburg"
objL <- c("school","car_sharing","fuel","parking","bank","dentist",
          "restaurant","fast_food","cafe","biergarten","bar",
          "playground","bakery")

infoList <- list()
for (i in 1:length(objL)){
  osm_o <- get_osm_nodes(objL[i],place)  
  setwd(data.path)
  saveXML(osm_o,file=paste(place,"_",objL[i],".xml",sep=""))
  
  info <- extract_info_op(osm_o,objL[i])
  infoList[[i]] <- with(info,data.frame(lat,lon,objL[i]))
}

infoDF <- do.call(rbind,infoList)
colnames(infoDF)[3] <- "object"

#-------------------------------#
# Get background map
#-------------------------------#

Imap12 <- qmap(location = place, zoom = 12, maptype="toner",source="stamen")

#-------------------------------#
# Plot complete map
#-------------------------------#

setwd(graph.path)

png(paste(place,"_","1bis12.png",sep=""))
Imap12 + geom_point(aes(x = lon, y = lat,col=object),
                    data = infoDF)
dev.off()

#-------------------------------#
# interactive map
#-------------------------------#

library(magrittr)
library(leaflet)
m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=infoDF$lon, lat=infoDF$lat, popup=infoDF$objec)
m  # Print the map













#-------------------------------#
# Misc
#-------------------------------#

setwd(data.path)
HD <- xmlParse("Heidelberg_school.xml")

#-------------------------------#
# Functions
#-------------------------------#

get_osm_nodes2 <- function(object2,place){
  ind <- which(object2==osm_df$Value)
  if(length(ind)>0){
    ind2 <- agrep("node",osm_df$Element[ind])
    if(length(ind2)>0){
      ind <- ind[ind2[1]]
      type_obj <- "node"
      object <- paste(osm_df$Key[ind],"=",object2,sep="")
      Link1 <- "http://www.overpass-api.de/api/interpreter?data=area[name~\""
      InfoList <- xmlParse(paste(Link1,place,"\"];",type_obj,"(area)[",object,"];out;",sep=""))
      return(InfoList)
    }else{
      ind2 <- agrep("way",osm_df$Element[ind])
      if(length(ind2)>0){stop("Try function get_osm_ways")
      }else{"Try function get_osm_relation"}
      
    }
    
  }else{stop("Map feature not found - have a look at http://wiki.openstreetmap.org/wiki/Map_Features")}
}




link <- "http://www.overpass-api.de/api/interpreter?data=(node(51.249,7.148,51.251,7.152);<;);out;"

ab <- xmlParse(link)


setwd("C:/Users/kolbjp/Documents/GitHub/GeoData/data")
queries <- readLines("overpassMapQueries.txt")

link1 <- paste("http://www.overpass-api.de/api/interpreter?data=",queries[i],sep="")
ab4 <- xmlParse(link1)

info <- extract_info_op(ab4,"bus_stop")


queries <- readLines("https://raw.githubusercontent.com/Japhilko/GeoData/master/data/overpassMapQueries.txt")


osm_o2 <- get_osm_nodes2("bus_stop","Mannheim")  


info2 <- extract_info_op(osm_o2,"bus_stop")




infoL <- list()
res <- vector()

setwd(data.path)
# i<-1
for (i in 1:length(objL)){
  obj <- objL[i]
  xml1 <- xmlParse(paste(place,"_",obj,".xml",sep=""))
  erg <- extract_info_op(OSM.Data=xml1,value=objL[i])
  infoL[[i]] <- erg
  res[i] <- ifelse(is.null(erg),0,nrow(infoL[[i]]))
}

meta <- data.frame(objL,nr=res)




