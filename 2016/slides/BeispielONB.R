## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----echo=F,eval=F-------------------------------------------------------
## setwd("D:/GESIS/Workshops/GeoDaten/data")

## ----eval=F--------------------------------------------------------------
## library(maptools)
## onb <- readShapePoly("ONB_DTAG_DHDN_Gauss3d-3.shp")

## ----eval=F--------------------------------------------------------------
## par(mai=c(0,0,0,0))
## plot(onb)

## ----eval=F--------------------------------------------------------------
## vwb <- onb@data$ONB_NUMMER
## vwb1 <- substr(vwb, 1,1)

## ----eval=F--------------------------------------------------------------
## barchart(table(vwb1),col="royalblue",
##          xlab="Häufigkeit")

## ----eval=F--------------------------------------------------------------
## vwb6 <- onb[vwb1==6,]
## plot(vwb6)

## ----eval=F--------------------------------------------------------------
## vwb6c <- unionSpatialPolygons(vwb6,
##               rep(1,length(vwb6)))
## plot(vwb6c,col="royalblue")

