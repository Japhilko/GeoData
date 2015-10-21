CircSearch <- function(what,lat,lon,radius){
  ind <- which(what==osm_df$Value)

  if(length(ind)>0){
    ind2 <- agrep("node",osm_df$Element[ind])
    if(length(ind2)>0){
      ind <- ind[ind2[1]]

      object <- paste(osm_df$Key[ind],"=",what,sep="")
      Link1 <- "http://www.overpass-api.de/api/interpreter?data="
      expr <- paste("node(around:",radius,",",lat,",",lon,")[",object,"];out;",sep="")
      InfoList <- xmlParse(paste(Link1,expr,sep=""))
      return(InfoList)
    }
  }
}
