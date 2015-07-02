geocode_osm <- function(place) {
  place <- str_replace_all(place, ' ', '+')
  place <- URLencode(place)
  url_string <- str_c('http://nominatim.openstreetmap.org/search?format=json&addressdetails=1&q=', place)
  con <- url(url_string)
  geoc <- fromJSON(paste(readLines(con,warn=F), collapse = ''))
  close(con)
  return(geoc)
}




