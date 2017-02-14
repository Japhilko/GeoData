# Telefonvorwahlen
Jan-Philipp Kolb  
22 Februar 2017  



## Ortsnetzbereiche

Quelle: [Bundesnetzagentur](http://www.bundesnetzagentur.de/DE/Sachgebiete/Telekommunikation/Unternehmen_Institutionen/Nummerierung/Rufnummern/ONVerzeichnisse/GISDaten_ONBGrenzen/ONBGrenzen_Basepage.html)





```r
library(maptools)
onb <- readShapePoly("onb_grenzen.shp")
```

## Die Karte zeichnen


```r
par(mai=c(0,0,0,0))
plot(onb)
```

![onbD](https://raw.githubusercontent.com/Japhilko/GeoData/master/data/figure/onbGermany.png)

## Einen Vorwahlbereich ausschneiden


```r
vwb <- onb@data$ONB_NUMMER
vwb1 <- substr(vwb, 1,1)
```


```r
barchart(table(vwb1),col="royalblue",
         xlab="Häufigkeit")
```

![vwb1freq](https://raw.githubusercontent.com/Japhilko/GeoData/master/data/figure/vwb1freq.png)

## Vorwahlbereich ausschneiden


```r
vwb6 <- onb[vwb1==6,]
plot(vwb6)
```

![vwb6](https://raw.githubusercontent.com/Japhilko/GeoData/master/data/figure/vwb6.png)

## Shapefiles zusammenfassen


```r
vwb6c <- unionSpatialPolygons(vwb6,
              rep(1,length(vwb6)))
plot(vwb6c,col="royalblue")
```

![vwb6c](https://raw.githubusercontent.com/Japhilko/GeoData/master/data/figure/vwb6c.png)
