# Jan-Philipp Kolb
# Spatial Visualisations
# Tue Oct 27 13:51:55 2015


## ----cache=T-------------------------------------------------------------
url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/whcSites.csv"

whcSites <- read.csv(url) 

## ------------------------------------------------------------------------
library(magrittr)

## ------------------------------------------------------------------------
library(leaflet)

## ----eval=internet-------------------------------------------------------
m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=whcSites$lon, 
             lat=whcSites$lat, 
             popup=whcSites$name_en)

## ------------------------------------------------------------------------
whcSites$color <- "red"
whcSites$color[whcSites$category=="Cultural"] <- "blue"
whcSites$color[whcSites$category=="Mixed"] <- "orange"

## ----eval=internet-------------------------------------------------------
m1 <- leaflet() %>%
  addTiles() %>%  
  addCircles(lng=whcSites$lon, 
             lat=whcSites$lat, 
             popup=whcSites$name_en,
             color=whcSites$color)

