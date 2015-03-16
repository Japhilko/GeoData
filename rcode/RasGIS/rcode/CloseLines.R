# Close lines
# Jan-Philipp Kolb
# Mon Mar 16 10:46:03 2015


#------------------------#
# Libraries
#------------------------#


library(maptools)
library(rgdal)
library(Grid2Polygons)


#------------------------#
# Set paths
#------------------------#


data.path <- "D:/Daten/Daten/GeoDaten/georefum"

adm.path <- "D:/Daten/Daten/GeoDaten/DEU_adm"

#------------------------#
# Get data
#------------------------#

setwd(data.path)
# http://cdr.eionet.europa.eu/de/eu/noise/df8/colvi7k8q
RLP <- readOGR("DE_RP_ag1_Aggroad_Lden.shp","DE_RP_ag1_Aggroad_Lden")

#------------------------#
# Close lines
#------------------------#


coords_df <- list()

for (i in 1:length(RLP)){
  coords_df_i <- RLP@lines[[i]]@Lines[[1]]@coords 
  erg <- sum(coords_df_i[1,]-  coords_df_i[nrow(coords_df_i),])
  if(erg!=0){
    coords_df[[i]] <- Polygons(list(Polygon(rbind(coords_df_i,coords_df_i[1,]))),i)
  }else{
    coords_df[[i]] <- Polygons(list(Polygon(coords_df_i)),i)
  }
  cat(i , "\n")
}

SPs = SpatialPolygons(coords_df)

SPDF = SpatialPolygonsDataFrame(SPs, data.frame(NAME = RLP@data$NAME, row.names = 1:length(coords_df)))


Cnames <- colnames(RLP@data)

for (i in 2:length(Cnames)){
  eval(parse(text=paste("SPDF$",Cnames[i],"<-RLP$",Cnames[i],sep="")))  
}


#------------------------#
# Control
#------------------------#

i <- 1

i<- i+1
plot(SPDF[i,])

#------------------------#
# Links
#------------------------#

# http://www.maths.lancs.ac.uk/~rowlings/Teaching/UseR2012/cheatsheet.html
