
library(xtable)
main.path <- "J:/Work/Statistik/Kolb/Paper/UseOSMdata/"
data.path <- paste(main.path,"data/XML/",sep="")




library(geosmdata2)
place <- "Abilene"
object <- "restaurant"
xml_obj <- get_osm_nodes(object,place)

setwd(data.path)
saveXML(xml_obj,file=paste(place,"_",object,".xml",sep=""))


info <- extract_info_op(xml_obj,object)


xtable(info[1:8,c("addr.city","name","lat","lon")])

#--------------------------------------------------------#
#
#--------------------------------------------------------#

Abilene <- xmlParse("Abilene_osm.osm")

place <- "Abilene"
object <- "restaurant"
xml_obj <- get_osm_nodes(object,place)

setwd(data.path)
saveXML(xml_obj,file=paste(place,"_",object,".xml",sep=""))


info <- extract_info_op(xml_obj,object)

# folgender Eintrag fehlt seltsamerweise
# https://www.openstreetmap.org/way/209463896

#--------------------------------------------------------#
#
#--------------------------------------------------------#

gc <- geocode_osm("restaurant Abilene",output="all")

