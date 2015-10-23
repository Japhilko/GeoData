# Spatial Visualisations
# Work with geoTiffs
# Mon Oct 12 08:21:13 2015

# script is based on 
# https://downwithtime.wordpress.com/2013/12/04/naturalearthdata-and-r-in-ggplot2/

#---------------------------------------------#
# Libraries
#---------------------------------------------#

library(raster)
library(rgdal)
library(ggplot2)
library(reshape2)
library(plyr)

#---------------------------------------------#
# Set paths
#---------------------------------------------#

data.path <- "D:/Daten/Daten/GeoDaten/Maps/"
data.path2 <- "D:/Daten/Daten/GeoDaten/Maps/SR_50M"

#---------------------------------------------#
# Read data
#---------------------------------------------#

setwd(data.path2)

nat.earth <- stack('SR_50M.tif')

setwd(data.path)
ne_land <- readOGR('ne_50m_land.shp',
                    'ne_50m_land')

#---------------------------------------------#
# Subset data
#---------------------------------------------#


#  I have a domain I'm interested in, but there's no reason you can't define something else:
quick.subset <- function(x, longlat){
  
  # longlat should be a vector of four values: c(xmin, xmax, ymin, ymax)
  x@data$id <- rownames(x@data)
  
  x.f = fortify(x, region="id")
  x.join = join(x.f, x@data, by="id")
  
  x.subset <- subset(x.join, x.join$long > longlat[1] & x.join$long < longlat[2] &
                       x.join$lat > longlat[3] & x.join$lat < longlat[4])
  
  x.subset
}

domain <- c(-98.6, -66.1, 36.5, 49.7)
land.subset <- quick.subset(ne_land, domain)

#---------------------------------------------#
# Make a map
#---------------------------------------------#


nat.crop <- crop(nat.earth, y=extent(domain))

rast.table <- data.frame(xyFromCell(nat.crop, 1:ncell(nat.crop)),
                         getValues(nat.crop/255))

rast.table$rgb <- with(rast.table, rgb(SR_50M,
                                       1,
                                       1,
                                       1))

ggplot(data = rast.table, aes(x = x, y = y)) +
  geom_tile(fill = rast.table$rgb) +
  geom_polygon(data=land.subset, aes(x = long, y = lat, group = group), fill = '#ADD8E6') +
  scale_alpha_discrete(range=c(1,0)) 

