# Jan-Philipp Kolb
# Fri Nov 13 19:22:07 2015

library(magrittr)
library(leaflet)

#---------------------------------------------#
# load data
#---------------------------------------------#


url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/RefugeePlaces.csv"
Refugees <- read.csv(url)

#---------------------------------------------#
# Interactive map
#---------------------------------------------#


content <- paste(sep = "<br/>",
                 "<b><a href='",Refugees$Link,"'>",
                 Refugees$Place,"</a></b>",
                 Refugees$description,
                 Refugees$direction)

m2 <- leaflet() %>%
  addTiles() %>%
  addMarkers(lng=Refugees$lon,
             lat=Refugees$lat,
             popup=content)

m2

#---------------------------------------------#
# Interactive map
#---------------------------------------------#


# https://rstudio.github.io/leaflet/popups.html
