Nutzung von Geodaten in den Sozialwissenschaften
====================

Das OpenSource Software Paket R ist kostenfrei und bietet neben Standardverfahren der Datenanalyse ein umfangreiches Repertoire von hoch spezialisierten Prozeduren und Verfahren auch für komplexe Anwendungen.

Der Schwerpunkt liegt auf der Vermittlung von Methoden der grafisch gestützten Analyse von Geodaten. 


Motivation
---------------------

- Einleitung ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Einleitung.Rmd) |
[pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/Introduction.pdf)) - [Regionales](http://rpubs.com/Japhilko82/OpenStreetMap_Mannheim)

- Unter [Infos github](https://github.com/Japhilko/GeoData/blob/master/2015/slides/github.md) sind Informationen zur Nutzung des  Verzeichnisses zu finden.

- Um den Kurs zu verfolgen muss [R](https://cran.uni-muenster.de/) und [Rstudio](https://www.rstudio.com/products/rstudio/download/) installiert werden. Der Installationsprozess ist relativ einfach. 

Verschiedene Kartentypen mit ggmap
---------------------

- Das R-Paket [ggmap](http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf) wird in diesem Abschnitt genutzt um verschiedene Kartentypen zu erzeugen.  [qmap](http://www.inside-r.org/packages/cran/ggmap/docs/qmap).
([pdf](https://github.com/Japhilko/GeoData/raw/master/2015/slides/MapTypes.pdf) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_ggmap.R) )

- Beispiel: Points of interest ([poi](https://rpossib.wordpress.com/2015/09/15/points-of-interest-for-backpackers/)) für Backpacker in Amsterdam


Quellen für räumliche Daten
---------------------

- Politische und thematische Karten mit dem R-Paket [maps](https://cran.r-project.org/web/packages/maps/index.html) ([browser ](https://github.com/Japhilko/GeoData/blob/master/2016/slides/maps.Rmd) | [blog](https://rpossib.wordpress.com/2015/09/18/political-maps-with-r/) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_maps.R) )

- Karten mit dem R-Paket maptools ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/D_maptools.pdf) 
| [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_maptools.R))


- Quellen für Geodaten ([browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/polygonSources.Rmd)| [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_polygonSources.R))

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
- Data Linkage ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/Matching.pdf) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_Matching.R))
of data sources

- R-package spplot and Color coding ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/E_spplot.pdf)  | [Browser](https://github.com/Japhilko/GeoData/blob/master/workshops/E_spplot.md) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_spplot.R))
- Data for the use cases ([Browser](https://github.com/Japhilko/GeoData/blob/master/workshops/Course6.md) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_DataUseCases.R)
)
- Use Case: Maps with Eurostat data ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/eurostatMapsR.pdf) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_EurostatMaps.R))

- Use Case: Webscraping data on nursery ([browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/WebScraping.Rmd) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_WebScraping.R))

- Use Case: Hostels Madrid ([Browser](https://github.com/Japhilko/GeoData/blob/master/workshops/Madrid_hostels.md))


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

- Interactive maps with R-package leaflet 
([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/Interactive_maps.pdf) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_Interactive maps.R))



Kontext und Ausblick
---------------------
In this session the context is presented, buzz words are spatial turn, vernacular geography and neogeography.

- Kontext und Ausblick ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/SpatialMA_Course11.pdf))
