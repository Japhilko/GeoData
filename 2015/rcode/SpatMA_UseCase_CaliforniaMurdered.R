##################################
# Spatial Mannheim
# Jan-Philipp Kolb
# 24.11.2014
#
# Choropleths - California murder rates
#
##################################


#--------------------------------#
# Libraries
#--------------------------------#

library(sp)
library(maptools)
library(xlsx)
library(raster)

#--------------------------------#
# Set path
#--------------------------------#

data.path <- "D:/Dropbox/RForschung/SpatialMannheim/data"


#--------------------------------#
# Read data
#--------------------------------#

data(wrld_simpl)

setwd(data.path)
murders <- read.xlsx("California Murder Rate 2012.xlsx",1)


  # http://www.gadm.org/download
# (load("USA_adm2.RData"))

gadm <- getData('GADM', country='USA', level=2)

#--------------------------------#
# Edit data
#--------------------------------#

California <- gadm[gadm$NAME_1=="California",]

ind <- match(murders[,1],California$NAME_2)

California@data$Murders2012 <- murders[ind,2]
California@data$Color.Code <- murders[ind,3]

#--------------------------------#
# Save data
#--------------------------------#

save(California,file="California.RData")

#--------------------------------#
# Plot data
#--------------------------------#

plot(California,col=California$Color.Code)


spplot(California,"Murders2012")

#--------------------------------#
# Read data
#--------------------------------#

load("California.RData")