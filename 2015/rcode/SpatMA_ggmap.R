# Map Types with ggmap
# Jan-Philipp Kolb
# Wed Sep 16 09:42:16 2015

#--------------------------------#
# Install Libraries
#--------------------------------#

install.packages("ggmap")

#--------------------------------#
# Libraries
#--------------------------------#

library(ggmap)

#--------------------------------#
# A first map
#--------------------------------#

qmap("Mannheim")


## Map for a sight

qmap("Berlin Brandenburger Tor")

## Map for a whole country

qmap("Germany")

# change zoom level

qmap("Germany", zoom = 6)

# get help

?qmap

qmap("Mannheim", zoom = 12)

## ggmap - source OpenStreetMap

qmap('Mannheim', zoom = 14, source="osm")

## ggmap - OpenStreetMap - black/white

qmap('Mannheim', zoom = 14, source="osm",color="bw")


## ggmap - maptype satellite

qmap('Mannheim', zoom = 14, maptype="satellite")

## ggmap - maptype satellite zoom 21

qmap('Mannheim', zoom = 21, maptype="hybrid")

## ggmap - maptype hybrid

qmap("Mannheim", zoom = 14, maptype="hybrid")

## ggmap - terrain map

qmap('Schriesheim', zoom = 14, maptype="terrain")

## ggmap - maptype watercolor

qmap('Mannheim', zoom = 14, maptype="watercolor",source="stamen")

## ggmap - source stamen

qmap('Mannheim', zoom = 14, maptype="toner",source="stamen")

## ggmap - maptype toner-lite

qmap('Mannheim', zoom = 14, maptype="toner-lite",source="stamen")

## ggmap - maptype toner-hybrid

qmap('Mannheim', zoom = 14, maptype="toner-hybrid",source="stamen")

## ggmap - maptype terrain-lines

qmap('Mannheim', zoom = 14, maptype="terrain-lines",source="stamen")

## Create an object

MA_map <- qmap('Mannheim', 
               zoom = 14,
               maptype="toner",
               source="stamen")

## Geocoding

geocode("Mannheim Wasserturm",source="google")

## Reverse geocoding

revgeocode(c(48,8))

## Get the distance between 2 points

mapdist("Q1, 4 Mannheim","B2, 1 Mannheim")

## Get another distance

mapdist("Q1, 4 Mannheim","B2, 1 Mannheim",mode="bicycling")

## Geocoding - points of interest

POI1 <- geocode("B2, 1 Mannheim",source="google")
POI2 <- geocode("Hbf Mannheim",source="google")
POI3 <- geocode("Wasserturm Mannheim",source="google")
ListPOI <-rbind(POI1,POI2,POI3)
POI1;POI2;POI3

## Points in map

MA_map + geom_point(aes(x = lon, y = lat),
             data = ListPOI)

## Points in map

MA_map +
  geom_point(aes(x = lon, y = lat),col="red",
             data = ListPOI)

## ggmap - adding different colors

ListPOI$color <- c("A","B","C")
MA_map +
  geom_point(aes(x = lon, y = lat,col=color),
             data = ListPOI)

## ggmap - bigger dots

ListPOI$size <- c(10,20,30)
MA_map +
  geom_point(aes(x = lon, y = lat,col=color,size=size),
             data = ListPOI)


## Get a route from Google maps

from <- "Mannheim Hbf"
to <- "Mannheim B2 , 1"
route_df <- route(from, to, structure = "route")
route_df


qmap("Mannheim Hbf", zoom = 14) +
  geom_path(
    aes(x = lon, y = lat),  colour = "red", size = 1.5,
    data = route_df, lineend = "round"
  )
