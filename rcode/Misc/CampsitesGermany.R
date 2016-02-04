
setwd("C:/Forschung/GeoData/data")

url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/CampSites_Germany.csv"
CampSites <- read.csv(url)

library(magrittr)
library(leaflet)

## ----eval=F--------------------------------------------------------------
m <- leaflet() %>%
  addTiles() %>%
  addMarkers(lng=CampSites$lon,
             lat=CampSites$lat,
             popup=CampSites$name)
m


# https://en.support.wordpress.com/code/posting-source-code/
# https://nsaunders.wordpress.com/2011/05/20/syntax-highlighting-of-r-code-at-wordpress-com/

# https://github.com/Vizzuality/cartodb-r

# https://rpubs.com/walkerke/r2cartodb

# https://cran.r-project.org/web/packages/mapmisc/vignettes/mapLayers.pdf

#https://cartodb.com/gallery/ 