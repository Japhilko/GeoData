# Jan-Philipp Kolb
# Tue Nov 21 15:00:08 2017


# http://ec.europa.eu/eurostat/web/euro-indicators/peeis

library(xlsx)
library(maptools)
library(sp)

data("wrld_simpl")

setwd("J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/Folien/dataImport/data/")

HHsr <- read.xlsx2("HHsavingRate.xls",1)
ind <- match(HHsr$geo,wrld_simpl@data$NAME)
ind <- ind[-which(is.na(ind))]

EUR <- wrld_simpl[ind,]

EUR@data$HHSR_2012Q3 <- as.numeric(as.character(HHsr[-(1:2),2]))
EUR@data$HHSR_2015Q2 <- as.numeric(as.character(HHsr[-(1:2),13]))

spplot(EUR,c("HHSR_2012Q3","HHSR_2015Q2"))
