
library(devtools)
install_github("Japhilko/GeoData/geosmdata2")
library(geosmdata2)

place <- "London"
objectI <- c("soccer")
object <- get_osm_nodes(objectI,place)
obj <- extract_info_op(object,objectI)

#---------------------------------------------------#

objectList <- c("pitch","soccer")
i<-1
objectI <- objectList[i]
object <- get_osm_nodes(objectI,place)
obj <- extract_info_op(object,objectI)


setwd(data.path)
saveXML(object,file=paste(place,"_",objectI,".xml",sep=""))



