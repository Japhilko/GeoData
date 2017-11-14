# Karten erstellen mit R
Jan-Philipp Kolb  
14 November 2017  




## Ortsnetzbereiche

Quelle: [Bundesnetzagentur](https://www.bundesnetzagentur.de/DE/Sachgebiete/Telekommunikation/Unternehmen_Institutionen/Nummerierung/Rufnummern/ONRufnr/ON_Einteilung_ONB/ON_ONB_ONKz_ONBGrenzen_Basepage.html)

<!-- 
ggf. noch mal neu herunterladen
--> 







```r
library(maptools)
onb <- readShapePoly("onb_grenzen.shp")
```


```r
par(mai=c(0,0,0,0))
plot(onb)
```

![onbD](https://raw.githubusercontent.com/Japhilko/GeoData/master/data/figure/onbGermany.png)

