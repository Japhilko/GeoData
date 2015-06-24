get_osm_nodes <- function(object2,place){
  ind <- which(object2==osm_df$Value)
  if(length(ind)>0){
    type_obj <- "node"
    object <- paste(osm_df$Key[ind],"=",object2,sep="")
    Link1 <- "http://www.overpass-api.de/api/interpreter?data=area[name=\""
    InfoList <- xmlParse(paste(Link1,place,"\"];",type_obj,"(area)[",object,"];out;",sep=""))
    return(InfoList)
  }else{stop("Map feature not found")}
}
