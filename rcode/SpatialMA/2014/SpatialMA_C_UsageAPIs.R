##################################
# Spatial Mannheim
# Jan-Philipp Kolb
# 27.10.2014
#
# Usage APIs
#
##################################

#--------------------------------#
# Define paths
#--------------------------------#

graph.path <- "J:/Work/Statistik/Kolb/Workshops/2014/SpatialMannheim/Rslides/SpatialMA_B_Choropleths/figure"

main.path <- "C:/Users/Kolb/Dropbox/RForschung/SpatialMannheim/Rslides/"
main.path <- "D:/Dropbox/RForschung/SpatialMannheim/Rslides/"

graph.path <- paste(main.path,"SpatialMA_C_UsageAPIS/figure",sep="")


# setwd("C:/Users/Kolb/Dropbox/RForschung/SpatialMannheim/data")

#--------------------------------#
# Package ggmap
#--------------------------------#

library(ggmap)

qmap("Mannheim")

setwd(graph.path)

pdf("Mannheim_qmap.pdf")
qmap("Mannheim")
dev.off()

pdf("Mannheim_qmap14.pdf")
qmap(location = 'Mannheim', zoom = 14)
dev.off()

pdf("Mannheim_qmap13.pdf")
qmap(location = 'Mannheim', zoom = 13)
dev.off()

pdf("Mannheim_qmap12.pdf")
qmap(location = 'Mannheim', zoom = 12)
dev.off()

pdf("Mannheim_qmap20.pdf")
qmap(location = 'Mannheim', zoom = 20)
dev.off()


pdf("Mannheim_qmap21.pdf")
qmap(location = 'Mannheim', zoom = 21)
dev.off()

  # change the source:

pdf("Mannheim_qmap_osm.pdf")
qmap(location = 'Mannheim', zoom = 14, source="osm")
dev.off()

  # choose a maptype

pdf("Mannheim_qmap_satellite.pdf")
qmap(location = 'Mannheim', zoom = 14, maptype="satellite")
dev.off()

pdf("Mannheim_qmap_hybrid.pdf")
qmap(location = 'Mannheim', zoom = 14, maptype="hybrid")
dev.off()


pdf("Mannheim_qmap_toner.pdf")
qmap(location = 'Mannheim', zoom = 14, maptype="toner",source="stamen")
dev.off()

#--------------------------------#
# Geocoding with ggmap
#--------------------------------#

geocode("Mannheim Wasserturm")

POI <- c("B2, 1 Mannheim","Hauptbahnhof Mannheim")

ListPOI <- data.frame(lat=NA,lon=NA)

for ( i in 1:length(POI)){
  geoPOI <- geocode(POI[i])
  ListPOI[i,"lat"] <-  geoPOI$lat 
  ListPOI[i,"lon"] <-  geoPOI$lon 
}

  # Computing the distance:
mapdist("Q1, 4 Mannheim","B2, 1 Mannheim")

MA_dist <- mapdist("Q1, 4 Mannheim","B2, 1 Mannheim")

library(xtable)
MA_dist <- round(MA_dist[3:8],digits=2)
xtable(MA_dist)


MA_dist_w <- mapdist("Q1, 4 Mannheim","B2, 1 Mannheim",
                     mode=c("walking"))
MA_dist_w <- round(MA_dist_w[3:8],digits=2)
xtable(MA_dist_w)

MA_dist_b <- mapdist("Q1, 4 Mannheim","B2, 1 Mannheim",
                     mode=c("bicycling"))
MA_dist_b <- round(MA_dist_b[3:8],digits=2)
xtable(MA_dist_b)


map <- qmap(location = 'Mannheim', zoom = 14)
address <- geocode("Mannheim Wasserturm")

map + geom_point(data = address,
           aes(x = lon, y = lat),
           color = "red",
           size = 10)

pdf("Mannheim_qmap_geom_point.pdf")
map + geom_point(data = address,
                 aes(x = lon, y = lat),
                 color = "red",
                 size = 10)
dev.off()


#-----------------------#
# Lines between points




 # http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf
set.seed(500)
df <- round(data.frame(
  x = jitter(rep(-95.36, 50), amount = .3),
  y = jitter(rep( 29.76, 50), amount = .3)
), digits = 2)
map <- get_googlemap("houston", markers = df, path = df, scale = 2)

ggmap(map, extent = "device")


#--------------------------------#
# Package dismo
#--------------------------------#

library(dismo)
mymap <- gmap("France")  # choose whatever country
plot(mymap)

setwd(graph.path)
pdf("France_dismo.pdf")
plot(mymap)
dev.off()


MAmap <- gmap("Mannheim")
plot(MAmap)

pdf("Mannheim_dismo.pdf")
plot(MAmap)
dev.off()


#--------------------------------#
# Package RgoogleMaps
#--------------------------------#


library(RgoogleMaps)
newmap <- GetMap(center = c(52.52001,13.40495), zoom = 14, 
                 destfile = "Berlin.png", 
                 maptype = "satellite")


setwd(graph.path)
PlotOnStaticMap(newmap)

data(lat.lon.meuse, package="loa", envir = environment())

map <- GetMap(center=c(lat=50.97494,lon=5.743606), zoom=13,
              size=c(480,480),destfile = file.path(tempdir(),"meuse.png"),
              maptype="mobile", SCALE = 1);

par(cex=1.5)

setwd(graph.path)
pdf("Meuse.pdf")
bubbleMap(lat.lon.meuse, coords = c("longitude","latitude"), map=map,
          zcol='zinc', key.entries = 100+ 100 * 2^(0:4));
dev.off()

#--------------------------------#
# Package googleVis
#--------------------------------#

# http://pakillo.github.io/R-GIS-tutorial/#rgooglemaps

library(googleVis)

data(Exports)    # a simple data frame
Geo <- gvisGeoMap(Exports, locationvar="Country", numvar="Profit", 
                  options=list(height=400, dataMode='regions'))
plot(Geo)


#--------------------------------#
# Package rworldmap
#--------------------------------#


library(rworldmap)

newmap <- getMap(resolution = "coarse")  # different resolutions available
plot(newmap)


vignette('rworldmap')
