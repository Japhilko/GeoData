Spatial visualisations
====================

In this directory you can find files from my course on spatial visualisation. 

Introduction
---------------------

- Introduction  ([Browser](https://github.com/Japhilko/GeoData/blob/master/2015/Introduction.md) |
[pdf](https://github.com/Japhilko/GeoData/blob/master/2015/Introduction.pdf))
- Use case - Asylum seekers ([Browser](https://github.com/Japhilko/GeoData/blob/master/2015/Asylum_seekers.md) |  [pdf](https://github.com/Japhilko/GeoData/blob/master/2015/Asylum_seekers.pdf) | [rcode](https://github.com/Japhilko/GeoData/blob/master/2015/rcode/SpatMA_AsylumSeekers.R) )
- Organisation and background ([Browser](https://github.com/Japhilko/GeoData/blob/master/2015/Organisation_and_background.md) |
[pdf](https://github.com/Japhilko/GeoData/blob/master/2015/Organisation_and_background.pdf))


[Here](https://github.com/Japhilko/GeoData/blob/master/2015/github.md) you can find information about the usage of the `github` repo.

Please download and install [R](https://cran.uni-muenster.de/) and [Rstudio](https://www.rstudio.com/products/rstudio/download/) to follow this course. The installation process is straightforward. 

Various Map Types with ggmap
---------------------

The R-package [ggmap](http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf) will be used in this section to 
produce different types of maps with the command [qmap](http://www.inside-r.org/packages/cran/ggmap/docs/qmap).

- Various map types with ggmap ([pdf](https://github.com/Japhilko/GeoData/raw/master/2015/MapTypes.pdf) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_ggmap.R) )
- Use case: [points of interest](https://rpossib.wordpress.com/2015/09/15/points-of-interest-for-backpackers/) for backpackers in Amsterdam

Political and thematic maps with R-package maps 
---------------------

A political map does not show any topographic features or information about roads or important buildings. The political map focuses on administrative boundaries. In the following 3 approaches are presented to produce political maps. The thematic map is designed to show a particular theme connected with a specific geographic area ([Wikipedia](https://en.wikipedia.org/wiki/Thematic_map)). 

- Organisation and Background Information ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/SpatialMA_Course3.pdf))
- Political maps with R-package maps ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/C_maps.pdf) | [browser](https://rpossib.wordpress.com/2015/09/18/political-maps-with-r/) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_maps.R) )


Polygons with R-package maptools
---------------------

- Recap of important R commands ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/RcommandsRecap.pdf))
- Introduction to R-package maptools ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/D_maptools.pdf) 
| [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_maptools.R))
- Polygon sources ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/PolygonSources.pdf)| [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_polygonSources.R))
- Hints on map ideas ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/MapIdeas.pdf))


Data Sources and Color coding
---------------------
It is the target of this session to show how map data can be linked with other data to produce spatial visualisations. To produce the visualisations the R-package spplot is used.


- R recap: Import ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/dataImport.pdf) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_dataImport.R)) and combination ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/Matching.pdf) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_Matching.R))
of data sources
- Example with R-package spplot ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/E_spplot.pdf)  | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_spplot.R))
- Use Case: Maps with Eurostat data ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/eurostatMapsR.pdf) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_EurostatMaps.R))
- Use Case: Webscraping data on nursery ([pdf](https://github.com/Japhilko/GeoData/blob/master/2015/WebScraping.pdf) | [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/rcode/SpatMA_WebScraping.R))



Assignment: Please download data for one of the Principal European Economic Indicators ([PEEI](http://ec.europa.eu/eurostat/web/euro-indicators/peeis)) and visualise it in a map.

