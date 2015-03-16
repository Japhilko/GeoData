# Maps for Europe
# 27.02.2015 - update Mon Mar 16 10:54:28 2015
# Jan-Philipp Kolb
# Belgium


#-----------------------------------------------#
# Libraries
#-----------------------------------------------#

library(raster)

#-----------------------------------------------#
# Get map with R-package raster
#-----------------------------------------------#

  # NUTS-level 1 for Belgium from 
  # http://www.gadm.org/

BEL1 <- getData('GADM', country='BEL', level=1)

  # NUTS 4 level
BEL4 <- getData('GADM', country='BEL', level=4)


#-----------------------------------------------#
# Plot the map
#-----------------------------------------------#

plot(BEL4)

  # with color

plot(BEL4,col="royalblue")

  # get an overview of the data behind:

head(BEL4@data)


#-----------------------------------------------#
# Get map from Eurostat
#-----------------------------------------------#

library(rgdal)

  # http://rpubs.com/adam_dennett/8955

temp <- tempfile(fileext = ".zip")

  # download
download.file("http://epp.eurostat.ec.europa.eu/cache/GISCO/geodatafiles/NUTS_2010_60M_SH.zip", 
              temp)

  # unzip and load data
map <- readOGR(dsn="NUTS_RG_03M_2010.shp",layer="NUTS_RG_03M_2010")

ind <- grepl('BE',map@data$NUTS_ID)

BE <- map[ind,]

#-----------------------------------------------#
# Get data
#-----------------------------------------------#

# Download for example from:
# https://cohesiondata.ec.europa.eu/dataset/GDP-Per-Head-2011-PPS-/j8wb-jxec?

Dat <- read.csv("GDP_Per_Head_2011__PPS_.csv")

Names <- substr(Dat$NUTS.ID,1,2)
ind2 <- which(Names=="BE")

Dat_BE <- Dat[ind2,]

ind3 <- match(Dat_BE$NUTS.ID,BE$NUTS_ID)

BE3 <- BE[ind3,]

BE3$IPPS28.2011 <- Dat_BE$IPPS28.2011

spplot(BE3,"IPPS28.2011")


