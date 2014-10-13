##############################################################
# UseR - Georeferencing
# Jan-Philipp Kolb
# 12.06.2014
#
# First picture
#
##############################################################


#------------------------------------------------------------#
# General information
#------------------------------------------------------------#

scriptname <- "UseRgeo_A_firstpicture.R"
author <- "Jan-Philipp Kolb"

#------------------------------------------------------------#
# libraries
#------------------------------------------------------------#

library(ggmap)


#------------------------------------------------------------#
# path
#------------------------------------------------------------#

main.path <- "J:/Work/Statistik/Kolb/Vorträge/20140630_UseR_LA/"

graph.path <- paste(main.path,"/Folien/figure/",sep="")


#------------------------------------------------------------#
# Use of qmap to create first picture
#------------------------------------------------------------#


LA4 <- qmap("UCLA Los Angeles",zoom=16,
            maptype = 'satellite')


setwd(graph.path)
png("UseRgeo_LA4.png")
plot(LA4)
dev.off()

