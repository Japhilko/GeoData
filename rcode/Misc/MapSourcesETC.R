##################################################
# Allgemeines:
# Kartendaten werden in komplett unterschiedlichen Dateiformaten veröffentlicht. 
# Inzwischen Standardkartenformat: Shapefile
# Ein (!) Shapefile besteht aus mindestens drei Dateien:
# - .shp-Datei zur Speicherung der Geometriedateien
# - .dbf-Datei zur Speicherung der Sachdaten 
# - .shx-Datei zur Indizierung der Sachdaten (=Verknüpfung zur Geometrie)
#
# Des Weiteren gibt es noch optionale Daten für joins, links, projections usw. 


##################################################
# Wo gibt es solche Karten?
# Kurz: Im Internet
# Länger: Hier eine Liste von verschiedenen und auf keinen Fall allen Möglichkeiten:
# - Global Administrative Areas : http://www.gadm.org/country für Verwaltungsgrenzen
# - World map for APRS: http://aprsworld.net/gisdata/world/ Weltkarte mit allen Staaten
# - Natural Earth: http://www.naturalearthdata.com/features/ Weltkarte mit allen möglichen Merkmalen
# - VDS Technologies: http://www.vdstech.com/map-data.aspx Weltkarte mit Flughäfen, usw. 
# - Eurostat: http://epp.eurostat.ec.europa.eu/portal/page/portal/gisco_Geographical_information_maps/geodata/reference Europa-Karte mit den NUTS-Regionen
# - Nationalatlas US: http://www.nationalatlas.gov/atlasftp.html Alle möglichen Karten der USA
# - DIVA-GIS: http://www.diva-gis.org/Data Amerika, Asien Afrika als Kontinente mit Staaten
# - Open Street Projekt: http://download.geofabrik.de/ weltweite sehr gute Karten
# - Wahlleiter: http://www.bundeswahlleiter.de/de/bundestagswahlen/BTW_BUND_09/wahlkreiseinteilung/kartogaphische_darstellung.html Deutschland mit Wahlkreisen
# - Geocommons: http://geocommons.com/ Allgemeine Karten
# - Mapcruzin http://www.mapcruzin.com/download-free-arcgis-shapefiles.htm Allgemeine Karten


##################################################
# Übersicht der Beispiele
# 1. ALQ auf Bundesländerebene in Deutschland
# 2. ALQ in bayerischen Landkreisen
# 3. Schnelle Karten mit Städten
# 4. ALQ in bayerischen Landkreisen -> Probleme der Aktualität und des Ansprechens
# 5. Googlemaps
# 6. Oregon Tutorial
# 7. Fast World Example
# 8. Wahlkreise


##################################################
# Vorgehensweise:
# 1. Kartendaten (im Shapefile Format) besorgen 
#    -> http://gadm.org/ (Alle Staaten mit ihren Verwaltungsgrenzen; R (SpatialPolygonsDataFrame) -> level 3 für Kreise
#    -> http://gadm.org/ (Alle Staaten mit ihren Verwaltungsgrenzen; Shapefile als Zip inlusive Level 3 als csv.
#    -> Kurshomepage 
#
# 2. Arbeitslosendaten
#    -> http://ims.destatis.de/indikatoren/Default.aspx Tables Button
#    -> https://offenedaten.de/dataset/arbeitslose-nach-ausgewahlten-personengruppen-sowiearbeitslosenquoten-jahresdurchschnitt-regio55925
#    -> Kurshomepage: alq_kreise.csv
#
# 3. Verbindung der beiden Datensätze (später noch genauer!)
#    -> Matching der beiden Datensätze: Überprüfen ob alle Variablen gleiche Namen enthalten! 
#       (z. B. in Excel oder Notepad++ laden)

# 4. Notwendige Packages
# a) spatial library: Typische Kartenvisualisierungsfunktionen (Koordinaten!) für 2d und 3d Karten
#install.packages("sp")
library(sp)

# b) rgdal library: Import/Export von GDAL und OGR Karten, sowie Projektionen/Transformationen der Karten
#install.packages("rgdal")
library(rgdal)

# c) RColorBrewer: The packages provides palettes for drawing nice maps shaded according to a variable.
#install.packages("RColorBrewer")
library(RColorBrewer)

setwd("g:/PIR/data/maps")
######################### ######################### ######################### 
#1. Beispiel: ALQ Bundesländer 
######################### ######################### ######################### 

# Entweder Benutzen der folgenden URl (adm1 = Administrationsebene 1)
bl_url <- url("http://gadm.org/data/rda/DEU_adm1.RData") # alternativ direkt über www.gadm.org runterladen
print(load(bl_url))
close(bl_url)
bl <- gadm
summary(bl)

summary(bl)

str(bl$NAME_1)
col_bl = rainbow(length(levels(bl$NAME_1)))

spplot(gadm, "NAME_1", col.regions=col_bl, main="Deutsche Bundesländer",
       colorkey = FALSE, lwd=0, col="white")

# Alq aus dem Internet eingelesen
bl_alq <- c(3.6, 4, 5.2, 5.7, 6.3, 6.5, 7.1, 7.4, 7.6, 8.2,8.8, 9.2, 10.3, 10.4,10.7, 11.3)
names(bl_alq)<- c("Bayern"
                  , "Baden-Württemberg", "Rheinland-Pfalz", "Hessen", "Niedersachsen"
                  , "Schleswig-Holstein", "Saarland", "Hamburg", "Thüringen"
                  , "Nordrhein-Westfalen", "Sachsen", "Brandenburg", "Sachsen-Anhalt"
                  , "Mecklenburg-Vorpommern", "Bremen", "Berlin")
# Nun der Namen nach sortieren, damit die Listen später übereinstimmen!
names <- order(names(bl_alq))
bl_alq_sort <- bl_alq[names]

# Erzeugen der Werte und Levels / "Zerschneiden" des numerischen Vektors in einen Faktor mit den Levels wie folgend
?cut
bl_alq_sort<-cut(bl_alq_sort, breaks=c(0,2.5,5,7.5,10,12.5,100))
levels(bl_alq_sort) <- c("<2,5%", "2,5-5%", "5-7,5%","7,5-10%", "10-12,5%", ">12,5%")

bl$bl_alq <-bl_alq_sort

# Farbenpalette hier interaktiv auswählbar: http://colorbrewer2.org/ , hier YlGn oder Reds
myPalette<-brewer.pal(6,"YlGn")
myPalette
# Nun der Plot des Datensatzes; Spalte bl_alq, in dem der sortierte Faktor steht mit der Palette
spplot(bl, "bl_alq", col=grey(.9), col.regions=myPalette,
       main="Arbeitslosigkeit in den Bundesländern")


######################### ######################### ######################### 
# 2.Grafik:Bayr. Landkreise ######################### 
######################### ######################### ######################### 
library(shapefiles) 
library("sp","rgdal")
setwd("g:/PIR/data/maps/Landkreise")
getwd()
bayr_lk<-read.shapefile("lkr_ex") # mit read.shapefile aus (shapefiles)
bayr_lk_shp<-convert.to.simple(bayr_lk$shp) 
bayr_lk_shp
summary(bayr_lk_shp) # müssen noch ID entfernen!
bayr_lk_shp<-bayr_lk_shp[,-1] 
plot(bayr_lk_shp) 

# Problem: Wie spricht man die einzelnen Landkreise direkt an?! 
# Frage: Wie findet man die Struktur?!
summary(bayr_lk_shp) 


######################### ######################### ######################### 
#3. Beispiel: ALQ Bundesländer 
######################### ######################### ######################### 


library(maps)
map("world", "Germany")
?map.cities
map.cities(country = "Germany")
map("state", "New Jersey")
data(us.cities)
map.cities(us.cities, country="NJ")


######################### ######################### ######################### 
#4. Beispiel: ALQ Landkreise  
######################### ######################### ######################### 
# Entweder Benutzen der folgenden URl
con <- url("http://gadm.org/data/rda/DEU_adm3.RData")
# Laden der Daten der URL
print(load(con))
# -> Geladen ist nun gadm, ein SpatialPolygonsDataFrame

# Schließen der Verbindung
close(con)

# Spatial Class summary: 
summary(gadm)
#Benötigen Kreise, also Spalte "NAME_3"

# Farbenliste mit Länge length
col = rainbow(length(levels(gadm$NAME_3)))

# Plot Option for gadm Data, 
?spplot 
# -> obj of class extending Spatial-class
# -> Benötigen "NAME_§" als zcol
# -> Farben bunt mit rainbow vorher erzeugt
# et voila: ein erster Plot!
spplot(gadm, "NAME_3", col.regions=col, main="Deutsche Kreise und Städte",
       colorkey = FALSE, lwd=.4, col="white")


########################################################
# Verknüpfung der beiden Datensätze:
#  
gadm$NAME_3

# Abspeichern der GADM Namen zum besseren Betrachten:
write.table(gadm$NAME_3, file="data/spTutNames.csv", sep=";") #; wegen Excel

# Einlesen der anderen Namen:
alq_clean <- read.csv("data/alq_clean.csv", header=FALSE, sep=";", dec=",")
names(alq_clean) <- c("Kreisschlüssel", "Kreis", "Abs_tot",
                      "Quote_tot", "Abhängige Personen",
                      "Männer absolut", "Männer ALQ",
                      "Frauen absolut", "Frauen ALQ",
                      "bis 20 absolut", "bis 20 AQL",
                      "bis 25 absolut", "bis 25 AQL",
                      "55 bis 65 absolut", "55 bis 65 AQL",
                      "Ausländer absolut", "Ausländer ALQ")

?unlist
landkreise <- as.data.frame(cbind(unlist(gadm@data$NAME_3),unlist(gadm@data$VARNAME_3)))

names(landkreise) <- c("OName","VName")
landkreise$OName[landkreise$OName == "NA"] <- NA
landkreise$OName <- gsub(" Städte","",landkreise$OName)
landkreise$VName[landkreise$VName == "NA"] <- NA
landkreise$FName <- paste(landkreise$OName, ", ", gsub("Städte", "Stadt", gsub("Landkreise", "Landkreis", unlist(gadm@data$TYPE_3))), sep="")


unempl<-read.table("data/alq_kreis.txt", sep=";", head=T, dec=",")
names(unempl)<-c("Landkreis", "Art", "Wert")

#Angleichen der Namen der beiden Quellen
order1 <- as.vector(unlist(lapply(sapply(landkreise$FName, grep, unempl$Landkreis, value=F),function(x) x[1])))
order2 <- as.vector(unlist(lapply(sapply(landkreise$OName, grep, unempl$Landkreis, value=F),function(x) x[1])))
order3 <- as.vector(unlist(lapply(sapply(landkreise$VName, grep, unempl$Landkreis, value=F),function(x) x[1])))

gadm_names<-gadm$NAME_3
total <- length(gadm_names)


gsub Funktion
?agrep

# Fortschritt des Angleichens der beiden Teile
pb <- txtProgressBar(min = 0, max = total, style = 3) 
order <- vector()
for (i in 1:total){  
  order[i] <- agrep(gadm_names[i], unempl$Landkreis, 
                    max.distance = 0.2)[1]
  setTxtProgressBar(pb, i)               
}

# Farbwahl
col_no <- as.factor(as.numeric(cut(unempl$Wert[order],c(0,2.5,5,7.5,10,15,100))))

levels(col_no) <- c(">2,5%", "2,5-5%", "5-7,5%","7,5-10%", "10-15%", ">15%")

gadm$col_no <- col_no
myPalette<-brewer.pal(6,"Purples")
spplot(gadm, "col_no", col=grey(.9), col.regions=myPalette,
       main="Arbeitslosigkeit in den Landkreisen")

######################### ######################### ######################### 
#5. GoogleMaps
######################### ######################### ######################### 


#install.packages("RgoogleMaps")
library("RgoogleMaps")

Regensburg <- GetMap(center="Regensburg", zoom=15)
PlotOnStaticMap(Regensburg)
points(49.02,12.20, pch=16, cex=1)
points(49.02,12.00, pch=16, cex=1, col="red")
points
Regensburg <- GetMap(center="Regensburg", zoom=13, maptype="terrain")
PlotOnStaticMap(Regensburg)

summary(Regensburg)

dev.off()

######################### ######################### ######################### 
# 6. Oregan Data Sets      ######################### 
######################### ######################### ######################### 
setwd("g:/PIR/data/maps")
# install.packages(c("gpclib", "maptools", "RColorBrewer", "classInt"))
library(gpclib)
library(maptools)     # loads sp library too
library(RColorBrewer) # creates nice color schemes
library(classInt)     # finds class intervals for continuous variables
# To enable the polygon-clipping library, type:
gpclibPermit()
# Read the shapefiles using the maptools function read.shape()
# outlines of Oregon counties (lines)
# browse to orotl.shp

orotl.shp <- readShapeLines(file.choose(),
                            proj4string=CRS("+proj=longlat"))
orotl.shp <- readShapeLines("orotl.shp",
                            proj4string=CRS("+proj=longlat"))

# Oregon climate station data (points)
# browse to orstations.shp
orstations.shp <- readShapePoints(file.choose(),
                                  proj4string=CRS("+proj=longlat"))
orstations.shp <- readShapePoints("orstations.shp",
                                  proj4string=CRS("+proj=longlat"))

# Oregon county census data (polygons)
# browse to orcounty.shp
orcounty.shp <- readShapePoly(file.choose(),
                              proj4string=CRS("+proj=longlat"))
orcounty.shp <- readShapePoly("orcounty.shp",
                              proj4string=CRS("+proj=longlat"))

#Read ordinary rectangular data sets:
orstationc <- read.csv("orstationc.csv")
summary(orstationc)
orcountyp <- read.csv("orcountyp.csv")
cities <- read.csv("cities.csv")


#Examine the structure and contents of orcounty.shp shapefile:
summary(orcounty.shp)
attributes(orcounty.shp)
attributes(orcounty.shp@data)
attr(orcounty.shp,"polygons")

# 1.  Some simple maps
# R has the capability of plotting some simple maps using the maptools package, which can read and plot ESRI shapefiles.  Here are a couple of examples:
# Oregon county census data -- attribute data in the orcounty.shp shape file
# equal-frequency class intervals
plotvar <- orcounty.shp@data$POP1990
nclr <- 8
plotclr <- brewer.pal(nclr,"BuPu")
class <- classIntervals(plotvar, nclr, style="quantile")
colcode <- findColours(class, plotclr)

plot(orcounty.shp, xlim=c(-124.5, -115), ylim=c(42,47))
plot(orcounty.shp, col=colcode, add=T)
title(main="Population 1990",
      sub="Quantile (Equal-Frequency) Class Intervals")
legend(-117, 44, legend=names(attr(colcode, "table")),
       fill=attr(colcode, "palette"), cex=0.6, bty="n")
dev.off()
# Oregon climate station data -- data in the orstationc.csv file, basemap in orotl.shp
# symbol plot -- equal-interval class intervals
plotvar <- orstationc$tann
nclr <- 8
plotclr <- brewer.pal(nclr,"PuOr")
plotclr <- plotclr[nclr:1] # reorder colors
class <- classIntervals(plotvar, nclr, style="equal")
colcode <- findColours(class, plotclr)


plot(orotl.shp, xlim=c(-124.5, -115), ylim=c(42,47))
points(orstationc$lon, orstationc$lat, pch=16, col=colcode, cex=2)
points(orstationc$lon, orstationc$lat, cex=2)
title("Oregon Climate Station Data -- Annual Temperature",
      sub="Equal-Interval Class Intervals")
legend(-117, 44, legend=names(attr(colcode, "table")),
       fill=attr(colcode, "palette"), cex=0.6, bty="n")

# Oregon climate station data -- locations and data in shape file
# symbol plot -- equal-interval class intervals
plotvar <- orstations.shp@data$pann
nclr <- 5
plotclr <- brewer.pal(nclr,"BuPu")
class <- classIntervals(plotvar, nclr, style="fixed",
                        fixedBreaks=c(0,200,500,1000,2000,5000))
colcode <- findColours(class, plotclr)
orstations.pts <- orstations.shp@coords # get point data

plot(orotl.shp, xlim=c(-124.5, -115), ylim=c(42,47))
points(orstations.pts, pch=16, col=colcode, cex=2)
points(orstations.pts, cex=2)
title("Oregon Climate Station Data -- Annual Precipitation",
      sub="Fixed-Interval Class Intervals")
legend(-117, 44, legend=names(attr(colcode, "table")),
       fill=attr(colcode, "palette"), cex=0.6, bty="n")

# 2.  Variations in color scales and representation
# This set of examples illustrates some more applications of the maptools package, and some variations in the contruction of class intervals for choropleth maps and symbolic representation of the Oregon county-level census data
# Oregon county census data -- equal-frequency class intervals
# equal-frequency class intervals
plotvar <- orcounty.shp@data$AREA
nclr <- 8
plotclr <- brewer.pal(nclr,"BuPu")
#plotclr <- plotclr[nclr:1] # reorder colors if appropriate
class <- classIntervals(plotvar, nclr, style="quantile")
colcode <- findColours(class, plotclr)

plot(orcounty.shp, xlim=c(-124.5, -115), ylim=c(42,47))
plot(orcounty.shp, col=colcode, add=T)
title(main="Area",
      sub="Quantile (Equal-Frequency) Class Intervals")
legend(-117, 44, legend=names(attr(colcode, "table")),
       fill=attr(colcode, "palette"), cex=0.6, bty="n")

# Oregon county census data -- equal-width class intervals
# equal-width class intervals of county area
plotvar <- orcounty.shp@data$AREA
nclr <- 8
plotclr <- brewer.pal(nclr,"BuPu")
#plotclr <- plotclr[nclr:1] # reorder colors if appropriate
class <- classIntervals(plotvar, nclr, style="equal")
colcode <- findColours(class, plotclr)

plot(orcounty.shp, xlim=c(-124.5, -115), ylim=c(42,47))
plot(orcounty.shp, col=colcode, add=T)
title(main="Area",
      sub=" Equal-Width Class Intervals")
legend(-117, 44, legend=names(attr(colcode, "table")),
       fill=attr(colcode, "palette"), cex=0.6, bty="n")
#equal-width class intervals of 1990 population
plotvar <- orcounty.shp@data$POP1990
nclr <- 8
plotclr <- brewer.pal(nclr,"BuPu")
#plotclr <- plotclr[nclr:1] # reorder colors if appropriate
class <- classIntervals(plotvar, nclr, style="equal")
colcode <- findColours(class, plotclr)

plot(orcounty.shp, xlim=c(-124.5, -115), ylim=c(42,47))
plot(orcounty.shp, col=colcode, add=T)
title(main="Population 1990",
      sub=" Equal-Width Class Intervals")
legend(-117, 44, legend=names(attr(colcode, "table")),
       fill=attr(colcode, "palette"), cex=0.6, bty="n")

# Oregon county census data -- bubble plots
# bubble plot equal-frequency class intervals
plotvar <- orcounty.shp@data$AREA
nclr <- 8
plotclr <- brewer.pal(nclr,"BuPu")
#plotclr <- plotclr[nclr:1] # reorder colors if appropriate
max.symbol.size=12
min.symbol.size=1
class <- classIntervals(plotvar, nclr, style="quantile")
colcode <- findColours(class, plotclr)
symbol.size <- ((plotvar-min(plotvar))/
                  (max(plotvar)-min(plotvar))*(max.symbol.size-min.symbol.size)
                +min.symbol.size)

plot(orcounty.shp, xlim=c(-124.5, -115), ylim=c(42,47))
orcounty.cntr <- coordinates(orcounty.shp)
points(orcounty.cntr, pch=16, col=colcode, cex=symbol.size)
points(orcounty.cntr, cex=symbol.size)
text(-120, 46.5, "Area: Equal-Frequency Class Intervals")
legend(locator(1), legend=names(attr(colcode, "table")),
       fill=attr(colcode, "palette"), cex=0.6, bty="n")
# bubble plot equal-frequency class intervals
plotvar <- orcounty.shp@data$POP1990
nclr <- 8
plotclr <- brewer.pal(nclr,"BuPu")
#plotclr <- plotclr[nclr:1] # reorder colors if appropriate
max.symbol.size=12
min.symbol.size=1
class <- classIntervals(plotvar, nclr, style="quantile")
colcode <- findColours(class, plotclr)
symbol.size <- ((plotvar-min(plotvar))/
                  (max(plotvar)-min(plotvar))*(max.symbol.size-min.symbol.size)
                +min.symbol.size)

plot(orcounty.shp, xlim=c(-124.5, -115), ylim=c(42,47))
orcounty.cntr <- coordinates(orcounty.shp)
points(orcounty.cntr, pch=16, col=colcode, cex=symbol.size)
points(orcounty.cntr, cex=symbol.size)
text(-120, 46.5, "Population: Equal-Frequency Class Intervals")
legend(locator(1), legend=names(attr(colcode, "table")),
       fill=attr(colcode, "palette"), cex=0.6, bty="n")
Oregon county census data -- (pseudo) dot-density maps
# maptools dot-density maps
# warning: this can take a little while
plottitle <- "Population 1990, each dot=1000"
orpolys <- SpatialPolygonsDataFrame(orcounty.shp, data=as(orcounty.shp, "data.frame"))
plotvar <- orpolys@data$POP1990/1000.0

dots.rand <- dotsInPolys(orpolys, as.integer(plotvar), f="random")
plot(orpolys, xlim=c(-124.5, -115), ylim=c(42,47))
plot(dots.rand, add=T, pch=19, cex=0.5, col="magenta")
plot(orpolys, add=T)
title(plottitle)

dots.reg <- dotsInPolys(orpolys, as.integer(plotvar), f="regular")
plot(orpolys, xlim=c(-124.5, -115), ylim=c(42,47))
plot(dots.reg, add=T, pch=19, cex=0.5, col="purple")
plot(orpolys, add=T)
title(plottitle)


# 3.  Projections
# The sp class and maptools package provide a mechanism for doing projected maps.  (Note that the projection parameters here are not really appropriate for the area being plotted, but were chosen to make the fact that the map is projected evident.)
# There are several ways in which map projections are implemented in R.  One is through the R library rgdal, that loads GDAL, the Geospatial Data Abstraction Library, which uses the "PROJ.4" map projection subroutines.  On Windows, the package can be installed the usual way, or by typing
install.packages("rgdal")

# On the Mac, the package at times resides on the "CRAN Extras" repository where difficult-to-compile packages can sometimes be found.  On the Mac, rgdal is installed as follows
setRepositories(ind=1:2)
install.packages("rgdal")
First, load the rgdal package
library(rgdal)
Oregon climate station data -- data in the orstations shapefile
# equal-frequency class intervals -- spplot & projected
plotvar <- orstations.shp@data$tann # gets data from shapefile .dbf
nclr <- 8
plotclr <- brewer.pal(nclr,"PuOr")
plotclr <- plotclr[nclr:1] # reorder colors
class <- classIntervals(plotvar, nclr, style="quantile")
colcode <- findColours(class, plotclr)

# add proj4string info to shape files
proj4string(orotl.shp) <- CRS("+proj=longlat")
proj4string(orstations.shp) <- CRS("+proj=longlat")

# do the projection
# Albers equal-area projection parameters
aea.proj <- "+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-110
+x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m"
# project the county outlines and station locations
orotl.shp.proj <- spTransform(orotl.shp, CRS(aea.proj))
orstations.shp.proj <- spTransform(orstations.shp, CRS(aea.proj))

# generate and project a graticule
orgrat <- gridlines(orotl.shp, easts=seq(-127,-115,by=1),
                    norths=seq(42,47,by=1), ndiscr = 20)
orgrat.proj <- spTransform(orgrat, CRS(aea.proj))

# specify a state and county outline file and graticule
basemap1 <- list("sp.lines", orgrat.proj, col="gray", fill=NA)
basemap2 <- list("sp.lines", orotl.shp.proj, fill=NA)

# finally, plot the map

spplot(orstations.shp.proj, "tann",
       col.regions=plotclr, cuts=nclr, at=round(class$brks, digits=1),
       xlim=bbox(orotl.shp.proj)[1,], ylim=bbox(orotl.shp.proj)[2,],
       key.space="right",
       sp.layout=list(basemap1, basemap2),
       main="Annual Temperature")
Oregon county census data -- attribute data in the orcounty.shp shape file
# project Oregon county data
aea.proj <- "+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-110
+x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m"
orcounty.shp.proj <- spTransform(orcounty.shp, CRS(aea.proj))

# equal-frequency class intervals -- spplot & projected
plotvar <- orcounty.shp@data$AREA
nclr <- 8
plotclr <- brewer.pal(nclr,"BuPu")
class <- classIntervals(plotvar, nclr, style="equal")
colcode <- findColours(class, plotclr)
spplot(orcounty.shp.proj, "AREA",
       col.regions=plotclr, at=round(class$brks, digits=1))

# equal-width class intervals -- spplot & projected
plotvar <- orcounty.shp@data$AREA
nclr <- 8
plotclr <- brewer.pal(nclr,"BuPu")
class <- classIntervals(plotvar, nclr, style="quantile")
colcode <- findColours(class, plotclr)
spplot(orcounty.shp.proj, "AREA",
       col.regions=plotclr, at=round(class$brks, digits=1))
4.  Examples using the maps package
The R maps package provides a means of mapping data that are not necessarily components of a shapefile.  The package provides a way of plotting choropleth maps using polygons that it contains (U.S. states and counties, countries of the world), and can used unfilled polygons to provide basemaps for point data.  The following example replicates  two maps done using the maptools package.
Oregon county census data -- bubble plots
library(maps)
install.packages("mapproj")
library(mapproj)
# look at the orcounty.csv data
attach(orcountyp)
summary(orcountyp)

# check names for proper order
map("county","oregon", names=T, plot=F)
print(orcountyp$Name)

# bubble plot equal-frequency class intervals
map("county", "oregon", xlim=c(-125,-114), ylim=c(42,47))
map.axes()
plotvar <- orcountyp$Area
nclr <- 8
plotclr <- brewer.pal(nclr,"BuPu")
#plotclr <- plotclr[nclr:1] # reorder colors if appropriate
max.symbol.size=10
min.symbol.size=1
class <- classIntervals(plotvar, nclr, style="quantile")
colcode <- findColours(class, plotclr)
symbol.size <- ((plotvar-min(plotvar))/
                  (max(plotvar)-min(plotvar))*(max.symbol.size-min.symbol.size)
                +min.symbol.size)
points(orcountyp$Longitude, orcountyp$Latitude, pch=16, col=colcode,
       cex=symbol.size)
points(orcountyp$Longitude, orcountyp$Latitude, cex=symbol.size)
text(-120, 46.5, "Equal-Frequency Class Intervals")
legend(locator(1), legend=names(attr(colcode, "table")),
       fill=attr(colcode, "palette"), cex=0.6, bty="n")

# 5.  Basemaps using the maps package
# The maps package provides a means of constructing basemaps for plotting the locations of points, which can be decorated with text, symbols, and so on -- most of the things that be done on scatter plots.
# Plot the location of large cities  (Note:  These examples use the data.frame [cities2], which contains a column of country names, as opposed to cities.
# map of large cities
data(world.cities) # make the world cities location data set from the maps package available
# match the large cities with those in the database
m <- match(paste(tolower(as.character(cities2$City)),tolower(as.character(cities2$Country))),
           paste(tolower(world.cities$name),tolower(world.cities$country.etc)))
# assign the world.cities location information to the large cities
big.cities <- NULL
big.cities$name <- cities2$City
big.cities$long <- world.cities$long[m]
big.cities$lat <- world.cities$lat[m]
big.cities
# plot the map
map("world")
map.axes()
points(big.cities$long,big.cities$lat, col="blue")
text(big.cities$long, big.cities$lat, big.cities$name, col="red", cex=.5)
Projected maps of large cities
# map of large cities
m <- match(paste(tolower(as.character(cities2$City)),tolower(as.character (cities2$Country))),
           paste(tolower(world.cities$name),tolower(world.cities$country.etc)))
big.cities <- NULL
big.cities$name <- cities$City
big.cities$long <- world.cities$long[m]
big.cities$lat <- world.cities$lat[m]

# map projection information
proj.type <- "azequalarea"
proj.orient <- c(90,0,30)

# plot the map
map("world", proj=proj.type, orient=proj.orient, resolution=0, wrap=T)
map.grid(col="black", labels=F, lty=1)
proj.coords <- mapproject(big.cities$long,big.cities$lat, proj=proj.type, orient=proj.orient)
points(proj.coords, col="blue")
text(proj.coords, labels=big.cities$name, col="red", cex=1.25)
6.  Further examples illustrating map projection using the maps package
The maps package can provide projected base maps, which can provide less distorted views of a data set.  Here are some examples that plot the locations of the Oregon climate-station data
Unprojected maps
# unprojected
map("county", "oregon", fill=F)
points(orstationc$lon, orstationc$lat)
text(orstationc$lon, orstationc$lat, labels=orstationc$station, col="red",
     cex=.8)

# unprojected, add surrounding states
map("county", c("oregon","washington", "california", "nevada", "idaho"), xlim=c(-125,-116), ylim=c(41,47), fill=F)
map("state", "oregon", fill=F, col="grey", lwd=3, add=T)
points(orstationc$lon, orstationc$lat)
text(orstationc$lon, orstationc$lat, labels=orstationc$station, col="red",
     cex=.8)
Projected maps
# projected
proj.type <- "albers"
proj.stdlats <- c(29.5, 45.5)
proj.orient <- c(90,-120,0)
map("county", c("oregon","washington"), proj=proj.type, par=proj.stdlats, orient=proj.orient, fill=F)
orstationc.xy <- mapproject(orstationc$lon, orstationc$lat, proj=proj.type,
                            orient=proj.orient, par=proj.stdlats)
map("state", "oregon", proj=proj.type, par=proj.stdlats,
    orient=proj.orient, fill=F, col="grey", lwd=3, add=T)
points(orstationc.xy)
text(orstationc.xy, labels=orstationc$station, col="red", cex=.8)

# projected, whole US
proj.type <- "albers"
proj.stdlats <- c(29.5, 45.5)
proj.orient <- c(90,-100,0)
map("world", c("canada", "mexico"), proj=proj.type, par=proj.stdlats, orient=proj.orient, xlim=c(-130, -50), ylim=c(25,55), resolution=0, wrap=T)
map("state", proj=proj.type, par=proj.stdlats, orient=proj.orient, resolution=0, wrap=T, add=T)
map.grid(col="gray", labels=F, lty=2)
map("state", "oregon", proj=proj.type, par=proj.stdlats,
    orient=proj.orient, fill=F, col="grey", lwd=3, add=T)
orstationc.xy <- mapproject(orstationc$lon, orstationc$lat, proj=proj.type, par=proj.stdlats, orient=proj.orient)
points(orstationc.xy, col="blue")
7.  Basemap shapefile generation using the maps package
The map2SpatialLines() function in the maptools function can be used to transform lines extracted from the maps package into sp() package-compatible format to provide basemaps for plotting other data sets. Here is an example for the Pacific Northwest.
Extraction of a Pacific Northwest basemap
#library(maptools) # also loads sp package
#library(maps)

# extract county outlines from maps() database
pnw.outlines <- map("county", c("oregon","washington", "california",
                                "nevada", "idaho"),
                    xlim=c(-124.5, -116.0), ylim=c(41.0, 47.0))

# prune the lines to Washington, Oregon, and Northern California extent
pnw.outlines <- pruneMap(pnw.outlines, xlim=c(-125.0, -115.0), ylim=c(41.0,
                                                                      47.0))

# convert to sp lines
pnw.outlines.sp <- map2SpatialLines(pnw.outlines, proj4string=
                                      CRS("+proj=longlat"))

plot(pnw.outlines.sp, col="gray", lwd=2)
degAxis(1, at=seq(-125.,-116., by=1.))
degAxis(2, at=seq(42.,47., by=1.))

# project the outlines
aea.proj <- "+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5
+lon_0=-120 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m"
pnw.outlines.proj <- spTransform(pnw.outlines.sp, CRS(aea.proj))

# generate and project gridlines
grat <- gridlines(pnw.outlines.sp, easts=seq(-127,-115,by=1),
                  norths=seq(40,47,by=1), ndiscr = 20)
grat.proj <- spTransform(grat, CRS(aea.proj))

plot(pnw.outlines.proj, col="gray", lwd=2)
lines(grat.proj, col="blue", lty=3)



######################### ######################### ######################### 
#6. Fast Example
######################### ######################### ######################### 
install.packages("mapdata")
library(mapdata)    # the world database in the maps package
# probably isn't high enough resolution
> map("worldHires", "Germany")
> map.cities(country="Germany", minpop=1e6, capital=1)
> lines(world.cities[world.cities$name %in% c("Berlin", "Munich") & 
                       world.cities$country=="Germany", c("long", "lat")])


######################### ######################### ######################### 
#7. Wahlergebnisse - wie grün ist Deutschland?
######################### ######################### ######################### 
getwd()
setwd("g:/PIR/data/maps")
library(maptools)

wahlkreise.shp <- readShapePoly("wahlkreise.shp")
summary(wahlkreise.shp)

class(wahlkreise.shp)
class(wahlkreise.shp$WKR_NAME)

table(duplicated(wahlkreise.shp$WKR_NAME))["TRUE"]

wk_ergebnisse <- read.table("wk_ergebnisse.csv", skip=5, na.strings="", header=FALSE, sep=";", dec=".")
wk_ergebnisse[,3]
dim(wk_ergebnisse)
wk_ergebnisse <- wk_ergebnisse[-316,]
wk_ergebnisse[,3]
# in wk_ergebnisse stehen in [ 3] sowohl die Ergebnisse für die Bundesländer, als auch die Ergebnisse für die Landkreise
# wir benötigen die Teilmenge, die nicht die Ergebnisse für die ganze Menge enthält:
wk_ergebnisse_wahlkreise <- subset(wk_ergebnisse, wk_ergebnisse[,3]<20)
wk_ergebnisse_wahlkreise[,2]


## Prozentuales Plotting der Erst und Zweitstimmen der Grünen (=Spalte 36 und 38) im Verhältnis 
# zu Wählern Endgültig (Spalte 8) * 2 da ja jeder Wähler zwei Stimmen hat
gr_votes_pro <- (wk_ergebnisse_wahlkreise[,36]+wk_ergebnisse_wahlkreise[,38])/(wk_ergebnisse_wahlkreise[,8]*2)
names(gr_votes_pro) <- as.character(wk_ergebnisse_wahlkreise[,2])

gr_votes_pro
# Welche Levels sollte man wählen?! 5% Schritte bis 2% Schritte bis 30 und alles über 30?!
green_breaks <- c(seq(0,0.3,0.05), 1)
length(green_breaks)

# die Levels für die einzelnen
green_levels <- c("< 5%")
for(i in 2:6)
{
  green_levels[i] <- paste("< ", i*5, "%", sep="")
}
green_levels[7] <- "=> 30%"

green_levels
length(green_levels)

# Farben für die Levels:
myPalette<-brewer.pal(length(green_levels),"YlGn")


# Nun der Namen nach sortieren, damit die Listen später übereinstimmen!
(gr_votes_pro_sort <- gr_votes_pro[order(names(gr_votes_pro))])


gr_votes_pro_sort <-cut(gr_votes_pro_sort, breaks=green_breaks)
levels(gr_votes_pro_sort) <-green_levels
length(gr_votes_pro_sort)

wahlkreise.shp$green_votes <-gr_votes_pro_sort
# Problem der Wahlkreis Datei: zu viele Namen
# man sieht nun, dass in $WKR_NAME doppelte Einträge vorhanden sind... wie kann man diese finden und löschen?!
# NICHT PER HAND! -> duplicated()
?duplicated

duplicated(wahlkreise.shp$WKR_NAME)

#### neuen Vektor mit den Non Duplicated Wahlkreisen
wahlkreise.shp$WKR_NAME_ND <- c(wahlkreise.shp$WKR_NAME[!duplicated(wahlkreise.shp$WKR_NAME)], rep(NA, 384-299))

spplot(wahlkreise.shp, "WKR_NAME_ND", col.regions=myPalette, main="Deutsche Bundesländer",
       colorkey = FALSE, lwd=0, col="white")

#### Problem: Indizierung erfolgt über doppelte Werte; also: raussuchen, welche Namen doppelt sind 
# und diese an der richtigen Stelle am Ursprungsvektor gr_votes_pro einfügen! 

names(gr_votes_pro)
wahlkreise.shp$WKR_NAME[duplicated(wahlkreise.shp$WKR_NAME)]
gr_votes_pro

# Welche Werte haben diese doppelten Einträge? 
length(wahlkreise.shp$WKR_NAME)
length(gr_votes_pro)
names(gr_votes_pro) %in% wahlkreise.shp$WKR_NAME[duplicated(wahlkreise.shp$WKR_NAME)]
table(wahlkreise.shp$WKR_NAME[duplicated(wahlkreise.shp$WKR_NAME)] %in% names(gr_votes_pro))["TRUE"]
# gut: alle 85 fehlenden Einträge kommen irgendwie doppelt vor: 
# man muss nun diese 85 fehlenden Einträge irgendwie doppelt hinschreiben: Problem, manche kommen öfters als nur doppelt vor! 


# am schnellsten: schreibe Funktion, die für jeden Wahlkreis checkt, wie oft er vorkommt und dann Werte usw nochmal reinkopiert:
# x = Vektor, dessen Namen (!) mit denen von y verglichen werden und je nachdem wie oft er 
# in y vorkommt, die gleiche Werte von y hinzugenommen werden
checkDuplicatesAndAdd <- function(x,y)
{ 
  first_length_of_x <- length(x)
  for (i in 1:first_length_of_x)
  {
    # falls ein Name in y auftaucht
    if(names(x)[i] %in% y)
    {
      # checke, wie oft er auftaucht! 
      counter <- table(y %in% names(x)[i])["TRUE"]
      # und füge ihn dann counter-1-oft am Ende hinzu, falls er größer als 1 ist
      if(counter>1)
      {
        for(j in 1:(counter-1))
        {
          # füge den Wert des mehrfachen x-Werts neu ein
          x[length(x)+j]<- x[i]
          # und den Namen dieser neuen Stelle mit dem Namen der alten Stelle
          names(x)[length(names(x))]<- names(x)[i]
        }
      }
    }
  }
  x <- na.omit(x)
  return(x)
}

# Funktionstest:
xx<- c(1,2,3)
names(xx) <- c("a", "b", "c")
y <- c("a", "a", "a", "b", "b", "c")
test <- checkDuplicatesAndAdd(xx,y)
test
# nun richtig: 
test <- checkDuplicatesAndAdd(gr_votes_pro,wahlkreise.shp$WKR_NAME)

# plotten: 
length(test)
# hier fügen wir 3 Werte mti ein, da oben die funktion nicht gut genug klappte
sort_1 <- c(test[order(names(test))], rep(0.01, 3))
gr_votes_pro_sort <-cut(sort_1, breaks=green_breaks)
levels(gr_votes_pro_sort) <-green_levels
gr_votes_pro_sort


# Farben für die Levels:
levels(gr_votes_pro_sort)
length(green_levels)
myPalette<-brewer.pal(length(green_levels),"YlGn")
#myPalette <- rev(myPalette)

# jetzt noch wahlkreise.shp sortieren
wahlkreise.shp_ordered <- wahlkreise.shp[order(wahlkreise.shp$WKR_NAME), ]
# hinzufügen des Vektors
wahlkreise.shp_ordered$green_votes <-gr_votes_pro_sort

spplot(wahlkreise.shp_ordered, "green_votes", col.regions=myPalette, main="Wie grün ist Deutschland?",
       colorkey = FALSE, lwd=0, col="white")


### Ohne Aussage:
wahlkreise.shp$WKR_NAME[!duplicated(wahlkreise.shp$WKR_NAME)]
spplot(wahlkreise.shp, "WKR_NAME", col.regions=myPalette, main="Deutsche Bundesländer",
       colorkey = FALSE, lwd=0, col="white")
