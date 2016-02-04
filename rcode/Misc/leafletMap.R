
# http://www.yizhexu.com/2015/polygon-leaflet.html

source("https://gist.githubusercontent.com/yizhexu/a0f5b4806061005c2d93/raw/010788b1f0f55e87481d44f70d1a9429328f1c3d/data.R")


library(sp)
create_poly <- function(latitude, longitude, x, size = 1) {
  lat_m <- latitude[x] - size/2/60
  lat_p <- latitude[x] + size/2/60
  lng_m <- longitude[x] - size/2/60
  lng_p <- longitude[x] + size/2/60
  
  p <- Polygon(matrix(c(lng_m, lat_m, lng_p, lat_m, lng_p, lat_p, lng_m, lat_p), ncol = 2, byrow = TRUE))
  Polygons(list(p),x)
}


sps <- SpatialPolygons(lapply(1:150, function(i) {
  create_poly(coors$latitude, coors$longitude, i)}
))
proj4string(sps) = CRS("+init=epsg:3857")

data <- data.frame(index = baseline_index, row.names = row.names(sps))
spdf <- SpatialPolygonsDataFrame(sps, data)

library(leaflet)
pal <- colorQuantile(
  palette = "YlOrRd",
  domain = spdf@data$index, n = 5
)

leaf_poly <- leaflet() %>%
  addTiles() %>%
  addPolygons(data = spdf, fillOpacity = 0.5, smoothFactor = 0.5,
              color = ~pal(spdf@data$index),
              stroke = FALSE) %>%
  addLegend(pal = pal, values = spdf@data$index, opacity = 1)
