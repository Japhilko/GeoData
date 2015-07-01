
# https://github.com/malexan/nominatim/blob/master/geocode.r
library(rjson)
require(XML)
library(stringr)

#' Nominatim
#'
#' geocodes a location using OpenStreetMap.
#'
#' @param output verbose level
#' @param messaging turn messaging on/off
#' @return depends (at least a data.frame with variables lon and lat)
#' @author Alexander Matrunich \email{alexander@@matrunich.com}
#' @details Based on David Kahle's geocode.R from ggmap
#' @seealso \url{http://wiki.openstreetmap.org/wiki/Nominatim}

geocode_osm <- function(place) {
  place <- str_replace_all(place, ' ', '+')
  place <- URLencode(place)
  url_string <- str_c('http://nominatim.openstreetmap.org/search?format=json&addressdetails=1&q=', place)
  con <- url(url_string)
  geoc <- fromJSON(paste(readLines(con,warn=F), collapse = ''))
  close(con)
  return(geoc)
}



geocode_osm(place="Mannheim B2,1")
