# Jan-Philipp Kolb
# Mon Nov 20 14:33:00 2017

library(maptools)

graph.path <- "D:/Daten/GitHub/GeoData/presentations/ps_user_stuttgart/figure/"
setwd(graph.path)

data("wrld_simpl")

plot(wrld_simpl[wrld_simpl$ISO3=="POL",],col="royalblue")

plot(wrld_simpl[wrld_simpl$ISO3=="AUS",],col="chocolate1")

plot(wrld_simpl[wrld_simpl$ISO3=="FIN",],col="darkblue")

plot(wrld_simpl[wrld_simpl$ISO3=="PRT",],col="coral4")

####


setwd("D:/Daten/Daten/GeoDaten/")

onb <- readShapePoly("onb_grenzen.shp")
plot(onb[onb$NAME=="Stuttgart",],col="chartreuse3")
