# Jan-Philipp Kolb
# Wed Nov 11 16:16:50 2015


## ------------------------------------------------------------------------

url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/CampSites_Germany.csv"
CampSites <- read.csv(url)

## ------------------------------------------------------------------------
CampSites[1:8,1:4]

## ----Get map of Germany,message=F,warning=F------------------------------
library(raster)
DEU1 <- getData('GADM', country='DEU', level=1)
plot(DEU1)

## ----plot Campsites------------------------------------------------------
plot(DEU1)
points(y=CampSites$lat,x=CampSites$lon,col="red",pch=20)

## ------------------------------------------------------------------------
plot(DEU1)
points(y=CampSites$lat,x=CampSites$lon,col=rgb(0,1,0,.2),
       pch=20)

## ----message=F,warning=F-------------------------------------------------
library(ggmap)
DE_Map <- qmap("Germany", zoom=6, maptype="hybrid")
DE_Map

## ----warning=F-----------------------------------------------------------
DE_Map + geom_point(aes(x = lon, y = lat),
                    data = CampSites)

## ------------------------------------------------------------------------
DE_Map + geom_density2d(data = CampSites,                  aes(x = lon, y = lat),lwd=1.5)

## ------------------------------------------------------------------------
DE_Map + stat_density2d(data = CampSites, 
aes(x = lon, y = lat,fill = ..level..), bins = 100, 
geom = 'polygon')

## ------------------------------------------------------------------------
DE_Map + stat_density2d(data=CampSites, 
                        aes(x=lon,y=lat,fill=..level..,
alpha = ..level..),bins=80,geom='polygon')

## ----warning=F,message=F,eval=F------------------------------------------
 library(magrittr)
 library(leaflet)

## ----eval=F--------------------------------------------------------------
 m <- leaflet() %>%
   addTiles() %>%
   addMarkers(lng=CampSites$lon,
              lat=CampSites$lat,
              popup=CampSites$name)
 m

## ------------------------------------------------------------------------
popupInfo <- paste(CampSites$name,"\n",CampSites$website)

## ----eval=F--------------------------------------------------------------
 m <- leaflet() %>%
   addTiles() %>%  # Add default OpenStreetMap map tiles
   addMarkers(lng=CampSites$lon,
              lat=CampSites$lat,
              popup=popupInfo)
 m

## ------------------------------------------------------------------------
url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/whcSites.csv"
UNESCO <- read.csv(url)

## ----echo=F--------------------------------------------------------------
UNESCO[1:4,c("name_en","latitude","longitude")]

## ----cache=T,message=F---------------------------------------------------
library(ggmap)
ind <- UNESCO$states_name_en=="Germany"
UNESCO_DE <- UNESCO[ind,]

## ----message=F-----------------------------------------------------------
library(ggplot2)
DE_Map + geom_point(aes(x = longitude, y = latitude),
                    data = UNESCO_DE)

## ------------------------------------------------------------------------
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

## ------------------------------------------------------------------------
library(gridExtra)
grid.arrange(Csites, Nsites, ncol=2)

## ------------------------------------------------------------------------
url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/Unemployment07a13.csv"

Unemp <- read.csv(url) 

## ----warning=F,echo=F----------------------------------------------------
Unemp[1:8,c(2,3,4)]

## ----warning=F-----------------------------------------------------------
library(tmap)
data(Europe)

## ------------------------------------------------------------------------
iso_a2<- substr(Europe@data$iso_a3,1,2)
ind <- match(iso_a2,Unemp$GEO)
Europe@data$Val2007M12 <- Unemp$Val2007M12[ind]
Europe@data$Val2013M01 <- Unemp$Val2013M01[ind]

## ------------------------------------------------------------------------
qtm(Europe,c("Val2007M12","Val2013M01"))

## ------------------------------------------------------------------------
Students <- c(100, 200,30)
pie(Students)

## ------------------------------------------------------------------------
pdf("pie_Students.pdf")
pie(Students)
dev.off()

