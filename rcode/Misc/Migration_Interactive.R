# Jan-Philipp Kolb
# Fri Nov 13 19:22:07 2015

library(magrittr)
library(leaflet)


url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/RefugeePlaces.csv"
Places <- read.csv(url)

m <- leaflet() %>%
  addTiles() %>%
  addMarkers(lng=Places$lon,
             lat=Places$lat,
             popup=Places$name)
m


content <- paste(sep = "<br/>","<b><a href='",Places$Link,"'>",Places$Place,"</a></b>")


m <- leaflet() %>%
  addTiles() %>%
  addMarkers(lng=Places$lon,
             lat=Places$lat,
             popup=content)
m
