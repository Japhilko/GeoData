Nutzung von Geodaten in den Sozialwissenschaften
====================

Das OpenSource Software Paket R ist kostenfrei und bietet neben Standardverfahren der Datenanalyse ein umfangreiches Repertoire von hoch spezialisierten Prozeduren und Verfahren auch für komplexe Anwendungen.

Der Schwerpunkt liegt auf der Vermittlung von Methoden der grafisch gestützten Analyse von Geodaten. 


Intro
---------------------

- Intro ([Browser](https://github.com/Japhilko/GeoData/blob/master/2015/slides/Introduction.md) |
[pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/Introduction.pdf))
- Use case - Asylum seekers ([Browser](https://github.com/Japhilko/GeoData/blob/master/2015/slides/Asylum_seekers.md) |  [pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/Asylum_seekers.pdf) | [rcode](https://github.com/Japhilko/GeoData/blob/master/2015/rcode/SpatMA_AsylumSeekers.R) )
- Organisation and background ([Browser](https://github.com/Japhilko/GeoData/blob/master/2015/slides/Organisation_and_background.md) |
[pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/Organisation_and_background.pdf))


[Here](https://github.com/Japhilko/GeoData/blob/master/2015/slides/github.md) you can find information about the usage of the `github` repo.

Please download and install [R](https://cran.uni-muenster.de/) and [Rstudio](https://www.rstudio.com/products/rstudio/download/) to follow this course. The installation process is straightforward. 

Various Map Types with ggmap
---------------------

The R-package [ggmap](http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf) will be used in this section to 
produce different types of maps with the command [qmap](http://www.inside-r.org/packages/cran/ggmap/docs/qmap).

- Various map types with ggmap ([pdf](https://github.com/Japhilko/GeoData/raw/master/2015/slides/MapTypes.pdf) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_ggmap.R) )
- Use case: [points of interest](https://rpossib.wordpress.com/2015/09/15/points-of-interest-for-backpackers/) for backpackers in Amsterdam

Political and thematic maps with R-package maps 
---------------------

A political map does not show any topographic features or information about roads or important buildings. The political map focuses on administrative boundaries. In the following 3 approaches are presented to produce political maps. The thematic map is designed to show a particular theme connected with a specific geographic area ([Wikipedia](https://en.wikipedia.org/wiki/Thematic_map)). 

- Organisation and Background Information ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/SpatialMA_Course3.pdf))
- Political maps with R-package maps ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/C_maps.pdf) | [browser](https://rpossib.wordpress.com/2015/09/18/political-maps-with-r/) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_maps.R) )


Polygons with R-package maptools
---------------------

- Recap of important R commands ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/RcommandsRecap.pdf))
- Introduction to R-package maptools ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/D_maptools.pdf) 
| [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_maptools.R))
- Polygon sources ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/PolygonSources.pdf)| [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_polygonSources.R))
- Hints on map ideas ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/MapIdeas.pdf))


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

Assignment: Please download the data for your use case and visualise it in a map.

Thematic / Interactive maps and Choropleths
---------------------

- Organisation and Background Information ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/slides/Course7.pdf))
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
