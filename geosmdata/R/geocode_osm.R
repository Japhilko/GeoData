geocode_osm <- function(place,output=c("coord","all")){
  output <- match.arg(output)
  place <- str_replace_all(place, ' ', '+')
  place <- URLencode(place)
  url_string <- str_c('http://nominatim.openstreetmap.org/search?format=json&addressdetails=1&q=', place)
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




