##################################
# Spatial Mannheim
# Jan-Philipp Kolb
# 03.11.2014
#
# Advanced Visualisations
#
##################################

#--------------------------------#
# Load libraries
#--------------------------------#


library(rgdal)
library(maptools)
library(XML)
library(xlsx)

#--------------------------------#
# Define paths
#--------------------------------#

graph.path <- "D:/Dropbox/RForschung/SpatialMannheim/Rslides/SpatialMA_D_AdvancedVis/figure"

data.path <- "D:/Dropbox/RForschung/SpatialMannheim/data"

data.path2 <- "D:/Daten/GeoDaten/primary_care_trusts_2009/"

graph.path <- "C:/Users/Kolb/Dropbox/RForschung/SpatialMannheim/Rslides/SpatialMA_D_AdvancedVis/figure"

#--------------------------------#
# Webscraping Wikipedia
#--------------------------------#

u = "http://de.wikipedia.org/wiki/Land_%28Deutschland%29"
tables = readHTMLTable(u)
TabBL <- tables[[1]]

  # but we have the problem with the commas:

EW <- as.character(TabBL[,10])
EW <- gsub(",","",EW)
EW <- as.numeric(EW)

#--------------------------------#
# Load shapefile for Germany
#--------------------------------#

con <- url("http://gadm.org/data/rda/DEU_adm1.RData")
print(load(con))
close(con)
DEU <- gadm

#--------------------------------#
# A little Editing
#--------------------------------#

BLn <- substr(DEU$HASC_1,4,5)
ind <- match(BLn,TabBL[,3])
ind[4] <- 4
DEU$EW <- EW[ind]

match(c(1,2,3),c(2,1,3))


#--------------------------------#
# Plot the results
#--------------------------------#

setwd(graph.path)
png("spplotEW.png")
spplot(DEU,"EW")
dev.off()


#--------------------------------#
# Census results
#--------------------------------#

# Download data from:

# https://ergebnisse.zensus2011.de/#dynTable:

setwd(data.path)
TabC <- read.xlsx("TabCensus.xlsx",1)
DEU$LQ <- TabC[,3]

setwd(graph.path)
png("spplotLQ.png")
spplot(DEU,"LQ")
dev.off()

#--------------------------------#
# A map of Europe
#--------------------------------#

data(wrld_simpl)

country2001 <- c("Austria", "Belgium", "Switzerland","Czech Republic", "Germany", "Denmark", "Spain", "Finland", "France","United Kingdom", "Greece", "Hungary", "Ireland", "Israel", "Italy","Luxembourg", "Netherlands", "Norway", "Poland", "Portugal","Sweden", "Slovenia")

ind <- match(country2001,wrld_simpl$NAME)
Europe <- wrld_simpl[ind,]

setwd(graph.path)
png("Europe.png")
plot(Europe)
dev.off()

 # data from:
# http://epp.eurostat.ec.europa.eu/portal/page/portal/statistics/search_database

setwd(data.path)
DatE <- read.xlsx("demo_pjan.xls",1)

DatE$GEO.TIME <- as.character(DatE$GEO.TIME)
DatE$GEO.TIME[11] <- "Germany"

ind2 <- match(Europe$NAME,DatE$GEO.TIME)

Europe$Pop <- as.numeric(as.character(DatE$X2013[ind2]))

setwd(graph.path)
png("EuropePop.png")
spplot(Europe,"Pop")
dev.off()


setwd(graph.path)
png("EuropePop2.png")
spplot(Europe,"Pop",col.regions=rainbow(100))
dev.off()


#--------------------------------#
# Dot map with airports
#--------------------------------#


setwd("C:/Users/Kolb/Dropbox/RForschung/SpatialMannheim/data")

# http://www.milanor.net/blog/?p=594

air <- read.table("airports.dat",sep=",")
colnames(air) <- c("ID", "name", "city", "country", "IATA_FAA", "ICAO", "lat", "lon", "altitude", "timezone", "DST","WE")

airG <- air[air$country=="Germany",]

setwd(graph.path)
png("DEU_air.png")
plot(DEU)
points(airG$lon, airG$lat, col = "red", cex = .6)
dev.off()
