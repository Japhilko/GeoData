# Spatial Visualisations
# Eurostat maps
# Jan-Philipp Kolb
# Tue Oct 13 08:30:11 2015



#--------------------------------#
# Libraries
#--------------------------------#

library(maptools)
library(xlsx)

# Add On library to produce LateX table
library(xtable)
#--------------------------------#
# Set path
#--------------------------------#

main.path <- "J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/Folien/EurostatMaps/"
graph.path <- paste(main.path,"figure/",sep="")
data.path <- paste(main.path,"data/",sep="")

#--------------------------------#
# Load data
#--------------------------------#

setwd(data.path)
GDP <- read.xlsx("eurostatGDP.xls",1)

head(GDP)

xtable(GDP[1:5,1:4])

#--------------------------------#
# Get the map
#--------------------------------#

data(wrld_simpl)
EUR <- wrld_simpl[wrld_simpl$REGION==150,]
EUR <- EUR[-which(EUR@data$NAME=="Russia"),]

setwd(graph.path)
pdf("EURmap.pdf")
plot(EUR)
dev.off()

#--------------------------------#
# Match data and map
#--------------------------------#

ind <- match(EUR$NAME,GDP[,1])
EUR@data$GDP <- as.numeric(as.character(GDP[ind,2]))

setwd(graph.path)
pdf("EURmapGDP.pdf")
spplot(EUR,"GDP")
dev.off()
