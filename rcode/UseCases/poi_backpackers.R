# POI for bakpackers
# Jan-Philipp Kolb


#-------------------------------#
# Libraries
#-------------------------------#

library(XML)
library(geosmdata2)
library(ggmap)


objL <- c("hostel","hotel","museum","attraction")

place <- "Amsterdam"

setwd(data.path)
saveXML(xml1,file=paste(place,"_",objL[i],".xml",sep=""))

DF <- list()

for (i in 1:length(objL)){
  xml1 <- xmlParse(paste(place,"_",objL[i],".xml",sep=""))
  info <- extract_info_op(xml1,objL[i])
  
  DF[[i]] <- data.frame(website=info$website,
                        name=info$name,
                        POI=objL[i],
                        plz=info$addr.postcode,
                        lat=info$lat,
                        lon=info$lon)
  
}

DFa <- do.call(rbind, DF)

#-------------------------------#
# Get the map
#-------------------------------#

qmap12 <- qmap(place, zoom = 12,
               maptype="toner-lite",source="stamen")

qmap_tl14 <- qmap(place, zoom = 14,maptype="terrain-lines",
                  source="stamen")

setwd(graph.path)
png(paste(place,"_qmap_tl14.png",sep=""))
qmap_tl14
dev.off()


png(paste(place,"_tourism_tonerlite12.png",sep=""))
qmap_tl14 + geom_point(aes(x = lon, y = lat,col=POI),
                       data = DFa,size=3) 
dev.off()


png(paste(place,"_tourism_tonerlite12.png",sep=""))
qmap12 + geom_point(aes(x = lon, y = lat,col=mapvalue),
                    data = DFa,size=5,alpha=.5) 
dev.off()

qmap12 + geom_point(aes(x = lon, y = lat,col=mapvalue),
                    data = DFa[DFa$mapvalue=="hostel",],size=5,alpha=.5)


