get_osm_nodes <- function(object,place){
  Link1 <- "http://www.overpass-api.de/api/interpreter?data=[maxsize:1073741824][timeout:900];area[name=\""
  InfoList <- xmlParse(paste(Link1,place,"\"];node(area)[",object,"];out;",sep=""))
  return(InfoList)  
}

