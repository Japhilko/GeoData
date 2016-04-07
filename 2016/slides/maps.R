## ----echo=F,warning=F----------------------------------------------------
library(knitr)
Ex=T

## ----echo=F,message=F,warning=F,eval=F-----------------------------------
## library(maps)
## library(magrittr)
## library(leaflet)
## mapStates = map("state", fill = TRUE, plot = FALSE)
## leaflet(data = mapStates) %>% addTiles() %>%
##   addPolygons(fillColor = topo.colors(10, alpha = NULL), stroke = FALSE)

## ----echo=F,message=F,warning=F------------------------------------------
library(maps)
map("state",fill=T,col=1:10)

## ----message=F-----------------------------------------------------------
library(maps)

## ----eval=F--------------------------------------------------------------
## ?map

## ------------------------------------------------------------------------
map()

## ------------------------------------------------------------------------
map("usa")

## ------------------------------------------------------------------------
map("france")

## ------------------------------------------------------------------------
library ( maps )
map ("italy", col = "blue")

## ------------------------------------------------------------------------
map ("italy",fill =T, col = "blue")

## ------------------------------------------------------------------------
colors <- c("blue","red","yellow")

## ------------------------------------------------------------------------
map ("italy",fill =T, col = colors)

## ------------------------------------------------------------------------
map("italy",fill=T, col = rgb(0,1,0))

## ------------------------------------------------------------------------
map("state", col="#01B8AA", bg="#374649")

## ----eval=F--------------------------------------------------------------
## map("italy",fill=T, col = rgb(1,0,0))
## map("italy",fill=T, col = rgb(1,1,1))
## map("italy",fill=T, col = rgb(1,0.5,0.4))

## ------------------------------------------------------------------------
italy <- map("italy", plot = F)
head(italy$names)

## ----eval=F--------------------------------------------------------------
## map("county")

## ----echo=F--------------------------------------------------------------
Argument <- c("county","france","italy","nz","state","usa","world")
What <- c("US Counties","France","Italy","New Zealand","US States","USA","Countries of the world")

kable(data.frame(Argument,What))

## ------------------------------------------------------------------------
library(maps)
map("world", "Germany")

## ------------------------------------------------------------------------
map("world", c("Germany","Poland"))

## ------------------------------------------------------------------------
map("world", c("Germany","Austria"),fill=T,
col=c("red","green"))

## ------------------------------------------------------------------------
map("world", "China")
map.scale()

## ------------------------------------------------------------------------
map.text("county", "penn")

## ------------------------------------------------------------------------
data(world.cities)

## ----eval=F--------------------------------------------------------------
## head(world.cities)

## ----echo=F--------------------------------------------------------------
kable(head(world.cities))

## ------------------------------------------------------------------------
map()
map.cities(world.cities)

## ------------------------------------------------------------------------
data(world.cities)
map("france")
map.cities(world.cities)

## ------------------------------------------------------------------------
FrenchCity <- world.cities$country.etc=="France"
FCit <- world.cities[FrenchCity,]

## ----echo=F--------------------------------------------------------------
kable(head(FCit,n=4))

## ------------------------------------------------------------------------
map("france")
map.cities(FCit,col="blue",pch=20)

## ------------------------------------------------------------------------
FCit_Bc<-FCit[FCit$pop>50000,]
map("france")
map.cities(FCit,col="blue",pch=20)
map.cities(FCit_Bc,col="red",pch=20)

## ----eval=F--------------------------------------------------------------
## library(maps)
## data("world.cities")
## X <- world.cities[,c("lat","pop")]
## plot(world.cities$lon,world.cities$lat)
## for(i in 1:length(X$lat)) {
##   abline(h=X$lat[i],col=rgb(1,0,0,.001),lwd=2.7)
## }

## ----eval=F,echo=F-------------------------------------------------------
## library(maps)
## data("world.cities")
## X=world.cities[,c("lat","pop")]
## liss=function(x,h){
##  w=dnorm(x-X[,"lat"],0,h)
##  sum(X[,"pop"]*w)
## }
## vx=seq(-80,80)
## vy=Vectorize(function(x) liss(x,1))(vx)
## vy=vy/max(vy)
## plot(world.cities$lon,world.cities$lat,)
## for(i in 1:length(vx))
## abline(h=vx[i],col=rgb(1,0,0,vy[i]),lwd=2.7)

## ----warning=F-----------------------------------------------------------
library(mapproj)
map("state", col="#01B8AA", bg="#374649", fill=TRUE, proj="mercator")

## ------------------------------------------------------------------------
map("state", col="#01B8AA", bg="#374649", fill=TRUE, proj="azequalarea")

## ------------------------------------------------------------------------
map("state", col="#01B8AA", bg="#374649", fill=TRUE, proj="guyou")

