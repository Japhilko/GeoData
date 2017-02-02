# Quellen für Polygone
Jan-Philipp Kolb  
22 Februar 2017  






## Das shapefile Format ... 

- ... ist ein beliebtes Format räumlicher Vektordaten für geographisches Informationssysteme (GIS).
- Es wurde entwickelt und reguliert von [ESRI](http://www.esri.com/)

- (meist) offene Spezifikation um Daten Interoperabilität zwischen Esri und anderen Formaten zu sichern. 

- Es können Punkte, Linien und Polygone beschrieben werden

- Jedes Element hat Attribute, wie bspw. Name oder Temperatur die es beschreiben.

Quelle: <https://en.wikipedia.org/wiki/Shapefile>


## Global Adminastrative Boundaries - [GADM](http://www.gadm.org/) - NUTS level 1


```r
library(raster)
```



```r
LUX1 <- getData('GADM', country='LUX', level=1)
plot(LUX1)
```

## Ein Blick auf die Daten



Koordinaten im polygon slot

```r
LUX1@polygons[[1]]@Polygons[[1]]@coords
```



## Der Datenslot


```r
head(LUX1@data)
```


## [GADM](http://www.gadm.org/)- NUTS level 3

<http://www.gadm.org/>


```r
LUX3 <- getData('GADM', country='LUX', level=3)
plot(LUX3)
```

## [GADM](http://www.gadm.org/)- NUTS level 4


```r
LUX4 <- getData('GADM', country='LUX', level=4)
plot(LUX4)
```

## [GADM](http://www.gadm.org/)- NUTS level 3


```r
DEU3 <- getData('GADM', country='DEU', level=3)
plot(DEU3)
```


## PLZ für Deutschland

<http://datahub.io/de/dataset/postal-codes-de>




```r
library(rgdal)
```




```r
PLZ <- readOGR ("post_pl.shp","post_pl")
```





## Der R Befehl readShapePoly

Um Shape-Dateien zu lesen, ist es notwendig, 
die drei Dateien mit den folgenden Dateierweiterungen im gleichen Verzeichnis zu haben:

- .shp
- .dbf
- .shx

## Mannheim zeichnen




```r
MA <- PLZ[PLZ@data$PLZORT99=="Mannheim",]
plot(MA)
```

![Mannheim PLZ](figure/MannheimPLZ.png)

## Gemeinden in Deutschland

Bundesamt für Kartographie und Geodäsie (BKG)

[Link zum Download der Karten](http://www.geodatenzentrum.de/geodaten/gdz_rahmen.gdz_div?gdz_spr=deu&gdz_akt_zeile=5&gdz_anz_zeile=1&gdz_unt_zeile=15&gdz_user_id=0)

<http://www.geodatenzentrum.de/>





```r
library(maptools)
krs <- readShapePoly("vg250_krs.shp")
plot(krs)
```

![Kreise Deutschland](figure/vg250_krs.png)

## Kreise eines Bundeslandes


```r
fds <- substr(krs@data$AGS,1,2)

plot(krs[fds=="05",])
```

![Kreise NRW](figure/KreiseNRW.png)


## [Vorwahlbereiche in Deutschland](http://www.bundesnetzagentur.de/SharedDocs/Downloads/DE/Sachgebiete/Telekommunikation/Unternehmen_Institutionen/Nummerierung/Rufnummern/ONVerzeichnisse/ONBGrenzen/ONB_Grenzen.html)

<http://www.bundesnetzagentur.de/>





```r
onb <- readShapePoly("onb_grenzen.shp")

kable(head(onb@data))
```

|   |VORWAHL |NAME                 |KENNUNG |
|:--|:-------|:--------------------|:-------|
|0  |04651   |Sylt                 |NA      |
|1  |04668   |Klanxbüll            |NA      |
|2  |04664   |Neukirchen b Niebüll |NA      |
|3  |04663   |Süderlügum           |NA      |
|4  |04666   |Ladelund             |NA      |
|5  |04631   |Glücksburg Ostsee    |NA      |


## Vorwahlbereich 06


```r
VW <- substr(onb@data$VORWAHL,1,2)
plot(onb[VW=="06",])
```

![Vorwahlbereich 06](figure/Vorwahl06.png)

## Wo ist Mannheim?


```r
Com <- onb@data$NAME
plot(onb[VW=="06",])
plot(onb[Com=="Mannheim",],col="red",add=T)
plot(onb[Com=="Heidelberg",],col="green",add=T)
plot(onb[Com=="Kaiserslautern",],col="blue",add=T)
```

![Drei Städte](figure/DreiStaedte.png)

## Andere Quellen

[World Port Index](http://msi.nga.mil/NGAPortal/MSI.portal?_nfpb=true&_pageLabel=msi_portal_page_62&pubCode=0015)





```r
library(rgdal)
WPI <- readOGR ("WPI.shp","WPI")
plot(WPI)
```

![World Port Index](figure/WPI.png)




Datenbanken für Karten


```r
library(mapdata)
```

## Weitere Quellen

- [Eurostat Karten](http://epp.eurostat.ec.europa.eu/portal/page/portal/gisco_Geographical_information_maps/popups/
references/administrative_units_statistical_units_1)

<http://epp.eurostat.ec.europa.eu>

- [Open linked data](https://www.ordnancesurvey.co.uk/business-and-government/products/opendata-products-grid.html)

<https://www.ordnancesurvey.co.uk/>

- [World Borders Datensatz](http://thematicmapping.org/downloads/world_borders.php)
<http://thematicmapping.org>

- [National Historical Information System](https://www.nhgis.org/)

<https://www.nhgis.org/>

- [Freie polygon Daten für die USA](http://www.freemapdata.com/html/free_polygon_data.html)

<http://www.freemapdata.com/>

## Noch mehr Quellen

- [Spatial Data in R](https://science.nature.nps.gov/im/datamgmt/statistics/r/advanced/spatial.cfm)

<https://science.nature.nps.gov/>

- [ggmap und shapefiles](http://www.r-bloggers.com/shapefile-polygons-plotted-on-google-maps-using-ggmap-in-r-throw-some-throw-some-stats-on-that-mappart-2/)

<http://www.r-bloggers.com/>
