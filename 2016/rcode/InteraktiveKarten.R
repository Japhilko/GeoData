## Road maps

library(leaflet)
library(magrittr)

m <- leaflet() %>% setView(lng = 8.47955, lat = 49.49671, zoom = 12)
m %>% addTiles()   

