# Nutzung von GeoDaten in den Sozialwissenschaften
# Slides G2 - Nutzung von APIs
# Jan-Philipp Kolb
# Fri Apr 08 07:50:07 2016

## ----echo=F--------------------------------------------------------------
Link1 <- "http://www.overpass-api.de/api/interpreter?data=[maxsize:1073741824][timeout:900];area[name=\""

## ----eval=Ex-------------------------------------------------------------
place <- "Mannheim"
type_obj <- "node"
object <- "leisure=playground"

InfoList <- xmlParse(paste(Link1,place,"\"];",
type_obj,"(area)[",object,
"];out;",sep=""))

## ----eval=Ex-------------------------------------------------------------
node_id<- xpathApply(InfoList,
"//tag[@v= 'playground']/parent::node/@ id")

## ----eval=Ex-------------------------------------------------------------
lat_x <- xpathApply(InfoList,
"//tag[@v= 'playground']/parent::node/@ lat")

## ----eval=Ex-------------------------------------------------------------
lat_x <- xpathApply(InfoList,
"//tag[@v= 'playground']/parent::node/@ lon")

## ----eval=F--------------------------------------------------------------
library(devtools)
install_github("Japhilko/GeoData/geosmdata")

## ----eval=F--------------------------------------------------------------
library(geosmdata)
pg_MA <- get_osm_nodes(object="leisure=playground",
                        "Mannheim")
info <- extract_osm_nodes(OSM.Data=pg_MA,
                         value="playground")

