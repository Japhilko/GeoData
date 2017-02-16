setwd("D:/Eigene Dateien/Dokumente/GitHub/GeoData/2017/slides")

library(knitr)

purl("ggmap.Rmd")

purl("maps.Rmd")

purl("maptools.Rmd")

purl("polygonSources.Rmd")

purl("OpenStreetMap.Rmd")

purl("Matching.Rmd")

purl("spplot.Rmd")
