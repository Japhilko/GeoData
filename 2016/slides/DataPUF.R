## ----echo=F,warning=F----------------------------------------------------
library(knitr)
ca=F
Ex=F

## ----echo=F,eval=F-------------------------------------------------------
## setwd("J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/Folien/dataImport/data/")

## ----eval=F--------------------------------------------------------------
## library(xlsx)
## HHsr <- read.xlsx2("HHsavingRate.xls",1)

## ----echo=F,eval=F-------------------------------------------------------
## kable(HHsr[1:4,1:6])

## ----eval=F,echo=F-------------------------------------------------------
## setwd("J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/Folien/dataImport/data")

## ----echo=F,cache=T,eval=F-----------------------------------------------
## load("whc.RData")

## ----echo=F,eval=F-------------------------------------------------------
## whc2 <- whc[4:8,c("name_en","longitude","latitude","category_short")]
## whc2$longitude <- round(whc2$longitude,2)
## whc2$latitude <- round(whc2$latitude,2)
## kable(whc2)

