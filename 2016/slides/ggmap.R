## ----echo=F,warning=F----------------------------------------------------
internet=F
Ex <- T
Ca <- T
library(knitr)

graph.path <- "../data/figure/"

## ----eval=F--------------------------------------------------------------
## install.packages("ggmap")

## ----message=F,warning=F-------------------------------------------------
library(ggmap)

## ----message=F,eval=Ex,cache=Ca------------------------------------------
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

## ----message=F,eval=Ex,cache=Ca------------------------------------------
qmap("Mannheim", zoom = 12)

## ----message=F,eval=Ex,cache=Ca------------------------------------------
qmap('Mannheim', zoom = 13)

## ----message=F,eval=Ex,cache=Ca------------------------------------------
qmap('Mannheim', zoom = 20)

## ----message=F,eval=Ex,cache=Ca------------------------------------------
qmap('Mannheim', zoom = 14, source="osm")

## ----message=F,eval=Ex,cache=Ca------------------------------------------
qmap('Mannheim', zoom = 14, source="osm",color="bw")

## ----message=F,eval=Ex,cache=Ca------------------------------------------
qmap('Mannheim', zoom = 14, maptype="satellite")

## ----message=F,eval=Ex,cache=Ca------------------------------------------
qmap('Mannheim', zoom = 20, maptype="hybrid")

## ----message=F,eval=Ex,cache=Ca------------------------------------------
qmap("Mannheim", zoom = 14, maptype="hybrid")

## ----message=F,cache=T---------------------------------------------------
qmap('Schriesheim', zoom = 14,
 maptype="terrain")

## ----message=F,eval=Ex,cache=Ca------------------------------------------
qmap('Mannheim', zoom = 14,
 maptype="watercolor",source="stamen")

## ----message=F,eval=Ex,cache=Ca------------------------------------------
qmap('Mannheim', zoom = 14,
 maptype="toner",source="stamen")

## ----message=F,eval=Ex,cache=Ca------------------------------------------
qmap('Mannheim', zoom = 14,
 maptype="toner-lite",source="stamen")

## ----message=F,eval=Ex,cache=Ca------------------------------------------
qmap('Mannheim', zoom = 14,
 maptype="toner-hybrid",source="stamen")

## ----message=F,eval=Ex,cache=Ca------------------------------------------
qmap('Mannheim', zoom = 14,
 maptype="terrain-lines",source="stamen")

## ----warning=F,message=F,cache=T-----------------------------------------
MA_map <- qmap('Mannheim', 
               zoom = 14,
               maptype="toner",
               source="stamen")

## ----message=F,eval=F,warning=F------------------------------------------
## library(ggmap)
## geocode("Mannheim Wasserturm",source="google")

## ----echo=F,message=F,warning=F,cache=Ca---------------------------------
MAgc <- geocode("Mannheim University",source="google")
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

## ----message=F,eval=Ex,cache=Ca------------------------------------------
mapdist("Q1, 4 Mannheim","B2, 1 Mannheim")

## ----message=F,eval=Ex,cache=Ca------------------------------------------
mapdist("Q1, 4 Mannheim","B2, 1 Mannheim",mode="walking")

## ----message=F,eval=Ex,cache=Ca------------------------------------------
mapdist("Q1, 4 Mannheim","B2, 1 Mannheim",mode="bicycling")

## ----cache=Ca,message=F,warning=F----------------------------------------
POI1 <- geocode("B2, 1 Mannheim",source="google")
POI2 <- geocode("Hbf Mannheim",source="google")
POI3 <- geocode("Wasserturm Mannheim",source="google")
ListPOI <-rbind(POI1,POI2,POI3)
POI1;POI2;POI3

## ----message=F,warning=F,eval=Ex,cache=Ca--------------------------------
MA_map +
geom_point(aes(x = lon, y = lat),
data = ListPOI)

## ----message=F,warning=F,eval=Ex,cache=Ca--------------------------------
MA_map +
geom_point(aes(x = lon, y = lat),col="red",
data = ListPOI)

## ----eval=Ex,cache=Ca----------------------------------------------------
ListPOI$color <- c("A","B","C")
MA_map +
geom_point(aes(x = lon, y = lat,col=color),
data = ListPOI)

## ----eval=Ex,cache=Ca----------------------------------------------------
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

