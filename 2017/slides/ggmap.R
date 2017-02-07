## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,message=F,warning=F,cache=T)

## ----echo=F,warning=F----------------------------------------------------
library(knitr)

## ----eval=F--------------------------------------------------------------
## devtools::install_github("dkahle/ggmap")
## devtools::install_github("hadley/ggplot2")
## install.packages("ggmap")

## ----message=F,warning=F-------------------------------------------------
library(ggmap)

## ----message=F,eval=T----------------------------------------------------
qmap("Mannheim")

## ----echo=F,message=F,warning=F,cache=T----------------------------------
MA_map <- qmap("Mannheim")

## ----message=F-----------------------------------------------------------
BBT <- qmap("Berlin Brandenburger Tor")
BBT

## ----message=F-----------------------------------------------------------
qmap("Germany")

## ----message=F-----------------------------------------------------------
qmap("Germany", zoom = 6)

## ----echo=F--------------------------------------------------------------
# https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/ggmap/ggmapCheatsheet.pdf

## ----eval=F--------------------------------------------------------------
## ?qmap

## ----eval=F--------------------------------------------------------------
## # qmap("baylor university")
## qmap("baylor university", zoom = 14)
## # und so weiter

## ----message=F-----------------------------------------------------------
qmap("Mannheim", zoom = 12)

## ----message=F-----------------------------------------------------------
qmap('Mannheim', zoom = 13)

## ----message=F-----------------------------------------------------------
qmap('Mannheim', zoom = 20)

## ----message=F-----------------------------------------------------------
qmap('Mannheim', zoom = 14, maptype="satellite")

## ----message=F-----------------------------------------------------------
qmap('Mannheim', zoom = 20, maptype="hybrid")

## ----message=F-----------------------------------------------------------
qmap("Mannheim", zoom = 14, maptype="hybrid")

## ----message=F,cache=T---------------------------------------------------
qmap('Schriesheim', zoom = 14,
 maptype="terrain")

## ----message=F-----------------------------------------------------------
qmap('Mannheim', zoom = 14,
 maptype="watercolor",source="stamen")

## ----message=F-----------------------------------------------------------
qmap('Mannheim', zoom = 14,
 maptype="toner",source="stamen")

## ----message=F-----------------------------------------------------------
qmap('Mannheim', zoom = 14,
 maptype="toner-lite",source="stamen")

## ----message=F-----------------------------------------------------------
qmap('Mannheim', zoom = 14,
 maptype="toner-hybrid",source="stamen")

## ----message=F-----------------------------------------------------------
qmap('Mannheim', zoom = 14,
 maptype="terrain-lines",source="stamen")

## ----warning=F,message=F-------------------------------------------------
MA_map <- qmap('Mannheim', 
               zoom = 14,
               maptype="toner",
               source="stamen")

## ----message=F,eval=F,warning=F------------------------------------------
## library(ggmap)
## geocode("Mannheim",source="google")

## ----echo=F,message=F,warning=F------------------------------------------
MAgc <- geocode("Mannheim B2,5",source="google")
kable(MAgc)

## ----echo=F,message=F----------------------------------------------------
cities <- c("Hamburg","Koeln","Dresden","Muenchen")
lon <- vector()
lat <- vector()
for (i in 1:length(cities)){
  gc <- geocode(cities[i],source="google")
  lon[i] <- gc$lon
  lat[i] <- gc$lat
}

Dat <- data.frame(cities,lon,lat)
kable(Dat)

## ----cache=T,message=F---------------------------------------------------
revgeocode(c(48,8))

## ----message=F-----------------------------------------------------------
mapdist("Q1, 4 Mannheim","B2, 1 Mannheim")

## ----message=F-----------------------------------------------------------
mapdist("Q1, 4 Mannheim","B2, 1 Mannheim",mode="walking")

## ----message=F-----------------------------------------------------------
mapdist("Q1, 4 Mannheim","B2, 1 Mannheim",mode="bicycling")

## ----message=F,warning=F-------------------------------------------------
POI1 <- geocode("B2, 1 Mannheim",source="google")
POI2 <- geocode("Hbf Mannheim",source="google")
POI3 <- geocode("Mannheim, Friedrichsplatz",source="google")
ListPOI <-rbind(POI1,POI2,POI3)
POI1;POI2;POI3

## ----message=F,warning=F-------------------------------------------------
MA_map +
geom_point(aes(x = lon, y = lat),
data = ListPOI)

## ----message=F,warning=F-------------------------------------------------
MA_map +
geom_point(aes(x = lon, y = lat),col="red",
data = ListPOI)

## ------------------------------------------------------------------------
ListPOI$color <- c("A","B","C")
MA_map +
geom_point(aes(x = lon, y = lat,col=color),
data = ListPOI)

## ------------------------------------------------------------------------
ListPOI$size <- c(10,20,30)
MA_map +
geom_point(aes(x = lon, y = lat,col=color,size=size),
data = ListPOI)

## ----message=F,warning=F,cache=T-----------------------------------------
from <- "Mannheim Hbf"
to <- "Mannheim B2 , 1"
route_df <- route(from, to, structure = "route")

## ----message=F,warning=F,cache=T-----------------------------------------
qmap("Mannheim Hbf", zoom = 14) +
  geom_path(
    aes(x = lon, y = lat),  colour = "red", size = 1.5,
    data = route_df, lineend = "round"
  )

