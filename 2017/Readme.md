# Geodaten in den Sozialwissenschaften
Jan-Philipp Kolb  
22 Februar 2017  



In diesem eintägigen Workshop geht es um die Beschaffung und Verarbeitung von räumlichen Informationen (Geodaten) in einem (sozial-) wissenschaftlichen Kontext.

Motivation und Einleitung
---------------------

- __(A1) Motivation__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2017/slides/Einleitung.md)) - [Regionales](http://rpubs.com/Japhilko82/OpenStreetMap_Mannheim)

- __(A2) Nutzung von R-Paket [ggmap](http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf)__ zur Erzeugung verschiedener Kartentypen. ([Browser](https://github.com/Japhilko/GeoData/blob/master/2017/slides/ggmap.md) | [pdf](https://github.com/Japhilko/GeoData/blob/master/2016/slides/ggmap.pdf) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesB1_ggmap.R) )

- Beispiel: *Points of interest* ([poi](https://rpossib.wordpress.com/2015/09/15/points-of-interest-for-backpackers/)) für Backpacker in Amsterdam

Aufgabe 1: [Nutzung von  `ggmap`](https://github.com/Japhilko/GeoData/blob/master/2017/tutorial/Aufgabe_Nutzung_ggmap.Rmd)

Datenquellen
---------------------

- __(B1) Politische und thematische Karten mit dem R-Paket [maps](https://cran.r-project.org/web/packages/maps/index.html)__ ([Browser ](https://github.com/Japhilko/GeoData/blob/master/2017/slides/maps.md) |  [pdf](https://github.com/Japhilko/GeoData/blob/master/2016/slides/maps.pdf) | [blog](https://rpossib.wordpress.com/2015/09/18/political-maps-with-r/) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesC1_maps.R) )

- __(B2) Choroplethen mit dem R-Paket maptools__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2017/slides/maptools.md) | [pdf](https://github.com/Japhilko/GeoData/blob/master/2016/slides/maptools.pdf)
| [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesC2_maptools.R))

- __(B3) Internetquellen für Geodaten__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/polygonSources.md)| [pdf](https://github.com/Japhilko/GeoData/blob/master/2016/slides/polygonSources.pdf)|
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesC3_polygonSources.R))

- __(B4) OpenStreetMap als Datenquelle__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2017/slides/OpenStreetMap.md) |
[pdf](https://github.com/Japhilko/GeoData/blob/master/2017/slides/osm_data.pdf))

- __(B5) Öffentliche Daten zur freien Verfügung__  ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/DataPUF.md) | 
[pdf](https://github.com/Japhilko/GeoData/blob/master/2016/slides/DataPUF.pdf) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesD2_DataPUF.R)
)

Aufgabe 2: [Deutschlands Gemeinden](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_Zensus_Ergebnisse.md)


Verbindung, Editierung und Einfärbung
---------------------

- __(C1) Verbindung von Daten__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Matching.md) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesE1_Matching.R))
of data sources

- __(C2) Das R-Paket `spplot` und Farbkodierung__  ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/spplot.md)| 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesE2_spplot.R))

- __(C3) Shapefiles zusammenfassen__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/BeispielONB.md) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesE3_CombineShapefiles.R)
)


Aufgabe 5: [Zensus Ergebnisse und Karte miteinander verbinden und einfärben](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_Verbindung.Rmd)

- __(C4) Thematische Karten mit dem R-Paket `tmap`__ 
([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/tmap.md) | 
[pdf](https://github.com/Japhilko/GeoData/blob/master/2016/slides/tmap.pdf) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesF1_tmap.R))

- Beispiel: *Maps with Eurostat data* ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/eurostatMapsR.pdf) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_EurostatMaps.R))

- __(C5) Das R-Paket `choroplethr`__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Choroplethr.md) | 
[pdf](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Choroplethr.pdf) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesF2_choroplethr.R))


Aufgabe: [Darstellung von Eurostat Daten mit `choroplethr`](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_choroplethr.Rmd)


OpenStreetMap und räumliche Statistik
---------------------

- __(D1) Das Arbeiten mit XML-Dateien__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2017/slides/OpenStreetMap.md))

- __(D2) Die Nutzung von Programmierschnittstellen__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/UsageAPI.md) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesG1_UsageAPI.R))

- __(D3) Das R-Paket `osmar`__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/osmar.md)| 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesG3_osmar.R))

- Beispiel Hostels in Madrid ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Madrid_hostels.Rmd)), [Energieerzeugung](https://rpossib.wordpress.com/2015/11/20/use-openstreetmap-date/)

Aufgabe 6: [Darstellung von OSM Daten mit tmap](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_osmar.Rmd)

- __(D4) Das R-Paket `spdep` - Nachbarschaft und Distanz__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/spdep.md) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesH1_spdep.R))


- __(D5) Interaktive Karten und Präsentation__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2017/slides/InteractiveMaps.md)
| [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesH2_Interaktiv.R))
Beispiel - [Campingplätze](http://rpubs.com/Japhilko82/Campsites)

Aufgabe 7: [Distanzberechnung](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_Distanzberechnung.Rmd)
