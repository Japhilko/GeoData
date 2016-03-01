Outline
-------

Various map types:

-   [Road
    maps](https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/ggmap/ggmapCheatsheet.pdf)
-   Satellite maps
-   Terrain maps/physical maps
-   [Abstracted
    maps](http://www.designfaves.com/2014/03/abstracted-maps-reveal-cities-personalities)

There are more which will be presented next week...

The R-package
[ggmap](http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf)
will be used in the following to produce different types of maps with
the command
[qmap](http://www.inside-r.org/packages/cran/ggmap/docs/qmap)

Road maps
---------

![pic](C:/Users/kolbjp/Documents/GitHub/GeoData/data/figure/Road_Map.jpg)

[Source](http://www.awtechnology.com/images/Road_Map.jpg)

A road map is one of the most widely used map types.

-   These maps show major and minor highways and roads (depending on
    detail)
-   as well as things like airports, city locations and points of
    interest like parks, campgrounds and monuments.
-   Major highways on a road map are generally red and larger than other
    roads,
-   while minor roads are a lighter color and a narrower line.

Install the library
-------------------

-   We'll need package ggmap - so we have to install it:

1.  possibility

<!-- -->

    install.packages("ggmap")

1.  possibility:

![pic](C:/Users/kolbjp/Documents/GitHub/GeoData/data/figure/Installpackages1.PNG)

Install packages
----------------

![pic](C:/Users/kolbjp/Documents/GitHub/GeoData/data/figure/Installpackages2.PNG)

Library ggmap - Hello world
---------------------------

-   To load the library we use the command `library`

<!-- -->

    library(ggmap)

    qmap("Mannheim")

![pic](C:/Users/kolbjp/Documents/GitHub/GeoData/data/figure/ggmapRoadmapMannheim.png)

Use another zoom level
----------------------

-   level 3 - continent
-   level 10 - city
-   level 21 - building

<!-- -->

    qmap("Germany", zoom = 6)

![pic](J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/paper/figure/Germany.png)

Get help with the questionmark
------------------------------

    ?qmap

Different components in the help

-   Description
-   Usage
-   Arguments
-   Value
-   Author(s)
-   See Also
-   Examples

The examples section of help
----------------------------

Extract from the help file on qmap:

![pic](C:/Users/kolbjp/Documents/GitHub/GeoData/data/figure/qmapExample.PNG)

This examples can be directly copy-pasted to the console

    qmap(location = "baylor university")
    qmap(location = "baylor university", zoom = 14)
    # and so on

ggmap - source OpenStreetMap
----------------------------

    qmap('Mannheim', zoom = 14, source="osm")

![pic](J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/paper/figure/Mannheim14.png)

ggmap - OpenStreetMap - black/white
-----------------------------------

    qmap('Mannheim', zoom = 14, source="osm",color="bw")

![pic](J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/paper/figure/Mannheim14_osm_bw.png)

ggmap - maptype satellite
-------------------------

    qmap('Mannheim', zoom = 14, maptype="satellite")

![pic](J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/paper/figure/Mannheim14_satellite.png)

ggmap - maptype satellite zoom 21
---------------------------------

    qmap('Mannheim', zoom = 21, maptype="hybrid")

![pic](J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/paper/figure/Mannheim21_hybrid.png)

Terrain/physical maps
---------------------

Physical maps illustrate the physical features of an area, such as the
mountains, rivers and lakes. Colors are used to show relief differences
in land elevations.

-   The water is usually shown in blue.
-   a lighter color is typically used at lower elevation and
-   darker color indicate higher elevations.
-   Contour lines can also be used to show elevation changes (they are
    normally spaced at regular intervals)

ggmap - terrain map
-------------------

    qmap('Schriesheim', zoom = 14,
     maptype="terrain")

![pic](J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/paper/figure/Schriesheim14.png)

Abstracted maps
---------------

![pic](C:/Users/kolbjp/Documents/GitHub/GeoData/data/figure/NYabstracted.jpg)

Source: [Design
faves](http://www.designfaves.com/2014/03/abstracted-maps-reveal-cities-personalities)

-   Abstraction is used to create a map with only essential information
-   Example metro maps - directions and little information for
    orientation is included
-   In the following especially background maps

ggmap - maptype watercolor
--------------------------

    qmap('Mannheim', zoom = 14,
     maptype="watercolor",source="stamen")

![pic](J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/paper/figure/Mannheimwatercolor14.png)

ggmap - source stamen
---------------------

    qmap('Mannheim', zoom = 14,
     maptype="toner",source="stamen")

![pic](J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/paper/figure/Mannheim14stamen_toner.png)

ggmap - maptype toner-lite
--------------------------

    qmap('Mannheim', zoom = 14,
     maptype="toner-lite",source="stamen")

![pic](J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/paper/figure/Mannheim14stamen_tonerlite.png)

ggmap - maptype toner-hybrid
----------------------------

    qmap('Mannheim', zoom = 14,
     maptype="toner-hybrid",source="stamen")

![pic](J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/paper/figure/Mannheim14stamen_tonerhybrid.png)

ggmap - maptype terrain-lines
-----------------------------

    qmap('Mannheim', zoom = 14,
     maptype="terrain-lines",source="stamen")

![pic](J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/paper/figure/Mannheim14stamen_tonerterrain-lines.png)

Stamen maps
-----------

These high-contrast B+W (black and white) maps are featured in our
Dotspotting project. They are perfect for data mashups and exploring
river meanders and coastal zones.

Source: <http://maps.stamen.com/>

Save graphics
-------------

![pic](C:/Users/kolbjp/Documents/GitHub/GeoData/data/figure/RstudioExport.PNG)

ggmap - create an object
------------------------

-   `<-` is an assignment operator which can be used to create an object
-   This is useful if you work with several maps at the same time

<!-- -->

    MA_map <- qmap("Mannheim", 
                   zoom = 14,
                   maptype="toner",
                   source="stamen")

Geocoding
---------

> Geocoding (...) uses a description of a location, most typically a
> postal address or place name, to find geographic coordinates from
> spatial reference data ...

[Wikipedia -
Geocoding](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#blockquotes)

    library(ggmap)
    geocode("Mannheim Wasserturm",source="google")

       lon      lat

1 8.473664 49.48483

Latitude and Longitude
----------------------

![pic](http://modernsurvivalblog.com/wp-content/uploads/2013/09/definition-of-latitude-longitude.jpg)

[Source](http://modernsurvivalblog.com/survival-skills/basic-map-reading-latitude-longitude/)

Reverse geocoding
-----------------

> Reverse geocoding is the process of back (reverse) coding of a point
> location (latitude, longitude) to a readable address or place name.
> This permits the identification of nearby street addresses, places,
> and/or areal subdivisions such as neighbourhoods, county, state, or
> country.

Source: [Wikipedia](https://en.wikipedia.org/wiki/Reverse_geocoding)

    revgeocode(c(48,8))

[1] "Qoriley Rd, Somalia"

Get the distance between 2 points
---------------------------------

    mapdist("Q1, 4 Mannheim","B2, 1 Mannheim")

            from             to   m    km     miles seconds

1 Q1, 4 Mannheim B2, 1 Mannheim 746 0.746 0.4635644 211 minutes hours 1
3.516667 0.05861111

    mapdist("Q1, 4 Mannheim","B2, 1 Mannheim",mode="walking")

            from             to   m    km     miles seconds

1 Q1, 4 Mannheim B2, 1 Mannheim 546 0.546 0.3392844 420 minutes hours 1
7 0.1166667

Get another distance
--------------------

    mapdist("Q1, 4 Mannheim","B2, 1 Mannheim",mode="bicycling")

            from             to   m    km    miles seconds

1 Q1, 4 Mannheim B2, 1 Mannheim 555 0.555 0.344877 215 minutes hours 1
3.583333 0.05972222

Geocoding - points of interest
------------------------------

    POI1 <- geocode("B2, 1 Mannheim",source="google")
    POI2 <- geocode("Hbf Mannheim",source="google")
    POI3 <- geocode("Wasserturm Mannheim",source="google")
    ListPOI <-rbind(POI1,POI2,POI3)
    POI1;POI2;POI3

       lon      lat

1 8.462844 49.48569 lon lat 1 8.469879 49.47972 lon lat 1 8.473664
49.48483

Points in map
-------------

    MA_map +
    geom_point(aes(x = lon, y = lat),
    data = ListPOI)

![pic](J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/paper/figure/Mannheim14points.png)

Points in map
-------------

    MA_map +
    geom_point(aes(x = lon, y = lat),col="red",
    data = ListPOI)

![pic](J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/paper/figure/Mannheim14pointsred.png)

ggmap - adding different colors
-------------------------------

    ListPOI$color <- c("A","B","C")
    MA_map +
    geom_point(aes(x = lon, y = lat,col=color),
    data = ListPOI)

![pic](J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/paper/figure/Mannheim14pointsdiffcol.png)

ggmap - bigger dots
-------------------

    ListPOI$size <- c(10,20,30)
    MA_map +
    geom_point(aes(x = lon, y = lat,col=color,size=size),
    data = ListPOI)

![pic](J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/paper/figure/Mannheim14pointsdiffcolsize.png)

Get a route from Google maps
----------------------------

    from <- "Mannheim Hbf"
    to <- "Mannheim B2 , 1"
    route_df <- route(from, to, structure = "route")

[More
information](http://rpackages.ianhowson.com/cran/ggmap/man/route.html)

Draw a map with this information
--------------------------------

    qmap("Mannheim Hbf", zoom = 14) +
      geom_path(
        aes(x = lon, y = lat),  colour = "red", size = 1.5,
        data = route_df, lineend = "round"
      )

![pic](J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/paper/figure/Mannheim14route.png)

Resources
---------

-   [Article by David Kahle and Hadley
    Wickham](http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf)
    on the usage of ggmap.
-   [Grab a
    map](http://rpackages.ianhowson.com/cran/ggmap/man/get_map.html)
-   [Making Maps in
    R](http://www.kevjohnson.org/making-maps-in-r-part-2/)

More about adding points

-   Usage of
    [geom\_point](http://zevross.com/blog/2014/07/16/mapping-in-r-using-the-ggplot2-package/)
-   Question on
    [stackoverflow](http://stackoverflow.com/questions/15069963/getting-a-map-with-points-using-ggmap-and-ggplot2)

![pic](http://i.stack.imgur.com/q3euq.png)

Cheatsheet
----------

-   Cheatsheet on [data
    visualisation](https://www.rstudio.com/wp-content/uploads/2015/04/ggplot2-cheatsheet.pdf)

![pic](https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.png)

Resources and literature
------------------------

[ggmap: Spatial Visualization with
ggplot2](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.375.8693&rep=rep1&type=pdf)

by David Kahle and Hadley Wickham
