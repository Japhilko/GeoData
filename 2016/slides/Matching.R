## ----echo=F,warning=F----------------------------------------------------
library(knitr)
# data.path <- "J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/Folien/dataImport/data"
Ex2 <- F

## ----warning=F,message=F-------------------------------------------------
library("maptools")
data("wrld_simpl")

## ------------------------------------------------------------------------
df_ws <- data.frame(wrld_simpl@data)

## ------------------------------------------------------------------------
CNames <- wrld_simpl@data$NAME
head(CNames)

## ------------------------------------------------------------------------
CNames <- as.character(CNames)
head(CNames)

## ------------------------------------------------------------------------
CNames1 <- substr(CNames,1,1)
head(CNames1)

## ------------------------------------------------------------------------
CNames2 <- substr(CNames,1,2)
head(CNames2)

## ------------------------------------------------------------------------
CNames[CNames2=="An"]

## ----^,eval=F,echo=F-----------------------------------------------------
## link <- "https://raw.githubusercontent.com/Japhilko/GeoData/master/data/CO2emissions.csv"
## co2 <- read.csv(link)

## ------------------------------------------------------------------------
(load("data/CO2emissions.RData"))

## ----echo=F--------------------------------------------------------------
kable(co2[1:4,1:8])

## ------------------------------------------------------------------------
A <- c(1,2,3,4)
B <- c(4,3)
match(A,B)

## ------------------------------------------------------------------------
match(B,A)

## ------------------------------------------------------------------------
D <- c(1,3,5,6,7)
E <- c("A",1,98,4)
match(D,E)

## ------------------------------------------------------------------------
ind <- match(wrld_simpl@data$NAME,co2$Country)
ind

## ------------------------------------------------------------------------
wrld_simpl@data$co2_90 <- co2$j1990[ind]

## ------------------------------------------------------------------------
library(sp)
spplot(wrld_simpl,"co2_90")

## ------------------------------------------------------------------------
ind2 <- match(co2$Country,wrld_simpl@data$NAME)
fehlt <- co2$Country[is.na(ind2)]
fehlt

## ------------------------------------------------------------------------
fehlt[1]
ind3 <- agrep(fehlt[1],wrld_simpl@data$NAME)
ind3

## ------------------------------------------------------------------------
wrld_simpl@data$NAME[ind3]

## ------------------------------------------------------------------------
Namen_ws <- as.character(wrld_simpl@data$NAME)
Namen_co2 <- as.character(co2$Country)
for (i in 1:length(ind)){
  if(is.na(ind[i])){
    ind4 <- agrep(Namen_ws[i],Namen_co2)
    if(length(ind4)==1){
      ind[i] <- ind4
    }
  }
}

## ------------------------------------------------------------------------
wrld_simpl@data$co2_91 <- co2$j1991[ind]

## ------------------------------------------------------------------------
spplot(wrld_simpl,"co2_91")

## ----echo=F,eval=Ex2-----------------------------------------------------
setwd("J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/Folien/dataImport/data/")

## ----eval=Ex2------------------------------------------------------------
library(xlsx)
HHsr <- read.xlsx2("HHsavingRate.xls",1)

## ----echo=F,eval=Ex2-----------------------------------------------------
kable(HHsr[1:6,1:4])

## ------------------------------------------------------------------------
EUR <- wrld_simpl[wrld_simpl$REGION==150,]
plot(EUR)

## ------------------------------------------------------------------------
EUR <- EUR[-which(EUR@data$NAME=="Russia"),]
plot(EUR)

## ----eval=Ex2------------------------------------------------------------
as.character(HHsr[5:10,1])

## ------------------------------------------------------------------------
EUR_Names <- as.character(EUR@data$NAME)
head(EUR_Names)

## ----eval=Ex2------------------------------------------------------------
ind <- match(EUR_Names,HHsr[,1])
head(ind)
table(is.na(ind))

## ----eval=Ex2------------------------------------------------------------
EUR@data$HHsr <- as.numeric(as.character(HHsr[ind,2]))

## ----eval=Ex2------------------------------------------------------------
# Plot the map:
library(sp)
spplot(EUR,"HHsr")

