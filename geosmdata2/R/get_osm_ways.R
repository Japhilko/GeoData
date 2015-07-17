get_osm_ways <- function(object2,place){
  ind <- which(object2==osm_df$Value)
  if(length(ind)>0){
    ind2 <- agrep("way",osm_df$Element[ind])
    if(length(ind2)>0){
      ind <- ind[ind2[1]]
      type_obj <- "way"
      object <- paste(osm_df$Key[ind],"=",object2,sep="")
      Link1 <- "http://www.overpass-api.de/api/interpreter?data=area[name=\""
      InfoList <- xmlParse(paste(Link1,place,"\"];",type_obj,"(area)[",object,"];out geom;",sep=""))
      return(InfoList)
    }else{
      ind2 <- agrep("node",osm_df$Element[ind])
      if(length(ind2)>0){stop("Try function get_osm_nodes")
      }else{"Try function get_osm_relation"}

    }

  }else{stop("Map feature not found - have a look at http://wiki.openstreetmap.org/wiki/Map_Features")}
}
