# Spatial Visualisations
# Package spplot
# Jan-Philipp Kolb 
# Tue Oct 13 09:24:12 2015


## ----message=F,cache=ca,warning=F----------------------------------------
library(sp)

## ----message=F,cache=ca,warning=F----------------------------------------
library(maptools)
data("wrld_simpl")
ISO2codes <- wrld_simpl@data$ISO2
countries <- c("FR","DE","AT","CH")
ind <- match(countries,ISO2codes)
my_map <- wrld_simpl[ind,]

## ------------------------------------------------------------------------
plot(my_map)

## ----cache=ca,warning=F--------------------------------------------------
spplot(my_map,"POP2005")

## ----message=F,cache=ca,warning=F----------------------------------------
library(colorRamps)
spplot(my_map,"POP2005",col.regions=blue2red(100))

## ----cache=ca,warning=F--------------------------------------------------
spplot(my_map,"POP2005",col.regions=blue2green(100))

## ----cache=ca,warning=F--------------------------------------------------
spplot(my_map,"POP2005",col.regions=green2red(100))

## ----cache=ca,warning=F--------------------------------------------------
spplot(my_map,"POP2005",col.regions=blue2yellow(100))

## ----cache=ca,warning=F--------------------------------------------------
spplot(my_map,"POP2005",col.regions=matlab.like(100))

## ----cache=ca,warning=F--------------------------------------------------
my_map$Pop2010 <- my_map$POP2005 + 
runif(length(my_map),-10000,10000)

## ----cache=ca,warning=F--------------------------------------------------
spplot(my_map,c("POP2005","Pop2010"),
       col.regions=matlab.like(100))

