Nutzung von Geodaten in den Sozialwissenschaften
====================

Thema ist die Beschaffung und Nutzung von räumlichen Informationen (GeoDaten) in einem (sozial-) wissenschaftlichen Kontext.  Dabei handelt es sich bei den GeoDaten bspw. um Shapefiles oder  [OpenStreetMap](http://openstreetmap.de/) Daten.  Es werden vor allem Quellen für frei verfügbare Daten vorgestellt. 

Als Beispiele für sozialwissenschaftliche Daten werden neben Public-Use-Files der Bevölkerungsbefragungen auch Daten des Zensus-Atlas und Daten von Eurostat, der Weltbank und freien Portalen wie [datahub.io](https://datahub.io/) und [Wikipedia](https://www.wikidata.org/wiki/Wikidata:Main_Page) verwendet. Für die Analyse der Daten und die Visualisierung in Karten wird ausschließlich die Programmiersprache R genutzt. 


Einführung und Vorbereitung
---------------------

- Motivation ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Einleitung.Rmd)) - [Regionales](http://rpubs.com/Japhilko82/OpenStreetMap_Mannheim)

- Unter [Infos github](https://github.com/Japhilko/GeoData/blob/master/2015/slides/github.md) sind Informationen zur Nutzung des  Verzeichnisses zu finden.

- Um den Kurs zu verfolgen muss [R](https://cran.uni-muenster.de/) und [Rstudio](https://www.rstudio.com/products/rstudio/download/) installiert werden. Der Installationsprozess ist relativ einfach. 

Verschiedene Kartentypen mit `ggmap`
---------------------

- Nutzung von R-Paket [ggmap](http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf) zur Erzeugung verschiedener Kartentypen. ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/MapTypes.Rmd) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_ggmap.R) )

- Beispiel: *Points of interest* ([poi](https://rpossib.wordpress.com/2015/09/15/points-of-interest-for-backpackers/)) für Backpacker in Amsterdam

- Übersicht wichtiger R-Befehle ([pdf](https://github.com/Japhilko/GeoData/blob/master/2016/slides/RcommandsRecap.Rmd))

Quellen für räumliche Daten
---------------------

- Politische und thematische Karten mit dem R-Paket [maps](https://cran.r-project.org/web/packages/maps/index.html) ([Browser ](https://github.com/Japhilko/GeoData/blob/master/2016/slides/maps.Rmd) | [blog](https://rpossib.wordpress.com/2015/09/18/political-maps-with-r/) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_maps.R) )

- Choroplethen mit dem R-Paket maptools ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/maptools.Rmd) 
| [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_maptools.R))


- Quellen für Geodaten ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/polygonSources.Rmd)|
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_polygonSources.R))

- Administrative Grenzen mit [GADM](http://www.gadm.org/) 
([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/KartenErstellen.Rmd))


Sozialwissenschaftliche Datenquellen
---------------------

- Öffentliche Daten zur freien Verfügung ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/DataPUF.Rmd))

- Daten von [datahub.io](https://datahub.io/de/) ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Datahub.Rmd))

- Daten Import ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/dataImport.Rmd) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_dataImport.R)) 

- Beispiel: Webscraping ([browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/WebScraping.Rmd) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_WebScraping.R))

Import und Verbindung von Daten
---------------------

- Data Linkage ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Matching.Rmd) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_Matching.R))
of data sources

- R-Paket `spplot` und Farbkodierung ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/spplot.Rmd)| 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_spplot.R))

- Daten für die Beispiele ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Course6.Rmd) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_DataUseCases.R)
), Datenquellen in R ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Choroplethen.Rmd))


- Beispiel: *Maps with Eurostat data* ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/eurostatMapsR.pdf) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_EurostatMaps.R))


- Weitere Beispiele: Hostels Madrid ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Madrid_hostels.Rmd)), [Energieerzeugung](https://rpossib.wordpress.com/2015/11/20/use-openstreetmap-date/)



Einfärbung und Editierung von Polygonen
---------------------

- Thematische Karten mit dem R-PakeT `tmap` ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/F_tmap.pdf) |
[Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/tmap.Rmd) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_tmap.R))

- Das R-Paket `choroplethr` ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Choroplethr.Rmd) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_Choroplethr.R))


Nutzung von OpenStreetMap Daten
---------------------

- Das Arbeiten mit XML-Dateien ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/OpenStreetMap.Rmd))

- Die Nutzung von Programmierschnittstellen

- Das R-Paket `osmar` 


Interaktive Karten
---------------------

- Interaktive Karten und Präsentation ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/PresentingResults.Rmd)
| [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_PrepPresentation.R))
Beispiel - [Campingplätze](http://rpubs.com/Japhilko82/Campsites)

- Das R-Paket `spdep` - Nachbarschaft und Distanz ([Browser](https://github.com/Japhilko/GeoData/blob/master/2015/slides/K_spdep.md) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_spdep.R))

- Interaktive Karten mit dem R-Paket `leaflet` 
([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/InteractiveMaps.Rmd) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_Interactive maps.R))



Kontext und Ausblick
---------------------

- Kontext und Ausblick ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/SpatialMA_Course11.pdf))
