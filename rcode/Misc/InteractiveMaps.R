# Jan-Philip  Kolb
# Sat Nov 07 12:45:55 2015
# Interactive maps

#---------------------------------------#
# Install/load libraries
#---------------------------------------#


install.packages("ggmap")
library(ggmap)

install.packages("magrittr")
library(magrittr)

install.packages("leaflet")
library(leaflet)

#---------------------------------------#
# Load data
#---------------------------------------#

url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/RefugeePlaces.csv"

Lfb_df <- read.csv(url)

#---------------------------------------#
# Map with ggmap
#---------------------------------------#


Europe <- qmap("Rom", zoom=3)

Europe + geom_point(aes(x = lon, y = lat),
                    data = Lfb_df)


#---------------------------------------#
# Interactive map
#---------------------------------------#

# create the interactive map
m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=Lfb_df$lon, 
             lat=Lfb_df$lat, 
             popup=Lfb_df$Description)

# call the map
m

#---------------------------------------#
# links
#---------------------------------------#


# https://rstudio.github.io/leaflet/
# http://www.r-bloggers.com/the-leaflet-package-for-online-mapping-in-r/
# http://blog.rstudio.org/2015/06/24/leaflet-interactive-web-maps-with-r/