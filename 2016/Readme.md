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
- Beispiel: [points of interest](https://rpossib.wordpress.com/2015/09/15/points-of-interest-for-backpackers/) für Backpacker in Amsterdam


Quellen für räumliche Daten
---------------------

 

- Politische und thematische Karten mit dem R-Paket [maps](https://cran.r-project.org/web/packages/maps/index.html) ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/C_maps.pdf) | [browser](https://rpossib.wordpress.com/2015/09/18/political-maps-with-r/) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_maps.R) )



- Administrative Grenzen mit [GADM](http://www.gadm.org/) 
([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/KartenErstellen.Rmd))

- Karten mit dem R-Paket maptools


Einfärbung und Editierung von Polygonen
---------------------

- Recap of important R commands ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/RcommandsRecap.pdf))
- Introduction to R-package maptools ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/D_maptools.pdf) 
| [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_maptools.R))
- Polygon sources ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/PolygonSources.pdf)| [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_polygonSources.R))
- Hints on map ideas ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/MapIdeas.pdf))

Sozialwissenschaftliche Datenquellen
---------------------

- datahub

Data Import and Data Linkage
---------------------
It is the target of this session to show how map data can be linked with other data to produce spatial visualisations. To produce the visualisations the R-package spplot is used.


- Data Import ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/dataImport.pdf) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_dataImport.R)) 
- Data Linkage ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/Matching.pdf) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_Matching.R))
of data sources


Use Cases: Data Import and Data Linkage
---------------------
In this session example datasets for different use cases are presented. And it is shown how to combine these datasets with spatial information.


- R-package spplot and Color coding ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/E_spplot.pdf)  | [Browser](https://github.com/Japhilko/GeoData/blob/master/workshops/E_spplot.md) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_spplot.R))
- Data for the use cases ([Browser](https://github.com/Japhilko/GeoData/blob/master/workshops/Course6.md) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_DataUseCases.R)
)
- Use Case: Maps with Eurostat data ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/eurostatMapsR.pdf) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_EurostatMaps.R))
- Use Case: Webscraping data on nursery ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/WebScraping.pdf) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_WebScraping.R))
- Use Case: Hostels Madrid ([Browser](https://github.com/Japhilko/GeoData/blob/master/workshops/Madrid_hostels.md))


- Choroplethen 
 ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Choroplethen.Rmd))
- Thematic maps with R-package tmap ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/F_tmap.pdf) |
[Browser](https://github.com/Japhilko/GeoData/blob/master/workshops/F_tmap.md) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_tmap.R))
- Interactive maps with R-package leaflet 
([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/Interactive_maps.pdf) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_Interactive maps.R))

Color Coding, Choropleths and point maps
---------------------
The material for this session gives some hints on the preparation of your presentation. 

- Organisation and Interactive maps ([Browser](https://github.com/Japhilko/GeoData/blob/master/2015/slides/Course8.md)
| [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_PrepPresentation.R))
- Example: Interactive Map ([Browser](http://rpubs.com/Japhilko82/Campsites))
- R-Package presentation choroplethr ([Browser](https://github.com/Japhilko/GeoData/blob/master/workshops/G_Choroplethr.md) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_Choroplethr.R))
- R-Package spdep - neighbours and distance ([Browser](https://github.com/Japhilko/GeoData/blob/master/2015/slides/K_spdep.md) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_spdep.R))


Context and Conclusion
---------------------
In this session the context is presented, buzz words are spatial turn, vernacular geography and neogeography.

- Context and conclusion ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/SpatialMA_Course11.pdf))
