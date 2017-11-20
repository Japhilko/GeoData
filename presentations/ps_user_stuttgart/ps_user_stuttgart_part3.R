## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,cache=T,warning=F,message=FALSE)
par(mai=c(0,0,0,0))
log_gesis=F
log_home=T

## ------------------------------------------------------------------------
library(knitr)

## ----echo=F,eval=F-------------------------------------------------------
## install.packages("sp")
## install.packages("tmap")

## ----echo=F,eval=log_home------------------------------------------------
setwd("~/GitHub/GeoData/presentations/ps_user_stuttgart")

## ----eval=F--------------------------------------------------------------
## setwd("D:/Daten/GitHub/GeoData/presentations/ps_user_stuttgart")
## purl("ps_user_stuttgart_part3.Rmd")

## ------------------------------------------------------------------------
library(maps)
map()

## ------------------------------------------------------------------------
map("world", "Germany")

## ------------------------------------------------------------------------
data(world.cities)
map("france")
map.cities(world.cities,col="blue")

## ------------------------------------------------------------------------
library(maptools)
data(wrld_simpl)
plot(wrld_simpl,col="royalblue")

## ------------------------------------------------------------------------
library(sp)
spplot(wrld_simpl,"POP2005")

## ----warning=F-----------------------------------------------------------
library(raster)
LUX1 <- getData('GADM', country='LUX', level=1)
plot(LUX1)

## ------------------------------------------------------------------------
kable(head(LUX1@data[,1:6]))

## ----eval=F--------------------------------------------------------------
## library(maptools)
## krs <- readShapePoly("vg250_ebenen/vg250_krs.shp")
## plot(krs)

## ----echo=F,eval=log_gesis-----------------------------------------------
## setwd("D:/Daten/Daten/GeoDaten/")

## ----eval=F,echo=F-------------------------------------------------------
## install.packages("maptools")

## ----eval=log_gesis,echo=F-----------------------------------------------
## library(maptools)
## setwd("D:/Daten/Daten/GeoDaten/")
## 
## onb <- readShapePoly("onb_grenzen.shp")
## kable(head(onb@data))

## ----eval=F--------------------------------------------------------------
## onb <- readShapePoly("onb_grenzen.shp")
## kable(head(onb@data))

## ----eval=log_gesis,tidy=T-----------------------------------------------
## vw_stg<-c("0711","07121","07122")
## vw_reg_stg<-onb[onb@data$VORWAHL%in%vw_stg,]
## plot(vw_reg_stg)

## ----eval=log_gesis------------------------------------------------------
## vwb <- as.character(onb@data$ONB_NUMMER)
## vwb1 <- substr(vwb, 1,2)
## vwb7 <- onb[vwb1=="07",]
## plot(vwb7)

## ------------------------------------------------------------------------
library(rgdal)

## ----eval=log_gesis,echo=F-----------------------------------------------
## setwd("D:/Daten/Daten/GeoDaten")
## PLZ <- readOGR ("post_pl.shp","post_pl")

## ----eval=log_home-------------------------------------------------------
setwd("D:/GESIS/Workshops/GeoDaten/data/")
PLZ <- readOGR ("post_pl.shp","post_pl")

## ----eval=F--------------------------------------------------------------
## library(rgdal)
## PLZ <- readOGR ("post_pl.shp","post_pl")

## ------------------------------------------------------------------------
SG <- PLZ[PLZ@data$PLZORT99=="Stuttgart",]
plot(SG,col="chocolate1")

## ------------------------------------------------------------------------
BE <- PLZ[PLZ@data$PLZORT99%in%c("Berlin-West","Berlin (östl. Stadtbezirke)"),]
plot(BE,col="chocolate2")

## ----eval=T,echo=T-------------------------------------------------------
(load("data/info_bar_Berlin.RData"))

## ----echo=F--------------------------------------------------------------
info_be <- info[,c("addr.postcode","addr.street","name","lat","lon")]

## ----echo=F--------------------------------------------------------------
kable(head(info_be))

## ------------------------------------------------------------------------
tab_plz <- table(info_be$addr.postcode)

## ------------------------------------------------------------------------
ind <- match(BE@data$PLZ99_N,names(tab_plz))
ind

## ------------------------------------------------------------------------
BE@data$num_plz <- tab_plz[ind]

## ----eval=F,echo=F-------------------------------------------------------
## install.packages("colorRamps")
## install.packages("XML")
## install.packages("geosphere")
## install.packages("tmap")
## install.packages("curl")
## install.packages("R.oo")

## ------------------------------------------------------------------------
library(tmap)

## ------------------------------------------------------------------------
BE@data$num_plz[is.na(BE@data$num_plz)] <- 0
qtm(BE,fill = "num_plz")

## ------------------------------------------------------------------------
load("data/osmsa_PLZ_14.RData")

## ----echo=F--------------------------------------------------------------
dat_plz <- PLZ@data
kable(head(dat_plz))

## ----echo=F--------------------------------------------------------------
PLZ_SG <- PLZ[PLZ@data$PLZORT99=="Stuttgart",]

## ------------------------------------------------------------------------
qtm(PLZ_SG,fill="bakery")

## ------------------------------------------------------------------------
kable(PLZ_SG@data[which.max(PLZ_SG$bakery),c("PLZ99","lat","lon","bakery")])

## ----ggmap_citycenter----------------------------------------------------
library(ggmap)
lon_plz <- PLZ_SG@data[which.max(PLZ_SG$bakery),"lon"]
lat_plz <- PLZ_SG@data[which.max(PLZ_SG$bakery),"lat"]
mp_plz <- as.numeric(c(lon_plz,lat_plz))
qmap(location = mp_plz,zoom=15)

## ----eval=F,echo=F-------------------------------------------------------
## install.packages("RDSTK")

## ------------------------------------------------------------------------
library("RDSTK")

## ------------------------------------------------------------------------
PLZ_SG <- PLZ[PLZ@data$PLZORT99=="Stuttgart",]

## ----echo=F--------------------------------------------------------------
tab_landcover <- table(PLZ_SG$land_cover.value)
df_landcover <- data.frame(tab_landcover)
colnames(df_landcover)[1] <- c("Type_landcover")
kable(df_landcover)

## ------------------------------------------------------------------------
qtm(PLZ_SG,fill="land_cover.value")

## ------------------------------------------------------------------------
qtm(PLZ_SG,fill="elevation.value")

## ------------------------------------------------------------------------
library(osmar) 

## ----eval=F--------------------------------------------------------------
## src <- osmsource_api()
## gc <- geocode("Stuttgart-Degerloch")
## bb <- center_bbox(gc$lon, gc$lat, 800, 800)
## ua <- get_osm(bb, source = src)
## plot(ua)

