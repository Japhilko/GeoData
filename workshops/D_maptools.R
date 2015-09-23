## ----echo=F,warning=F----------------------------------------------------
library(knitr)
ca=T
library(sp)

## ----message=F,cache=ca,warning=F----------------------------------------
library(maptools)
data(wrld_simpl)

## ----echo=F--------------------------------------------------------------
kable(wrld_simpl@data[1:4,1:5])

## ----warning=F-----------------------------------------------------------
data(wrld_simpl)
plot(wrld_simpl)

## ----eval=F--------------------------------------------------------------
## head(wrld_simpl@data)

## ----results='asis',echo=F-----------------------------------------------
library(knitr)
kable(wrld_simpl@data[1:4,1:5])

## ------------------------------------------------------------------------
head(wrld_simpl@data$NAME)

## ------------------------------------------------------------------------
ind_SA <- wrld_simpl@data$NAME =="South Africa"
head(ind_SA)

## ------------------------------------------------------------------------
table(ind_SA)

## ------------------------------------------------------------------------
SouthAfrica <- wrld_simpl[ind_SA,]
plot(SouthAfrica)

## ------------------------------------------------------------------------
EuropeList <- c('Germany', 'France')
my_map <- wrld_simpl[wrld_simpl$NAME %in% EuropeList, ]
par(mai=c(0,0,0,0))
plot(my_map)

## ------------------------------------------------------------------------
my_map@data$color <- c("blue","green")
plot(my_map,col=my_map@data$color)

## ------------------------------------------------------------------------
plot(wrld_simpl, bg='azure2', col='green', border='lightgray')

## ------------------------------------------------------------------------
Europe <- wrld_simpl[wrld_simpl$REGION=="150",]
plot(Europe,col="royalblue")

## ------------------------------------------------------------------------
ind <- which(Europe@data$NAME=="Russia")
EU <- Europe[-ind,]
plot(EU,col="blue",border="red")

## ------------------------------------------------------------------------
EU$colors <- "green"
plot(EU,col=EU$colors,border="red")
pop05 <- Europe$POP2005
Europe$colors[pop05>mean(pop05)] <- "royalblue"
plot(Europe,col=Europe$colors)

## ------------------------------------------------------------------------
Europe$colors[pop05>median(pop05)] <- "chocolate4"
plot(Europe,col=Europe$colors)

## ------------------------------------------------------------------------
val <- Europe$POP2005/max(Europe$POP2005)
plot(Europe,col=rgb(0,0,val))

## ------------------------------------------------------------------------
val <- Europe$POP2005/max(Europe$POP2005)
plot(Europe,col=rgb(val,0,0))

## ------------------------------------------------------------------------
val <- Europe$POP2005/max(Europe$POP2005)
plot(Europe,col=rgb(0,val,0))

## ------------------------------------------------------------------------
val <- Europe$POP2005/max(Europe$POP2005)
plot(Europe,col=rgb(val,val,val))

## ------------------------------------------------------------------------
par(mfrow=c(1,2))
plot(Europe,col=rgb(val,0,val))
plot(Europe,col=rgb(val,val,0))

## ------------------------------------------------------------------------
which(Europe$ISO2=="FR") # 14
plot(Europe)
points(Europe$LON[14],Europe$LAT[14],col="red",pch=20)

## ------------------------------------------------------------------------
pop <- Europe$POP2005
pop <- pop/max(pop)*10
plot(Europe)
points(Europe$LON,Europe$LAT,cex=pop,col=rgb(0,0,1,.2),
pch=20)

## ------------------------------------------------------------------------
plot(Europe)
text(Europe$LON,Europe$LAT,Europe$ISO2,col="red")

## ----eval=F--------------------------------------------------------------
## which(Europe$ISO2=="FR") # 15
## which(Europe$ISO2=="DE") # 16

## ------------------------------------------------------------------------
Dat <- cbind(Europe$LON[15:16],Europe$LAT[15:16])
plot(Europe)
lines(Dat,col="red",lwd=2)

## ----eval=F--------------------------------------------------------------
## library(png)
## fDEU <- readPNG("DEUflag.png")
## fDEU<- as.raster(fDEU[,,1:3])
## plot(Europe)
## rasterImage(fDEU,Europe$LON[16],Europe$LAT[16],13,54)

