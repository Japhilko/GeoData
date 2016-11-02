#' function nodes4boundaries
#'
#' @param object A map feature
#' @param boundary A series of coordinates
#'
#' @description Get OSM nodes within a given boundary
#' @author Jan-Philipp Kolb <Jan-Philipp_Kolb@gmx.net>
#' @examples
#' \dontrun{
#' objectI <- "leisure=playground"
#' boundaryI <- "50.5,7.1,50.7,7.2"
#' osm_obj <- nodes4boundaries(objectI,boundaryI)
#' }
#' @return XML document with OpenStreetMap objects within the given boundary
#' @references \url{http://wiki.openstreetmap.org/wiki/Overpass_API}
#' @seealso \code{\link{extract_osm_nodes}}
#' @importFrom XML xmlParse
#' @export
nodes4boundaries <- function(object,boundary){
  Link1 <- "http://www.overpass-api.de/api/interpreter?data="
  InfoList <- xmlParse(paste0(Link1,"node[",object,"](",boundary,");out;"))
  return(InfoList)
}
