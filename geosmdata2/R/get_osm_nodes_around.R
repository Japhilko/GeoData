
# [maxsize:1073741824][timeout:900];node(51.15,7.0,51.35,7.3);out;

get_osm_nodes_around <- function(place,radius=5){
  Link1 <- "http://www.overpass-api.de/api/interpreter?data=[maxsize:1073741824][timeout:900];node[name=\""
  InfoList <- xmlParse(paste(Link1,place,"\"];node(around:",radius,");out;",sep=""))
  return(InfoList)
}



# http://www.overpass-api.de/api/interpreter?data=area[name=\"Mannheim\"];node(around:5;out;
# http://www.overpass-api.de/api/interpreter?data=node%5B%22name%22%3D%22Mannheim%22%5D%3Bnode%28around%3A200%29%3Bout%3B
