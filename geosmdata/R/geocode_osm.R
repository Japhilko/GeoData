#' Function to do geocoding with OpenStreetmap
#'
#' @param place Place which should be geocoded
#' @param output Complete result or just the geocode
#' @description Returns info from \url{http://nominatim.openstreetmap.org/}
#' @author Jan-Philipp Kolb <Jan-Philipp_Kolb@gmx.net>
#' @references \url{https://github.com/malexan/nominatim/blob/master/geocode.r}
#' @examples
#' \dontrun{
#' geocode_osm(place="Mannheim B2,1")
#' geocode_osm(place="Berlin",output="all")
#' }
#' @importFrom stringr str_replace_all str_c
#' @importFrom RJSONIO fromJSON
#' @importFrom utils URLencode
#' @export
geocode_osm <- function(place,output=c("coord","all")){
  output <- match.arg(output)
  place <- str_replace_all(place, ' ', '+')
  place <- URLencode(place)
  url_string <- str_c('http://nominatim.openstreetmap.org/search?format=json&addressdetails=1&extratags=1&q=', place)
  con <- url(url_string)
  geoc <- fromJSON(paste(readLines(con,warn=F), collapse = ''))
  close(con)
  geoc1 <- geoc[[1]]
  geoc2 <- c(as.numeric(geoc1[which(names(geoc1)=="lat")]),as.numeric(geoc1[which(names(geoc1)=="lon")]))
  names(geoc2) <- c("lat","lon")
  if(output=="all"){return(geoc[[1]])}else{return(geoc2)}
  Sys.sleep(1) # http://wiki.openstreetmap.org/wiki/Nominatim_usage_policy
  # an absolute maximum of 1 request/s
}




