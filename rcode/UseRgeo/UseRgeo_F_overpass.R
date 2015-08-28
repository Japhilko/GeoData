


main.path <- "J:/Work/Statistik/Kolb/Paper/UseOSMdata/"
data.path <- paste(main.path,"data/XML/",sep="")


setwd(data.path)
HD <- xmlParse("Heidelberg_school.xml")

#-------------------------------#
# Libraries
#-------------------------------#

library(geosmdata2)
library(ggmap)

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

#-------------------------------#
# Prepare data
#-------------------------------#

place <- "Bamberg"
objL <- c("school","car_sharing","fuel","parking","bank","dentist",
          "restaurant","pub","fast_food","cafe","biergarten","bar",
          "playground","bakery")

setwd(data.path)

for (i in 1:length(objL)){
  osm_o <- get_osm_nodes(objL[i],place)  
  saveXML(osm_o,file=paste(place,"_",objL[i],".xml",sep=""))
}


info <- extract_info_op(osm_o,objL[i])


Imap13 <- qmap(location = place, zoom = 13, maptype="toner",source="stamen")


Imap13

#-------------------------------#
# Save data
#-------------------------------#







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




