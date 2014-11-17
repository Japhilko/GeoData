##################################
# Spatial Mannheim
# Jan-Philipp Kolb
# 17.10.2014
#
# Colors in maps
#
##################################


#--------------------------------#
# Load libraries
#--------------------------------#


library(XML)
library(maptools)
library(sp)
library(colorRamps)

#--------------------------------#
# Define paths
#--------------------------------#


graph.path <- "D:/Dropbox/RForschung/SpatialMannheim/Rslides/SpatialMA_E_FurtherReading/figure"


#--------------------------------#
# Load and edit data
#--------------------------------#


link <- "http://www.countrycallingcodes.com/iso-country-codes/europe-codes.php"

tables <- readHTMLTable(link)
ISO2 <- as.character(tables[[2]][,2])
ISO2 <- ISO2[-(53:56)]
ISO2 <- ISO2[-(1:2)]


data(wrld_simpl)
ISO2 <- ISO2[-which(ISO2=="RU")]
ind <- match(ISO2,wrld_simpl$ISO2)
Europe <- wrld_simpl[ind,]
plot(Europe)

#--------------------------------#
# Plot first maps
#--------------------------------#


setwd(graph.path)
png("Europe.png")
plot(Europe)
dev.off()

png("EuropeBlue.png")
plot(Europe,col="blue")
dev.off()


png("EuropeBlueRed.png")
plot(Europe,col="blue",border="red")
dev.off()

Europe$colors <- "green"

png("EuropeGreen.png")
plot(Europe,col=Europe$colors,border="red")
dev.off()


Europe$colors[Europe$POP2005>mean(Europe$POP2005)] <- "royalblue"

png("EuropeRB.png")
plot(Europe,col=Europe$colors)
dev.off()

Europe$colors[Europe$POP2005>median(Europe$POP2005)] <- "chocolate4"

png("EuropeRB2.png")
plot(Europe,col=Europe$colors)
dev.off()

#--------------------------------#
# Plot - color shading
#--------------------------------#

val <- Europe$POP2005/max(Europe$POP2005)

plot(Europe,col=rgb(0,0,val))

png("EuropeShading.png")
plot(Europe,col=rgb(0,0,val))
dev.off()

png("EuropeShading2.png")
plot(Europe,col=rgb(val,0,0))
dev.off()


png("EuropeShading3.png")
plot(Europe,col=rgb(0,val,0))
dev.off()


png("EuropeShading4.png")
plot(Europe,col=rgb(val,val,val))
dev.off()

#--------------------------------#
# Two plots beside
#--------------------------------#

par(mfrow=c(1,2))
plot(Europe,col=rgb(val,0,val))
plot(Europe,col=rgb(val,val,0))


png("EuropeTwice.png")
par(mfrow=c(1,2),mai=c(0,0,0,0))
plot(Europe,col=rgb(val,0,val))
plot(Europe,col=rgb(val,val,0))
dev.off()


  # do not forget to execute if you do not want this setting anymore
dev.off()


#--------------------------------#
# Plot - adding points
#--------------------------------#


which(Europe$ISO2=="FR") # 14
plot(Europe)
points(Europe$LON[14],Europe$LAT[14],col="red",pch=20)

png("EuropeAddPoint.png")
plot(Europe)
points(Europe$LON[14],Europe$LAT[14],col="red",pch=20)
dev.off()

pop <- Europe$POP2005
pop <- pop/max(pop)*10
png("EuropeAddPointS.png")
plot(Europe)
points(Europe$LON,Europe$LAT,cex=pop,col=rgb(0,0,1,.2),pch=20)
dev.off()



png("EuropeAddText.png")
plot(Europe)
text(Europe$LON,Europe$LAT,Europe$ISO2,col="red")
dev.off()


#--------------------------------#
# Plot - adding lines
#--------------------------------#

which(Europe$ISO2=="FR") # 15
which(Europe$ISO2=="DE") # 16

Dat <- cbind(Europe$LON[15:16],Europe$LAT[15:16])

setwd(graph.path)
png("EuropeAddLines.png")
plot(Europe)
lines(Dat,col="red",lwd=2)
dev.off()

#--------------------------------#
# Plot - adding symbols
#--------------------------------#

# http://www.nationalflaggen.de/
library(png)

which(Europe$ISO2=="DE") # 16

fDEU <- readPNG("DEUflag.png")
fDEU<- as.raster(fDEU[,,1:3])

plot(Europe)
rasterImage(fDEU,Europe$LON[16],Europe$LAT[16],13,54)

png("EuropeDflag.png")
plot(Europe)
rasterImage(fDEU,Europe$LON[16],Europe$LAT[16],13,54)
dev.off()

#--------------------------------#
# Plot - using sp-package
#--------------------------------#


png("Europe_spplot.png")
par(mai=c(0,0,0,0))
spplot(Europe,"POP2005")
dev.off()

png("Europe_blue2red.png")
par(mai=c(0,0,0,0))
spplot(Europe,"POP2005",col.regions=blue2red(100))
dev.off()

png("Europe_blue2green.png")
par(mai=c(0,0,0,0))
spplot(Europe,"POP2005",col.regions=blue2green(100))
dev.off()


png("Europe_green2red.png")
spplot(Europe,"POP2005",col.regions=green2red(100))
dev.off()

png("Europe_blue2yellow.png")
spplot(Europe,"POP2005",col.regions=blue2yellow(100))
dev.off()


png("Europe_matlab_like.png")
spplot(Europe,"POP2005",col.regions=matlab.like(100))
dev.off()

#--------------------------------#
# Generate synthetic data
#--------------------------------#

Europe$Pop2010 <- Europe$POP2005 + runif(length(Europe),-10000,10000)

png("TwoEuropes.png")
spplot(Europe,c("POP2005","Pop2010"),
       col.regions=matlab.like(100))
dev.off()




spplot(Europe,"POP2005",col.regions=matlab.like2(100))

spplot(Europe,"POP2005",col.regions=blue2green2red(100))

spplot(Europe,"POP2005",col.regions=primary.colors(100))

#--------------------------------#
# Further R-packages
#--------------------------------#

library(RgoogleMaps)
newmap <- GetMap(center = c(52.52001,13.40495), zoom = 14, 
                 destfile = "Berlin.png", 
                 maptype = "satellite")

PlotOnStaticMap(newmap)


? bubbleMap

data(lat.lon.meuse, package="loa", envir = environment())
#map <- GetMap.bbox(bb$lonR, bb$latR, destfile = filename, maptype="mobile", SCALE = 2);
map <- GetMap(center=c(lat=50.97494,lon=5.743606), zoom=13,
              size=c(480,480),destfile = file.path(tempdir(),"meuse.png"),
              maptype="mobile", SCALE = 1);

par(cex=1.5)
bubbleMap(lat.lon.meuse, coords = c("longitude","latitude"), map=map,
          zcol='zinc', key.entries = 100+ 100 * 2^(0:4));




library(googleVis)

data(Exports)    # a simple data frame
Geo <- gvisGeoMap(Exports, locationvar="Country", 
                  numvar="Profit",options=list(height=400, 
                                               dataMode='regions'))
plot(Geo)



data(Andrew)
M1 <- gvisMap(Andrew, "LatLong", "Tip", 
              options=list(showTip=TRUE, showLine=F, 
                           enableScrollWheel=TRUE, mapType='satellite', 
                           useMapTypeControl=TRUE, width=800,height=400))
plot(M1)


library(rworldmap)
# different resolutions available
newmap <- getMap(resolution = "coarse")  
plot(newmap)


vignette('rworldmap')
mapCountryData()