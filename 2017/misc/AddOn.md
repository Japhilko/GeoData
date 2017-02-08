# AddOn - OSM und R
Jan-Philipp Kolb  
3 Februar 2017  



## [osrm R package](https://github.com/rCarto/osrm)


```r
# https://github.com/rCarto/osrm
library("devtools")
install_github("osrm","rCarto")
```



```r
library(osrm)
```

```
## Data (c) OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright
```

```
## Routes: OSRM. http://project-osrm.org/
```

```
## If you plan to use the OSRM public API, read the OSRM API Usage Policy:
## https://github.com/Project-OSRM/osrm-backend/wiki/Api-usage-policy
```

```r
data("com")
distCom <- osrmTable(loc = com[1:50, c("name","lon","lat")])
kable(distCom$duration[1:5,1:5])
```

               Bethune   Annezin   Denderleeuw   Haaltert   Locon
------------  --------  --------  ------------  ---------  ------
Bethune            0.0       7.4         111.4      107.0     9.7
Annezin            6.6       0.0         115.4      111.0     8.8
Denderleeuw      115.3     119.2           0.0       13.9   114.0
Haaltert         111.2     115.1          13.9        0.0   109.9
Locon              9.0       8.6         108.8      104.4     0.0

## Zu den Projektionen

- [Adresse auslesen mit Nominatim](https://forum.openstreetmap.org/viewtopic.php?id=15811)

## Das CRS ändern

- [Projecting sp objects in R](http://gis.stackexchange.com/questions/31743/projecting-sp-objects-in-r)


## Beispiele

- [Turning R into a GIS – Mapping the weather in Germany](https://www.r-bloggers.com/turning-r-into-a-gis-mapping-the-weather-in-germany/)


- [Creating Maps in R](https://github.com/Robinlovelace/Creating-maps-in-R)

- [Commented Scripts to Build Maps with cartography](https://cran.r-project.org/web/packages/cartography/vignettes/cartography.html)

- [Create and integrate maps in your R workflow with the cartography package](https://rgeomatic.hypotheses.org/842)

- [Mapping the Transit System of Rio with GTFS data ](http://urbandemographics.blogspot.de/2015/03/mapping-transit-system-of-rio-with-gtfs.html)

- [Maps and Data Visualisations with R](http://spatial.ly/r/)

## Das Potential von Geodaten

- Peter Staub - [Über das Potenzial und die Grenzen der semantischen Interoperabilität von Geodaten ](http://www.igp-data.ethz.ch/berichte/Blaue_Berichte_PDF/102.pdf)
