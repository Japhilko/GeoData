
graph.path <- "J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/paper/figure"
graph.path <- "C:/Users/kolbjp/Documents/GitHub/GeoData/data/figure"

data.path <- "D:/Daten/Daten/GeoDaten/"

data.path.ALG <- paste(data.path,"ALG-0_admin_SHP/",sep="")
data.path.gm <- paste(data.path,"gm/",sep="")

setwd("C:/Users/kolbjp/Documents/GitHub/GeoData/rcode/SpatialMA/2015")

library(rgdal)

#----------------------------#
# World Port Index
#----------------------------#


# http://msi.nga.mil/NGAPortal/MSI.portal?_nfpb=true&_st=&_pageLabel=msi_portal_page_62&pubCode=0015
setwd("D:/Daten/Daten/GeoDaten/WPI_Shapefile")
WPI <- readOGR(".","WPI")

head(WPI@data)
WPI@data$COUNTRY <- as.character(WPI@data$COUNTRY)
WPI@data$COUNTRY[is.na(WPI@data$COUNTRY)] <- "Other"

setwd(graph.path)
png("WorldPortIndex.png")
  plot(WPI[WPI@data$COUNTRY=="IT",])
dev.off()

#----------------------------#
# GEOnet Names Server
#----------------------------#

# http://geonames.nga.mil/gns/html/namefiles.html
setwd(data.path.gm)
gm <- read.delim("gm.txt")

setwd(graph.path)
png("Geonames_Germany.png")
plot(gm$LONG,gm$LAT,pch=20,col=rgb(0,0,1,.005),xlim=c(5,17),ylim=c(47,56))
dev.off()

#----------------------------#
# Geonames project
#----------------------------#

library(XML)
link <- "http://www.geonames.org/statistics/"

Tab <- readHTMLTable(link)
Tab1 <- Tab[[2]]

#----------------------------#
# The Map Library
#----------------------------#

# http://www.mapmakerdata.co.uk.s3-website-eu-west-1.amazonaws.com/library/
setwd(data.path.ALG)
ALG <- readOGR(".","ALG-0")

plot(ALG,col="blue")

#----------------------------#
# Links
#----------------------------#

# http://wiki.openstreetmap.org/wiki/Potential_Datasources

# https://landeco2point0.wordpress.com/2013/09/27/things-i-forget-reading-a-shapefile-in-r-with-readogr/