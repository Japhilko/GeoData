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

# https://www.fbi.gov/about-us/cjis/ucr/crime-in-the-u.s/2012/crime-in-the-u.s.-2012/tables/8tabledatadecpdf/table-8-state-cuts/table_8_offenses_known_to_law_enforcement_by_california_by_city_2012.xls
setwd(data.path)
murders <- read.xlsx("California Murder Rate 2012.xlsx",1)

gadm <- getData('GADM', country='USA', level=2)

#--------------------------------#
# Edit data
#--------------------------------#

California <- gadm[gadm$NAME_1=="California",]

ind <- match(murders[,1],California$NAME_2)

California@data$Murders2012 <- murders[ind,2]

#--------------------------------#
# Plot data
#--------------------------------#

spplot(California,"Murders2012")

#--------------------------------#
# link
#--------------------------------#

# http://www.disastercenter.com/crime/cacrime.htm