# Maps for Europe
# 27.02.2015
# Jan-Philipp Kolb
# Data sources


#-----------------------------------------------#
# Libraries
#-----------------------------------------------#


library(SmarterPoland)
library(ggplot2)
library(reshape2)
library(rgdal)

#-----------------------------------------------#
# Example maps for Europe
#-----------------------------------------------#

# http://markuskainu.fi/r-tutorial/eurostat/spatial.html
df <- getEurostatRaw(kod = "ilc_mddd21")
names(df) <- c("xx", 2011:2003)

df$unit <- lapply(strsplit(as.character(df$xx), ","), "[", 1)
df$geo.time <- lapply(strsplit(as.character(df$xx), ","), "[", 2)

df.l <- melt(data = df, id.vars = "geo.time", measure.vars = c("2003", "2004","2005", "2006", "2007", "2008", "2009", "2010", "2011"))

df.l$geo.time <- unlist(df.l$geo.time)  # unlist the geo.time variable

download.file("http://epp.eurostat.ec.europa.eu/cache/GISCO/geodatafiles/NUTS_2010_60M_SH.zip",destfile = "NUTS_2010_60M_SH.zip")

# unzip to SpatialPolygonsDataFrame
unzip("NUTS_2010_60M_SH.zip")

map <- readOGR(dsn = "./NUTS_2010_60M_SH/Data", layer = "NUTS_RG_03M_2010")


#-----------------------------------------------#
# Shapefiles
#-----------------------------------------------#

# shapefiles with NUTS ID

# http://markuskainu.fi/r-tutorial/eurostat/spatial.html

#-----------------------------------------------#
# Europe
#-----------------------------------------------#


# https://cohesiondata.ec.europa.eu/

#-----------------------------------------------#
# World
#-----------------------------------------------#

# http://datahub.io/

# http://visualizing.org/data/browse