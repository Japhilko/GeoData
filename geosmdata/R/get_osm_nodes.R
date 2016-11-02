#' Function get_osm_nodes
#'
#' @author Jan-Philipp Kolb <Jan-Philipp_Kolb@gmx.net>
#' @description Extract objects from Openstreetmap using the Overpass API
#' @param object A key-value combination for a node, valid combinations can be seen here: \url{http://wiki.openstreetmap.org/wiki/Map_Features}
#' @param place Place for the map features
#' @seealso \code{\link{extract_osm_nodes}}
#' @references \url{http://wiki.openstreetmap.org/wiki/Map_Features}
#' @examples
#' \donttest{pg_MA <- get_osm_nodes(object="leisure=playground","Mannheim")}
#' @return XML document with information for the nodes downloaded from OpenStreetMap for the given place
#' @importFrom XML xmlParse
#' @export
get_osm_nodes <- function(object,place){
  Link1 <- "http://www.overpass-api.de/api/interpreter?data=[maxsize:1073741824][timeout:900];area[name=\""
  InfoList <- xmlParse(paste(Link1,place,"\"];node(area)[",object,"];out;",sep=""))
  return(InfoList)
}

