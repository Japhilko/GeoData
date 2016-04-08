# Nutzung von GeoDaten in den Sozialwissenschaften
# Slides H2 - Interaktive Karten
# Jan-Philipp Kolb
# Fri Apr 08 07:50:07 2016


## ----echo=F--------------------------------------------------------------
url <- "https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/data/CampSites_Germany.csv"

## ----eval=F--------------------------------------------------------------
url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/CampSites_Germany.csv"

## ------------------------------------------------------------------------
CampSites <- read.csv(url)

## ----echo=F--------------------------------------------------------------
kable(CampSites[1:8,1:4])

## ----Get map of Germany,message=F,warning=F,eval=F-----------------------
library(raster)
DEU1 <- getData('GADM', country='DEU', level=1)

## ----eval=F,echo=F-------------------------------------------------------
setwd("C:/Users/kolbjp/Documents/GitHub/GeoData/2016/slides/data")
save(DEU1,file="DEU1.RData")

## ----echo=F--------------------------------------------------------------
load("data/DEU1.RData")

## ----message=F-----------------------------------------------------------
library(maptools)
plot(DEU1)

## ----plot Campsites,eval=Ex----------------------------------------------
plot(DEU1)
points(y=CampSites$lat,x=CampSites$lon,
       col="red",pch=20)

## ----eval=Ex-------------------------------------------------------------
plot(DEU1)
points(y=CampSites$lat,x=CampSites$lon,col=rgb(0,1,0,.2),
       pch=20)

## ----message=F,warning=F,eval=Ex-----------------------------------------
library(ggmap)
DE_Map <- qmap("Germany", zoom=6, maptype="hybrid")
DE_Map

## ----warning=F,eval=Ex---------------------------------------------------
DE_Map + geom_point(aes(x = lon, y = lat),
                    data = CampSites)

## ----eval=Ex-------------------------------------------------------------
DE_Map + geom_density2d(data = CampSites,                  aes(x = lon, y = lat),lwd=1.5)

## ----eval=Ex-------------------------------------------------------------
DE_Map + stat_density2d(data = CampSites, 
aes(x = lon, y = lat,fill = ..level..), bins = 100, 
geom = 'polygon')

## ----eval=Ex-------------------------------------------------------------
DE_Map + stat_density2d(data=CampSites, 
                        aes(x=lon,y=lat,fill=..level..,
alpha = ..level..),bins=80,geom='polygon')

## ----warning=F-----------------------------------------------------------
library("magrittr")

## ----warning=F-----------------------------------------------------------
library("leaflet")

## ----eval=F--------------------------------------------------------------
m <- leaflet() %>%
 addTiles() %>%
   addMarkers(lng=CampSites$lon,
              lat=CampSites$lat,
              popup=CampSites$name)
 m

## ----eval=F--------------------------------------------------------------
popupInfo <- paste(CampSites$name,"\n",CampSites$website)

## ----eval=F--------------------------------------------------------------
 m <- leaflet() %>%
   addTiles() %>%  # Add default OpenStreetMap map tiles
   addMarkers(lng=CampSites$lon,
              lat=CampSites$lat,
              popup=popupInfo)
 m

## ----cache=T-------------------------------------------------------------
url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/whcSites.csv"

whcSites <- read.csv(url) 

## ----eval=internet-------------------------------------------------------
m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=whcSites$lon, 
             lat=whcSites$lat, 
             popup=whcSites$name_en)
m

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
m1

## ------------------------------------------------------------------------
url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/whcSites.csv"
UNESCO <- read.csv(url)

## ----echo=F--------------------------------------------------------------
kable(UNESCO[1:4,c("name_en","latitude","longitude")])

## ----cache=T,message=F---------------------------------------------------
library(ggmap)
ind <- UNESCO$states_name_en=="Germany"
UNESCO_DE <- UNESCO[ind,]

## ----message=F,eval=Ex---------------------------------------------------
library(ggplot2)
DE_Map + geom_point(aes(x = longitude, y = latitude),
                    data = UNESCO_DE)

## ----eval=Ex-------------------------------------------------------------
library(ggplot2)
DNunesco <- UNESCO_DE[UNESCO_DE$category=="Natural",]
DCunesco <- UNESCO_DE[UNESCO_DE$category=="Cultural",]

Csites <- DE_Map + geom_point(aes(x = longitude, 
                                  y = latitude),
                              data =DCunesco,
                              col="orange", size= 3)

Nsites <- DE_Map + geom_point(aes(x = longitude, 
                                  y = latitude),
                              data = DNunesco,
                              col="green", size= 3)

## ----eval=Ex-------------------------------------------------------------
library(gridExtra)
grid.arrange(Csites, Nsites, ncol=2)

