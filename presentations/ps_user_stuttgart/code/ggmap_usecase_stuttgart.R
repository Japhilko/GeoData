# Das Paket ggmap
# Jan-Philipp Kolb
# Tue Nov 21 15:35:10 2017

library(ggmap)

graph.path <- "D:/Daten/GitHub/GeoData/presentations/ps_user_stuttgart/figure"
setwd(graph.path)

png("Stuttgart.png")
qmap("Stuttgart")
dev.off()

png("Germany.png")
qmap("Germany")
dev.off()

png("Germany6.png")
qmap("Germany", zoom = 6)
dev.off()


WIL <- qmap("Wilhelma",zoom=20, maptype="satellite")

png("Wilhelma.png")
WIL
dev.off()

png("Stuttgart_Hauptbahnhof.png")
qmap('Stuttgart Hauptbahnhof', zoom = 15, maptype="hybrid")
dev.off()

png("Stuttgart_Fernsehturm.png")
qmap('Stuttgart-Fernsehturm', zoom = 14,
     maptype="terrain")
dev.off()

png("Stuttgart_wc.png")
qmap('Stuttgart', zoom = 14,
     maptype="watercolor",source="stamen")
dev.off()

png("Stuttgart_stamen.png")
qmap('Stuttgart', zoom = 14,
     maptype="toner",source="stamen")
dev.off()

png("Stuttgart_tonerlite.png")
qmap('Stuttgart', zoom = 14,
     maptype="toner-lite",source="stamen")
dev.off()

png("Stuttgart_tonerhybrid.png")
qmap('Stuttgart', zoom = 14,
     maptype="toner-hybrid",source="stamen")
dev.off()


png("Stuttgart_terrainlines.png")
qmap('Stuttgart', zoom = 14,
     maptype="terrain-lines",source="stamen")
dev.off()




POI1 <- geocode("B2, 1 Mannheim",source="google")
POI2 <- geocode("Hbf Mannheim",source="google")
POI3 <- geocode("Mannheim, Friedrichsplatz",source="google")
ListPOI <-rbind(POI1,POI2,POI3)
POI1;POI2;POI3

MA_map <- qmap("Mannheim",zoom=15)

png("MA_map.png")
MA_map +
  geom_point(aes(x = lon, y = lat),
             data = ListPOI)
dev.off()

png("MA_mapred.png")
MA_map +
  geom_point(aes(x = lon, y = lat),col="red",
             data = ListPOI)
dev.off()

png("MA_map_tc.png")
ListPOI$color <- c("A","B","C")
MA_map +
  geom_point(aes(x = lon, y = lat,col=color),
             data = ListPOI)
dev.off()



from <- "Mannheim Hbf"
to <- "Mannheim B2 , 1"
route_df <- route(from, to, structure = "route")


png("MA_map_route.png")
qmap("Mannheim Hbf", zoom = 14) +
  geom_path(
    aes(x = lon, y = lat),  colour = "red", size = 1.5,
    data = route_df, lineend = "round"
  )
dev.off()
