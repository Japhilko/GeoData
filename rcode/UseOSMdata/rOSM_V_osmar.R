
library("osmar")

data.path <- "J:/Work/Statistik/Kolb/Paper/UseOSMdata/data/XML"

setwd(data.path)


sipp <- get_osm(complete_file(), source = osmsource_file("Sippersfeld.osm"))


hways_sipp <- subset(sipp,
                    way_ids = find(sipp, way(tags(k == "highway"))))
hways <- find(hways_sipp, way(tags(k == "name")))
hways <- find_down(sipp, way(hways))
hways_sipp <- subset(sipp, ids = hways)
hways_sipp


plot_nodes(sipp, col = "gray")
plot_ways(hways_sipp, add = TRUE)
plot_nodes(hways_sipp, add = TRUE, col = "black")


plot_ways(hways_sipp)

#------------------------------------------------------------#

rest_IH <- xmlParse("http://www.overpass-api.de/api/interpreter?data=
                                area[name=\"Ilvesheim\"];node(area)
                    [amenity=restaurant];out;")

saveXML(rest_IH,file="rest_IH.XML")
library("osmar")
ilv <- get_osm(complete_file(), source = osmsource_file("rest_IH.XML"))

rest <- find(ilv, node(tags(k == "amenity")))

plot_nodes(ilv,col = "red")

#------------------------------------------------------------#

# Grenzen für Deutschland
# wiki.openstreetmap.org/wiki/WikiProject_Germany/

bound <- get_osm(complete_file(), source = osmsource_file("62422.xml"))
bound_MA <- find(bound, relation(tags(k == "boundary")))
bg_ids <- find_down(bound, relation(bound_MA))
bg <- subset(bound, ids = bg_ids)
bg

#------------------------------------------------------------#

# https://help.openstreetmap.org/questions/20531/overpass-ql-nodes-and-ways-in-area


link3 <- "http://overpass-api.de/api/interpreter?data=area[\"boundary\"=\"administrative\"][\"name\"=\"Calw\"]->.a;
out body qt;(node(area.a)[\"amenity\"~\"fast_food|restaurant\"];way(area.a)[\"amenity\"~\"fast_food|restaurant\"];
);out body qt;>;out skel qt;"

ab <- xmlParse(link3)

data.path <- "J:/Work/Statistik/Kolb/Paper/UseOSMdata/data/XML"
setwd(data.path)
saveXML(ab,file="fastfoodCalw.xml")

bound <- get_osm(complete_file(), source = osmsource_file("fastfoodCalw.xml"))
bound_MA <- find(bound, way(tags(k == "amenity")))
bg_ids <- find_down(bound, way(bound_MA))
bg <- subset(bound, ids = bg_ids)
bg
bg_poly <- as_sp(bg, "points")

#------------------------------------------------------------#

link4 <- "http://overpass-api.de/api/interpreter?data=area[\"boundary\"=\"administrative\"][\"name\"=\"Mannheim\"]->.a;
out body qt;(node(area.a)[\"boundary\"=\"administrative\"];way(area.a)[\"boundary\"=\"administrative\"];
);out body qt;>;out skel qt;"

ab <- xmlParse(link4)
saveXML(ab,file="boundMA.xml")

bound <- get_osm(complete_file(), source = osmsource_file("boundMA.xml"))
bound_MA <- find(bound, way(tags(k == "boundary")))
bg_ids <- find_down(bound, way(bound_MA))
bg <- subset(bound, ids = bg_ids)
bg
bg_poly <- as_sp(bg, "lines")

#------------------------------------------------------------#

link5 <- "http://overpass-api.de/api/interpreter?data=area[\"boundary\"=\"administrative\"][\"name\"=\"Mannheim\"]->.a;
out body qt;(node(area.a)[\"boundary\"=\"administrative\"];way(area.a)[\"boundary\"=\"administrative\"];relation(area.a)[\"boundary\"=\"administrative\"];
);out body qt;>;out skel qt;"

ab <- xmlParse(link5)
saveXML(ab,file="boundMApoly.xml")

bound <- get_osm(complete_file(), source = osmsource_file("boundMApoly.xml"))
bound_MA <- find(bound, way(tags(k == "boundary")))
bg_ids <- find_down(bound, way(bound_MA))
bg <- subset(bound, ids = bg_ids)
bg
bg_poly <- as_sp(bg, "lines")

#------------------------------------------------------------#

link6 <- "http://overpass-api.de/api/interpreter?data=area[\"boundary\"=\"administrative\"][\"name\"=\"Bayern\"]->.a;
out body qt;(node(area.a)[\"boundary\"=\"political\"];way(area.a)[\"boundary\"=\"political\"];relation(area.a)[\"boundary\"=\"political\"];
);out body qt;>;out skel qt;"

pol_Bayern <- xmlParse(link6)
saveXML(pol_Bayern,file="pol_Bayern.xml")

bound <- get_osm(complete_file(), source = osmsource_file("pol_Bayern.xml"))
bound_MA <- find(bound, way(tags(k == "boundary")))
bg_ids <- find_down(bound, way(bound_MA))
bg <- subset(bound, ids = bg_ids)
bg
bg_poly <- as_sp(bg, "polygons")


#------------------------------------------------------------#

part1 <- "http://overpass-api.de/api/interpreter?data="
part2 <- "area[\"boundary\"=\"administrative\"][\"name\"=\""
place <- "Calw"
link <- paste(part1,part2,place,"\"]->.a;
out body qt;(node(area.a)[\"amenity\"~\"fast_food|restaurant\"];way(area.a)[\"amenity\"~\"fast_food|restaurant\"];
);out body qt;>;out skel qt;",sep="")

ab <- xmlParse(link)

data.path <- "J:/Work/Statistik/Kolb/Paper/UseOSMdata/data/XML"
setwd(data.path)
saveXML(ab,file="fastfoodCalw.xml")

bound <- get_osm(complete_file(), source = osmsource_file("fastfoodCalw.xml"))
bound_MA <- find(bound, way(tags(k == "amenity")))
bg_ids <- find_down(bound, way(bound_MA))
bg <- subset(bound, ids = bg_ids)
bg
bg_poly <- as_sp(bg, "points")




#------------------------------------------------------------#

boundaryMA <- xmlParse("http://www.overpass-api.de/api/interpreter?data=
                       area[name=\"Mannheim\"];way(area)
                       [boundary=administrative];out;")

data.path <- "J:/Work/Statistik/Kolb/Paper/UseOSMdata/data/XML"
setwd(data.path)
saveXML(boundaryMA,file="boundaryMA.xml")

bound <- get_osm(complete_file(), source = osmsource_file("boundaryMA.xml"))
bound_MA <- find(bound, way(tags(k == "boundary")))
bg_ids <- find_down(bound, way(bound_MA))
bg <- subset(bound, ids = bg_ids)



link2 <- "http://www.overpass-api.de/api/interpreter?data=(rel({{bbox}})->.relations);(node(r.relations:\"label\");node(r.relations:\"admin_centre\"));out;"

link2 <- "http://www.overpass-api.de/api/interpreter?data=node[\"name\"=\"Gielgen\"];out skel;"
ab <- xmlParse(link2)

#------------------------------------------------------------#
setwd(data.path)
Beeskow <- get_osm(complete_file(), source = osmsource_file("1384849.xml"))

bound_MA <- find(Beeskow, relation(tags(k == "name")))
bg_ids <- find_down(Beeskow, way(bound_MA))
bg <- subset(Beeskow, ids = bg_ids)
bg
bg_poly <- as_sp(bg, "polygons")


#------------------------------------------------------------#

dos <- get_osm(complete_file(), source = osmsource_file("Dossenheim_restaurant.xml"))




#------------------------------------------------------------#

link <- "http://overpass-api.de/api/interpreter?data=(rel(62422);>;);out;"
boundary <- xmlParse(link)





#------------------------------------------------------------#
# Links
#------------------------------------------------------------#

# overpass + get nodes and ways


# http://gis.stackexchange.com/questions/115911/converting-osm-file-to-shapefile-or-data-frame-in-r
# http://osmar.r-forge.r-project.org/RJpreprint.pdf
