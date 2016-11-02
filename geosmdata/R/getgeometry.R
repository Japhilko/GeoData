#' Download geometries from Openstreetmap
#'
#' @description Download geometries from Openstreetmap using the Nominatim API
#' @author Jan-Philipp Kolb <Jan-Philipp_Kolb@gmx.net>
#'
#' @references \url{http://wiki.openstreetmap.org/wiki/Nominatim}
#' @seealso \code{\link{extractpoly}}
#' @return XML document with polygon from OpenStreetMap for the given place
#' @param place Entity for which the geometry should be downloaded
#' @examples
#' \donttest{
#' MAseck <- getgeometry('Mannheim Seckenheim')
#' BE_geom <- getgeometry('Berlin')
#' }
#'
#' @importFrom maptools getKMLcoordinates
#' @importFrom stringr str_replace_all str_c
#' @export
getgeometry <- function(place){
  place <- str_replace_all(place, ' ', '+')
  place <- URLencode(place)
  url_string <- str_c('http://nominatim.openstreetmap.org/search?format=xml&polygon_kml=1&q=', place)
  con <- url(url_string)
  tkml2 <- getKMLcoordinates(kmlfile=con, ignoreAltitude=T)
  close(con)
  return(tkml2)
}

