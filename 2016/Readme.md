Nutzung von Geodaten in den Sozialwissenschaften
====================

Thema ist die Beschaffung und Nutzung von räumlichen Informationen (GeoDaten) in einem (sozial-) wissenschaftlichen Kontext.  Dabei handelt es sich bei den GeoDaten bspw. um [Shapefiles](https://de.wikipedia.org/wiki/Shapefile) oder  [OpenStreetMap](http://openstreetmap.de/) Daten.  Es werden vor allem Quellen für frei verfügbare Daten vorgestellt. 

Als Beispiele für sozialwissenschaftliche Daten werden neben Public-Use-Files der Bevökerungsbefragungen auch Daten des Zensus-Atlas und Daten von Eurostat, der Weltbank und freien Portalen wie [datahub.io](https://datahub.io/) und [Wikipedia](https://www.wikidata.org/wiki/Wikidata:Main_Page) verwendet. Für die Analyse der Daten und die Visualisierung in Karten wird nur die Programmiersprache R genutzt. 


Intro und Vorbereitung
---------------------

- __(A) Motivation__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Einleitung.md)) - [Regionales](http://rpubs.com/Japhilko82/OpenStreetMap_Mannheim)

- Unter [Infos github](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Github.md) sind Informationen zur Nutzung des  Verzeichnisses zu finden.

- Um den Kurs zu verfolgen muss [R](https://cran.uni-muenster.de/) und [Rstudio](https://www.rstudio.com/products/rstudio/download/) installiert werden. Der Installationsprozess ist relativ einfach. 

R-Recap: Hallo Welt ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/recap/HalloWelt.md) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/recap1_HalloWelt.R)) 

Aufgabe 1: [Vorbereitung und Brainstorming](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_VorbereitungBrainstorming.md)

Verschiedene Kartentypen mit ggmap
---------------------

- __(B) Nutzung von R-Paket [ggmap](http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf)__ zur Erzeugung verschiedener Kartentypen. ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/ggmap.md) | [pdf](https://github.com/Japhilko/GeoData/blob/master/2016/slides/ggmap.pdf) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slides2_ggmap.R) )

- Beispiel: *Points of interest* ([poi](https://rpossib.wordpress.com/2015/09/15/points-of-interest-for-backpackers/)) für Backpacker in Amsterdam

R-Recap: Objekte und Indizierung ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/recap/ObjekttypenIndizierung.md) | [rcode](https://github.com/Japhilko/GeoData/blob/master/2016/recap/ObjekttypenIndizierung.R))

Aufgabe 2: [Nutzung von  `ggmap`](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_Nutzung_ggmap.md)

Quellen für räumliche Daten
---------------------

- __(C1) Politische und thematische Karten mit dem R-Paket [maps](https://cran.r-project.org/web/packages/maps/index.html)__ ([Browser ](https://github.com/Japhilko/GeoData/blob/master/2016/slides/maps.md) | [blog](https://rpossib.wordpress.com/2015/09/18/political-maps-with-r/) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_maps.R) )

- __(C2) Choroplethen mit dem R-Paket maptools__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/maptools.md)
| [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_maptools.R))

- __(C3) Internetquellen für Geodaten__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/polygonSources.md)|
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_polygonSources.R))

- __(C4) OpenStreetMap als Datenquelle__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/osm_data.Rmd))

R-Recap: Daten Import und Export ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/recap/dataImport.md) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_dataImport.R)) 


Aufgabe 3: [Eine Karte um Daten für Deutschlands Gemeinden darzustellen](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_DeutschlandsGemeinden.md)

Sozialwissenschaftliche Datenquellen
---------------------

- __(D1) R interne Daten__
([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/RinternData.Rmd))

- __(D2) Öffentliche Daten zur freien Verfügung__  ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/DataPUF.Rmd))

- __(D3) Beispiel: Webscraping__
([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/WebScraping.md) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_WebScraping.R))

- __(D4) Datenaufbereitung__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Datenaufbereitung.Rmd)) 

- Weitere Datenquellen ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/WeitereDatenquellen.Rmd))

Aufgabe 4: [Zensus Ergebnisse herunterladen und importieren](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_Zensus_Ergebnisse.md)

R-Recap: Schleifen, if-Abfragen und Tabellen ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/recap/Datentypen.md)) 


Verbindung, Editierung und Einfärbung
---------------------

- __(E1) Verbindung von Daten__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Matching.md) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_Matching.R))
of data sources

- __(E2) Das R-Paket `spplot` und Farbkodierung__  ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/spplot.md)| 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_spplot.R))

- __(E3) Shapefiles zusammenfassen__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/BeispielONB.md) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_DataUseCases.R)
)

Aufgabe 5: [Zensus Ergebnisse und Karte miteinander verbinden und einfärben](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_Verbindung.md)

R-Recap: Zufallszahlen ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/recap/Zufallszahlen.md)) 


Weitere Möglichkeiten zur Erstellung von Choroplethenkarten
---------------------

- __(F1) Thematische Karten mit dem R-Paket `tmap`__ 
([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/tmap.md) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_tmap.R))

- Beispiel: *Maps with Eurostat data* ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/eurostatMapsR.pdf) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_EurostatMaps.R))

- __(F2) Das R-Paket `choroplethr`__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Choroplethr.md) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_Choroplethr.R))

Aufgabe: [Darstellung von Eurostat Daten mit `choroplethr`](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_choroplethr.Rmd)


Nutzung von OpenStreetMap Daten
---------------------

- __(G1) Das Arbeiten mit XML-Dateien__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/OpenStreetMap.md))

- __(G2) Die Nutzung von Programmierschnittstellen__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/UsageAPI.md))

- __(G3) Das R-Paket `osmar`__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/osmar.md))

- Beispiel Hostels in Madrid ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Madrid_hostels.Rmd)), [Energieerzeugung](https://rpossib.wordpress.com/2015/11/20/use-openstreetmap-date/)

Aufgabe 6: [Darstellung von OSM Daten mit tmap](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_osmar.Rmd)


Räumliche Statistik und Interaktive Karten 
---------------------

- __(H1) Das R-Paket `spdep` - Nachbarschaft und Distanz__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/spdep.md) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_spdep.R))


- __(H2) Interaktive Karten und Präsentation__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/PresentingResults.Rmd)
| [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_PrepPresentation.R))
Beispiel - [Campingplätze](http://rpubs.com/Japhilko82/Campsites)

Aufgabe 7: [Distanzberechnung](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_Distanzberechnung.Rmd)


Kontext und Ausblick
---------------------

- Kontext und Ausblick ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/SpatialMA_Course11.pdf))
