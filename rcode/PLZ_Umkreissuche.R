# PLZ Umkreissuche
# Jan-Philipp Kolb
# Fri May 21 17:21:15 2021


data_path <- "C:/Arbeit/data/plz-gebiete.shp/"
plz_path <- "C:/Arbeit/GESIS/presentations/20151101_LifBi_Georeferenzierung/data/KiTaData/"
graph_path <- "C:/github/GeoData/presentations/"


# R Pakete laden ----------------------------------------------------------


library(maptools)
library(sp)
library(raster)


# PLZ Bereiche einlesen ---------------------------------------------------

# Quelle: https://www.suche-postleitzahl.org/downloads

plz <- readShapePoly(paste0(data_path,"plz-gebiete.shp"))
# spplot(plz)

plz6 <- plz[substr(plz@data$plz,1,1)==6,]

p6 <- coordinates(plz6)

distances <- pointDistance(p6,lonlat = F)

p_color <- distances[1,]

p_color <- p_color/max(p_color,na.rm = T)

p_color <- rgb(0,0,p_color)


pdf(paste0(graph_path,"plz_umkreis.pdf"))
  plot(plz6,col=p_color,border="lightgray")
dev.off()




# Links -------------------------------------------------------------------

# https://github.com/Japhilko/GeoData/blob/master/2017/slides/spdep.pdf
                     