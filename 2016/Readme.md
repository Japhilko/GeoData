Nutzung von Geodaten in den Sozialwissenschaften
====================

Thema ist die Beschaffung und Nutzung von räumlichen Informationen in einem (sozial-) wissenschaftlichen Kontext. Es geht um die Beschaffung von GeoDaten (bspw. Shapefiles, [OpenStreetMap](http://openstreetmap.de/)) wie auch sozialwissenschaftlichen Daten. Dabei werden vor allem Quellen für frei verfügbare Daten vorgestellt. 

Als Beispiele für sozialwissenschaftliche Daten werden neben Public-Use-Files der amtlichen Statistik auch Zensus-Ergebnisse und Daten von Eurostat, der Weltbank und freien Portalen wie [datahub.io](https://datahub.io/) und [Wikipedia](https://www.wikidata.org/wiki/Wikidata:Main_Page) verwendet. Für die Analyse der Daten und die Visualisierung in Karten wird ausschließlich die Programmiersprache R genutzt. 


Motivation und Vorbereitung
---------------------

- Einleitung ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Einleitung.Rmd)) - [Regionales](http://rpubs.com/Japhilko82/OpenStreetMap_Mannheim)

- Unter [Infos github](https://github.com/Japhilko/GeoData/blob/master/2015/slides/github.md) sind Informationen zur Nutzung des  Verzeichnisses zu finden.

- Um den Kurs zu verfolgen muss [R](https://cran.uni-muenster.de/) und [Rstudio](https://www.rstudio.com/products/rstudio/download/) installiert werden. Der Installationsprozess ist relativ einfach. 

Verschiedene Kartentypen mit ggmap
---------------------

- Nutzung von R-Paket [ggmap](http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf) zur Erzeugung verschiedener Kartentypen. ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/MapTypes.Rmd) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_ggmap.R) )

- Beispiel: Points of interest ([poi](https://rpossib.wordpress.com/2015/09/15/points-of-interest-for-backpackers/)) für Backpacker in Amsterdam


Quellen für räumliche Daten
---------------------

- Politische und thematische Karten mit dem R-Paket [maps](https://cran.r-project.org/web/packages/maps/index.html) ([Browser ](https://github.com/Japhilko/GeoData/blob/master/2016/slides/maps.Rmd) | [blog](https://rpossib.wordpress.com/2015/09/18/political-maps-with-r/) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_maps.R) )

- Choroplethen mit dem R-Paket maptools ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/maptools.Rmd) 
| [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_maptools.R))


- Quellen für Geodaten ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/polygonSources.Rmd)|
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_polygonSources.R))

- Administrative Grenzen mit [GADM](http://www.gadm.org/) 
([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/KartenErstellen.Rmd))

- Übersicht wichtiger R-Befehle ([pdf](https://github.com/Japhilko/GeoData/blob/master/2016/slides/RcommandsRecap.Rmd))


Sozialwissenschaftliche Datenquellen
---------------------

- [datahub](https://datahub.io/de/)

Daten Import und Verbindung von Daten
---------------------
In diesem Abschnitt wird gezeigt, wie raum- und sozialwissenschaftliche Daten miteinander verknüpft werden können um räumliche Visualisierungen zu erzeugen. 

- Daten Import ([browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/dataImport.Rmd) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_dataImport.R)) 
- Data Linkage ([pdf](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Matching.Rmd) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_Matching.R))
of data sources

- R-package spplot and Color coding ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/spplot.Rmd)| 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_spplot.R))
- Daten für die Beispiele ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Course6.Rmd) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_DataUseCases.R)
)
- Beispiel: "Maps with Eurostat data" ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/eurostatMapsR.pdf) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_EurostatMaps.R))

- Beispiel: Webscraping data on nursery ([browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/WebScraping.Rmd) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_WebScraping.R))

- Beispiel: Hostels Madrid ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Madrid_hostels.Rmd))


- Choroplethen 
 ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Choroplethen.Rmd))


Einfärbung und Editierung von Polygonen
---------------------

- Thematic maps with R-package tmap ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/F_tmap.pdf) |
[Browser](https://github.com/Japhilko/GeoData/blob/master/workshops/F_tmap.md) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_tmap.R))

- Das R-Packet `choroplethr` ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Choroplethr.Rmd) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_Choroplethr.R))


Interaktive Karten
---------------------

- Organisation und Interaktive Karten ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/PresentingResults.Rmd)
| [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_PrepPresentation.R))
- Beispiel: Interaktive Karte ([Browser](http://rpubs.com/Japhilko82/Campsites))

- Das R-Packet spdep - Nachbarschaft und Distanz ([Browser](https://github.com/Japhilko/GeoData/blob/master/2015/slides/K_spdep.md) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_spdep.R))

- Interaktive Karten mit dem R-package `leaflet` 
([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/InteractiveMaps.Rmd) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_Interactive maps.R))



Kontext und Ausblick
---------------------
In this session the context is presented, buzz words are spatial turn, vernacular geography and neogeography.

- Kontext und Ausblick ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/SpatialMA_Course11.pdf))
