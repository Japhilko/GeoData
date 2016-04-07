# Nutzung von GeoDaten in den Sozialwissenschaften
# Slides D2 - Quellen für Polygone
# Jan-Philipp Kolb
# Thu Apr 07 07:55:06 2016

# hier muss der eigene Pfad angegeben werden Beispiel:
# setwd("C:/")

## ----eval=F--------------------------------------------------------------
library(xlsx)
HHsr <- read.xlsx2("HHsavingRate.xls",1)

## ----echo=F,eval=F-------------------------------------------------------
HHsr[1:4,1:6]

# hier muss der eigene Pfad angegeben werden Beispiel:
# setwd("C:/")

## ----echo=F,cache=T,eval=F-----------------------------------------------
load("whc.RData")

## ----echo=F,eval=F-------------------------------------------------------
whc2 <- whc[4:8,c("name_en","longitude","latitude","category_short")]
whc2$longitude <- round(whc2$longitude,2)
whc2$latitude <- round(whc2$latitude,2)

