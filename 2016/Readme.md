Nutzung von Geodaten in den Sozialwissenschaften
====================

Thema ist die Beschaffung und Nutzung von räumlichen Informationen (GeoDaten) in einem (sozial-) wissenschaftlichen Kontext.  Dabei handelt es sich bei den GeoDaten bspw. um Shapefiles oder  [OpenStreetMap](http://openstreetmap.de/) Daten.  Es werden vor allem Quellen für frei verfügbare Daten vorgestellt. 

Als Beispiele für sozialwissenschaftliche Daten werden neben Public-Use-Files der Bevökerungsbefragungen auch Daten des Zensus-Atlas und Daten von Eurostat, der Weltbank und freien Portalen wie [datahub.io](https://datahub.io/) und [Wikipedia](https://www.wikidata.org/wiki/Wikidata:Main_Page) verwendet. Für die Analyse der Daten und die Visualisierung in Karten wird nur die Programmiersprache R genutzt. 


Intro und Vorbereitung
---------------------

- __(A) Motivation__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Einleitung.md)) - [Regionales](http://rpubs.com/Japhilko82/OpenStreetMap_Mannheim)

- Unter [Infos github](https://github.com/Japhilko/GeoData/blob/master/2015/slides/github.md) sind Informationen zur Nutzung des  Verzeichnisses zu finden.

- Um den Kurs zu verfolgen muss [R](https://cran.uni-muenster.de/) und [Rstudio](https://www.rstudio.com/products/rstudio/download/) installiert werden. Der Installationsprozess ist relativ einfach. 

R-Recap: Hallo Welt ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/recap/HalloWelt.md) | [rcode](https://github.com/Japhilko/GeoData/blob/master/2016/recap/HalloWelt.R)) 

Aufgabe: [Vorbereitung und Brainstorming](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_VorbereitungBrainstorming.Rmd)

Verschiedene Kartentypen mit ggmap
---------------------

- __(B) Nutzung von R-Paket [ggmap](http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf)__ zur Erzeugung verschiedener Kartentypen. ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/ggmap.md) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_ggmap.R) )

- Beispiel: *Points of interest* ([poi](https://rpossib.wordpress.com/2015/09/15/points-of-interest-for-backpackers/)) für Backpacker in Amsterdam

R-Recap: Objekte und Indizierung ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/recap/ObjekttypenIndizierung.Rmd))

Aufgabe: [Vorbereitung und Nutzung von  `ggmap`](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_Nutzung_ggmap.md)

Quellen für räumliche Daten
---------------------

- __(C1) Politische und thematische Karten mit dem R-Paket [maps](https://cran.r-project.org/web/packages/maps/index.html)__ ([Browser ](https://github.com/Japhilko/GeoData/blob/master/2016/slides/maps.md) | [blog](https://rpossib.wordpress.com/2015/09/18/political-maps-with-r/) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_maps.R) )

- __(C2) Choroplethen mit dem R-Paket maptools__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/maptools.md)
| [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_maptools.R))

- __(C3) Internetquellen für Geodaten__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/polygonSources.md)|
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_polygonSources.R))

- __(C4) OpenStreetMap als Datenquelle__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/osm_data.Rmd))

R-Recap: Daten Import und Export ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/dataImport.md) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_dataImport.R)) 


Aufgabe: [Eine Karte um Daten für Deutschlands Gemeinden darzustellen](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_DeutschlandsGemeinden.md)

Sozialwissenschaftliche Datenquellen
---------------------

- __(D1) R interne Daten__
([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/RinternData.Rmd))

- __(D2) Öffentliche Daten zur freien Verfügung__  ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/DataPUF.Rmd))

- __(D3) Beispiel: Webscraping__
([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/WebScraping.md) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_WebScraping.R))

- __(D4) Datenaufbereitung__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Datenaufbereitung.Rmd)) 

- Weitere Datenquellen ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/WeitereDatenquellen.Rmd))

Aufgabe: [Zensus Ergebnisser herunterladen und importieren](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_Zensus_Ergebnisse.md)

R-Recap: Daten Import und Export ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/dataImport.md)) 


Verbindung, Editierung und Einfärbung
---------------------

- __(E1) Verbindung von Daten__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Matching.md) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_Matching.R))
of data sources

- __(E2) Das R-Paket `spplot` und Farbkodierung__  ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/spplot.Rmd)| 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_spplot.R))

- __(E3) Shapefiles zusammenfassen__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/BeispielONB.md) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_DataUseCases.R)
)


Weitere Möglichkeiten zur Erstellung von Choroplethenkarten
---------------------

- __(F1) Thematische Karten mit dem R-Paket `tmap`__ 
([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/tmap.Rmd) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_tmap.R))

- Beispiel: *Maps with Eurostat data* ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/eurostatMapsR.pdf) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_EurostatMaps.R))

- __(F2) Das R-Paket `choroplethr`__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Choroplethr.Rmd) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_Choroplethr.R))


Nutzung von OpenStreetMap Daten
---------------------

- Das Arbeiten mit XML-Dateien ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/OpenStreetMap.Rmd))

- Die Nutzung von Programmierschnittstellen ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/UsageAPI.Rmd))

- Das R-Paket `osmar` ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/osmar.Rmd))

- Beispiel Hostels in Madrid ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Madrid_hostels.Rmd)), [Energieerzeugung](https://rpossib.wordpress.com/2015/11/20/use-openstreetmap-date/)


Interaktive Karten und räumliche Statistik
---------------------

- Interaktive Karten und Präsentation ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/PresentingResults.Rmd)
| [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_PrepPresentation.R))
Beispiel - [Campingplätze](http://rpubs.com/Japhilko82/Campsites)

- Das R-Paket `spdep` - Nachbarschaft und Distanz ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/spdep.Rmd) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_spdep.R))

- Interaktive Karten mit dem R-Paket `leaflet` 
([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/InteractiveMaps.Rmd) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_Interactive maps.R))



Kontext und Ausblick
---------------------

- Kontext und Ausblick ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/SpatialMA_Course11.pdf))
