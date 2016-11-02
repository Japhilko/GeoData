#' Function to extract polygons
#'
#' @description Extract sp objects from XML data
#' @param geosm_obj An XML object downloaded from OpenStreetMap
#' @param place The place for which the XML information was downloaded
#' @author Jan-Philipp Kolb <Jan-Philipp_Kolb@gmx.net>
#' @return A sp object
#' @references \url{https://www.nceas.ucsb.edu/scicomp/usecases/shapeFileToKML}
#' @examples
#' \dontrun{
#' BE_geom <- getgeometry('Berlin')
#' spobject <- extractpoly(BE_geom,'Berlin')
#' }
#' @importFrom sp Polygon Polygons SpatialPolygons
#' @export

extractpoly <- function(geosm_obj,place){
  info <- vector()
  for (i in 1:length(geosm_obj)){
    a <- nrow(geosm_obj[[i]])
    if(!is.null(a)){info[i] <- a}
  }
  ind <- which.max(info)
  P1 <- Polygon(geosm_obj[[ind]])
  Ps1 <- Polygons(list(P1), ID = place)
  SPs <- SpatialPolygons(list(Ps1))
  return(SPs)
}
