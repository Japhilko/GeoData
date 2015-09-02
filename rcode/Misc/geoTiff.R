
# http://www.inside-r.org/packages/cran/mapplots/docs/geoTiff

library(mapplots)
library(rgdal)
data(landings)
data(coast)
byx = 1
byy = 0.5
xlim <- c(-15.5,0)
ylim <- c(50.25,56)
grd <- make.grid(landings$Lon, landings$Lat, landings$LiveWeight, byx, byy, xlim, ylim)
breaks <- breaks.grid(grd,zero=FALSE)
basemap(xlim, ylim, main = 'Gadoid landings')
draw.grid(grd,breaks)
draw.shape(coast, col='darkgreen')
legend.grid('topright', breaks=breaks/1000, type=2)


#---------------------------------#
# Links
#---------------------------------#

# http://www.inside-r.org/packages/cran/mapplots/docs/geoTiff