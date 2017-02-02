# Interaktive Karten
Jan-Philipp Kolb  
22 Februar 2017  




## Beispiel zu Campingplätzen

- Die Daten stammen von:

<http://www.openstreetmap.de/>

- Dabei wird die Overpass API genutzt:

<http://wiki.openstreetmap.org/wiki/Overpass_API>




```r
url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/CampSites_Germany.csv"
```


```r
CampSites <- read.csv(url)
```


## Überblick über Daten zu Campingplätzen




## Eine Karte für Deutschland bekommen


```r
library(raster)
DEU1 <- getData('GADM', country='DEU', level=1)
```






```r
library(maptools)
plot(DEU1)
```

## Die Campingplätze hinzufügen


```r
plot(DEU1)
points(y=CampSites$lat,x=CampSites$lon,
       col="red",pch=20)
```

## Die Transparenz verändern


```r
plot(DEU1)
points(y=CampSites$lat,x=CampSites$lon,col=rgb(0,1,0,.2),
       pch=20)
```

## Eine Google Karte für Deutschland bekommen


```r
library(ggmap)
DE_Map <- qmap("Germany", zoom=6, maptype="hybrid")
DE_Map
```

## Die Punkte auf die Google Karte zeichnen


```r
DE_Map + geom_point(aes(x = lon, y = lat),
                    data = CampSites)
```

## Einen Dichteplot zeichnen


```r
DE_Map + geom_density2d(data = CampSites,                  aes(x = lon, y = lat),lwd=1.5)
```

## Einen anderen Dichteplot


```r
DE_Map + stat_density2d(data = CampSites, 
aes(x = lon, y = lat,fill = ..level..), bins = 100, 
geom = 'polygon')
```


## Einen anderen Dichteplot


```r
DE_Map + stat_density2d(data=CampSites, 
                        aes(x=lon,y=lat,fill=..level..,
alpha = ..level..),bins=80,geom='polygon')
```

## Notwendige Pakete

[magrittr](https://cran.r-project.org/web/packages/magrittr/index.html) - für den Pipe Operator in R:


```r
library("magrittr")
```


[leaflet](https://rstudio.github.io/leaflet/) - um  interaktive Karten mit der JavaScript Bibliothek 'Leaflet' zu erzeugen


```r
library("leaflet")
```


## Eine interaktive Karte


```r
m <- leaflet() %>%
  addTiles() %>%  
  addMarkers(lng=CampSites$lon, 
             lat=CampSites$lat, 
             popup=CampSites$name)
m
```

## Mehr Informationen hinzufügen


```r
popupInfo <- paste(CampSites$name,"\n",CampSites$website)
```


```r
m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=CampSites$lon, 
             lat=CampSites$lat, 
             popup=popupInfo)
m
```

Das Ergebnis ist hier:

<http://rpubs.com/Japhilko82/CampSitesHL>

## Die resultierende Karte

![Campingplätze in Deutschland](figure/Germany_Campsites.PNG)

## Popups in einer interactiven Karte

![Camping Mannheim](figure/Camping_Mannheim.PNG)

Ich hab die Ergebnisse hochgeladen:

<http://rpubs.com/Japhilko82/Campsites>

## Wie man auf Rpubs publizieren kann

![Publizieren auf Rpubs](figure/PublishCampSitesGermany.PNG)


## Ein weiteres Beispiel - Weltkulturerbe


```r
url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/whcSites.csv"

whcSites <- read.csv(url) 
```




## Eine interaktive Karte erstellen


```r
m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=whcSites$lon, 
             lat=whcSites$lat, 
             popup=whcSites$name_en)
m
```

## Die Karte zeigen

![Weltkulturerbestätten](figure/WHCPopUps.PNG) 

## Farbe hinzu


```r
whcSites$color <- "red"
whcSites$color[whcSites$category=="Cultural"] <- "blue"
whcSites$color[whcSites$category=="Mixed"] <- "orange"
```

## Eine Karte mit Farbe erzeugen


```r
m1 <- leaflet() %>%
  addTiles() %>%  
  addCircles(lng=whcSites$lon, 
             lat=whcSites$lat, 
             popup=whcSites$name_en,
             color=whcSites$color)
m1
```

## Die Karte zeigen

![Karte Weltkulturerbe](figure/WHCcircles.PNG) 

## [Die Karte abspeichern](http://www.r-bloggers.com/interactive-mapping-with-leaflet-in-r-2/)

![Als Website speichern](figure/snapshot2.png)

## ggmap: Zwei Karten nebeneinander


```r
url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/whcSites.csv"
UNESCO <- read.csv(url)
```



## Die Stätten für Deutschland


```r
library(ggmap)
ind <- UNESCO$states_name_en=="Germany"
UNESCO_DE <- UNESCO[ind,]
```

## Links und Quellen

- <http://www.r-bloggers.com/the-leaflet-package-for-online-mapping-in-r/>

- <https://rstudio.github.io/leaflet/>


