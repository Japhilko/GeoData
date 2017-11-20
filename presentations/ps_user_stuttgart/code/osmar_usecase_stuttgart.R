# Jan-Philipp Kolb
# Fri Nov 17 14:10:34 2017

datapath <- "D:/Daten/GitHub/GeoData/presentations/ps_user_stuttgart/data/"
graphpath <- "D:/Daten/GitHub/GeoData/presentations/ps_user_stuttgart/figure"



# bounding box for Stuttgart

library(devtools)
library(osmar) 
library(ggmap)


src <- osmsource_api()

# Get the geocode

gc <- geocode("Stuttgart")

bb <- center_bbox(gc$lon, gc$lat, 800, 800)
ua <- get_osm(bb, source = src)

setwd(datapath)
save(ua,file="ua_SG_cc.RData")
# save(ua,file="ua_SG_Degerloch.RData")


setwd(graphpath)
png("ua_SG.png")
plot(ua)
dev.off()


# way_types <- c("pedestrian","motorway","primary","secondary","tertiary","residential")
way_types <- c("pedestrian","primary","secondary","tertiary","residential")

for (i in 1:length(way_types)){
  osm_obj <- find(ua, way(tags(k == "highway" & v == way_types[i])))
  osm_obj <- find_down(ua, way(osm_obj))
  osm_obj <- subset(ua, ids = osm_obj)
  eval(parse(text=paste0(way_types[i],"_sp <- as_sp(osm_obj,'lines')")))
}

bg_ids <- find(ua, way(tags(k=="building")))
bg_ids <- find_down(ua, way(bg_ids))
bg <- subset(ua, ids = bg_ids)
bg_poly <- as_sp(bg, "polygons")  

setwd(graphpath)
png("SG_streets.png")
par(mai=c(0,0,0,0))
plot(bg_poly)
plot(pedestrian_sp,add=T,col="red")
plot(primary_sp,add=T,col="blue")
plot(secondary_sp,add=T,col="purple")
plot(tertiary_sp,add=T,col="chocolate1")
plot(residential_sp,add=T,col="yellow")
dev.off()

############################################

SF_info <- geocode_osm("San Francisco",output="all")
coord <- as.numeric(c(SF_info$boundingbox[c(3,1)],SF_info$boundingbox[c(4,2)]))
bb_mas <- array(coord,dim=c(2,2))

Dist_m_x <- distm(bb_mas[,1],c(bb_mas[1,2],bb_mas[2,1]))
# ca 5 km
Dist_m_y <- distm(bb_mas[,1],c(bb_mas[1,1],bb_mas[2,2]))
Dist <- apply(bb_mas,1,diff) 


v_dist <- 10
xstep <- seq(bb_mas[1,1],bb_mas[1,2],by=Dist[1]/v_dist)
ystep <- seq(bb_mas[2,1],bb_mas[2,2],by=Dist[2]/v_dist)

poinTs <- expand.grid(xstep,ystep)


# 9
setwd(sfpath)

for (i in 10:nrow(poinTs)){
  bb22 <- center_bbox(poinTs[i,1],poinTs[i,2],Dist_m_x/v_dist, Dist_m_y/v_dist)
  ua=get_osm(bb22, source = api)
  eval(parse(text=paste("save(ua,file='uaSF_",i,".RData')",sep="")))
  cat(i, "von ",nrow(poinTs),"\n")
}

#-------------------------#
# Links

# http://wiki.openstreetmap.org/wiki/OSM_Scientific_Tools