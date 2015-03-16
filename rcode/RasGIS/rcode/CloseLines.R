# http://cdr.eionet.europa.eu/de/eu/noise/df8/colvi7k8q

library(maptools)
library(rgdal)
library(Grid2Polygons)

data.path <- "D:/Daten/Daten/GeoDaten/georefum"

adm.path <- "D:/Daten/Daten/GeoDaten/DEU_adm"


setwd(data.path)

RLP <- readOGR("DE_RP_ag1_Aggroad_Lden.shp","DE_RP_ag1_Aggroad_Lden")

setwd(adm.path)
DEU <- readShapePoly("DEU_adm3.shp")

class(DEU)

coords_df <- list()

for (i in 1:length(RLP)){
  coords_df[[i]] <- RLP@lines[[i]]@Lines[[1]]@coords 
  cat(i , "/n")
}

erg <- vector()
for(i in 1:length(coords_df)){
  dfi <- coords_df[[i]]
  erg[i] <- sum(dfi[1,]-  dfi[nrow(dfi),])
}

ind <- which(erg!=0)

RLP@lines[[ind[1]]]@Lines[[1]]@coords


#------------------------#
# Links
#------------------------#


# http://www.maths.lancs.ac.uk/~rowlings/Teaching/UseR2012/cheatsheet.html
