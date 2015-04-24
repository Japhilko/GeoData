

pkg.path <- "C:/Users/kolbjp/Documents/GitHub/GeoData/geosmdata2/data"

library(ggmap)
library(osmar)

api <- osmsource_api()
cityC <- geocode("Berlin")
bb <- center_bbox(cityC$lon,cityC$lat,1000, 1000)
uaBerlin <- get_osm(bb, source = api)

setwd(pkg.path)
save(uaBerlin,file="uaBerlin.RData")

library(roxygen2)


# https://support.rstudio.com/hc/en-us/articles/200486518-Customizing-Package-Build-Options
