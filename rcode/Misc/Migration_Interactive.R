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

#-------------------------------------#
# Add shapes to a map
#-------------------------------------#

library(rgdal)

library(raster)
DEU2 <- getData('GADM', country='DEU', level=2)
plot(DEU2)

DEU2@data$value <- runif(nrow(DEU2))

m2 <- leaflet() %>%
  addTiles() %>%
  addPolygons(DEU2,
    stroke = FALSE, fillOpacity = 0.5, smoothFactor = 0.5,
    color = ~colorQuantile("YlOrRd", DEU2$value)
  )
m2

# http://robinlovelace.net/r/2015/02/01/leaflet-r-package.html
  