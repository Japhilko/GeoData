Hello world
===========

### Fra Mauro Map

![pic](https://raw.githubusercontent.com/Japhilko/GeoData/master/data/figure/FraMauroDetailedMap.jpeg.jpg)

-   Drawing maps has a long history
-   Fra Mauro map (1450) is the greatest memorial of medieval
    cartography
-   Source: [Wikipedia](https://en.wikipedia.org/wiki/Fra_Mauro_map)

### Migrant route to Germany

![pic](http://ichef.bbci.co.uk/news/624/cpsprodpb/32F6/production/_85164031_migrant_journeys_turkey_to_germany_624.png)

-   Used at BBC - get an overview of more maps like this
    [here](http://www.lib.utexas.edu/maps/)

### The road to Europe

Source: [The
Independent](http://www.independent.co.uk/incoming/article10471117.ece/alternates/w460/Migrant-Map-Website.jpg)

![pic](http://www.independent.co.uk/incoming/article10471117.ece/alternates/w460/Migrant-Map-Website.jpg)

-   Data on the conflict in Syria -
    [UNHCR](http://data.unhcr.org/syrianrefugees/regional.php)

-   Analysis on [Syrian Refugee Settlement Clinic
    Locations](http://www.r-bloggers.com/syrian-refugee-settlement-clinic-locations/)
    with R

Motivation
==========

### GDP per capita

Data source: [World Development
Indicators](http://data.worldbank.org/data-catalog/world-development-indicators)

![](Introduction_files/figure-markdown_strict/unnamed-chunk-5-1.png)

### GDP in German federal states

![pic](https://raw.githubusercontent.com/Japhilko/GeoData/master/data/figure/BIP2BLA.png)

### GDP in German federal states

-   Map produced with R-package
    [sp](https://cran.r-project.org/web/packages/sp/index.html)

-   Data source:
    [Wikipedia](https://de.wikipedia.org/wiki/Land_%28Deutschland%29)

-   Polygon source: Global Administrative Areas
    ([GADM](http://www.gadm.org/))

### More detailed - more interesting?

Social index - Proportion of social benefits recipients in Berlin

![pic](http://www.tagesspiegel.de/images/sozialhilfeempfaenger/1487336/5-format11.jpg)

Source:
[Tagesspiegel](http://www.tagesspiegel.de/images/sozialhilfeempfaenger/1487336/5-format11.jpg)

### Is the necessary data available?

![pic](https://raw.githubusercontent.com/Japhilko/GeoData/master/data/figure/Zensus_Mannheim2.png)[Source](https://atlas.zensus2011.de/)

### The spatial perspective...

-   ... is relevant to get an overview of current developments

-   ... is relevant to understand circumstances.

### But how to get the adequate data?

-   Necessary data is often not available
-   More spatial visualisations are possible with web-data via
    Application Programming Interface (API)

### A little quiz - which town is it?

![pic](http://images.fastcompany.com/upload/4621770959_383261aebe_b.jpg)

### Background info

-   Map of photographic/traffic activity
-   Data from [flickr](https://www.flickr.com/) used
-   Guess about picture taker's mode of transportation
-   Time stamps and distance traveled between a user's pictures
    -   Black is walking (less than 7mph),
    -   Red is bicycling or equivalent speed (less than 19mph),
    -   Blue is motor vehicles on normal roads (less than 43mph);
    -   Green is freeways or rapid transit.

### New York

![pic](http://images.fastcompany.com/upload/4621770959_383261aebe_b.jpg)

Source: [Eric
Fischer](http://www.fastcompany.com/1652550/infographic-day-using-flickr-geotags-map-worlds-cities-updated)

### Two ideas combined

-   Map Of Touristiness

-   Tracking Taxis Across Manhattan

-   [The geotaggers world
    atlas](https://www.flickr.com/photos/walkingsf/sets/72157623971287575/)

### World Map Of Touristiness

![pic](http://s3.amazonaws.com/infobeautiful2/550_touristyness.jpg)

Source: [Touristiness](http://www.bluemoon.ee/~ahti/touristiness-map/)

Based on tourist pictures uploaded on
[panoramio](http://www.panoramio.com/)

### Locals and Tourists

-   Blue points on the map are pictures taken by locals (people who have
    taken pictures in this city dated over a range of a month or more).

-   Red points are pictures taken by tourists (people who seem to be a
    local of a different city and who took pictures in this city for
    less than a month).

-   Yellow points are pictures where it can't be determined whether or
    not the photographer was a tourist (because they haven't taken
    pictures anywhere for over a month).

### [Tourists and Locals](https://www.flickr.com/photos/walkingsf/sets/72157624209158632/)

![pic](../data/figure/TouristsLocals.png)

### Tracking Taxis Across Manhattan

![pic](http://images.fastcompany.com/upload/Screen%20shot%202010-04-05%20at%209.05.50%20AM.png)

Source: [The New York
Times](http://www.fastcompany.com/1607065/infographic-day-tracking-taxis-across-manhattan)

### Target / Motivation

<strong>The target is to visualize <FONT COLOR="red"> social </FONT>
aspects in maps.</strong>

<a href="http://spatial.ly/2015/07/15minutemap/" target="_blank"><img src="http://spatial.ly/wp-content/uploads/2015/07/hurricanes.jpg" width="240" height="180" border="10" /></a>
<a href="https://www.mapbox.com/blog/osm-community-visualized/" target="_blank"><img src="https://farm3.staticflickr.com/2849/9774592706_3c2eafe310_c.jpg" width="240" height="180" border="10" /></a>
<a href="https://uchicagoconsulting.wordpress.com/" target="_blank"><img src="https://uchicagoconsulting.files.wordpress.com/2011/04/5.png?w=450&h=309" width="240" height="180" border="10" /></a>
<a href="http://blogs.casa.ucl.ac.uk/category/r/" target="_blank"><img src="http://spatial.ly/wp-content/uploads/2014/07/journey_to_work_web.gif" width="240" height="180" border="10" /></a>
<a href="http://statmatt.com/r-ggmap-examples-plot-overlay-spatial-data/" target="_blank"><img src="http://statmatt.com/wp-content/uploads/2014/01/Baltimore_3.jpg" width="240" height="180" border="10" /></a>
<a href="http://www.pilod.nl/w/images/6/62/D9-fig4.jpg" target="_blank"><img src="http://www.pilod.nl/w/images/6/62/D9-fig4.jpg" width="240" height="180" border="10" /></a>

More [examples](http://spatial.ly/blog/)

### Spatial? - Motivation

-   Massive amounts of data ... and growing!
-   Often freely accessible on the web (e.g. through APIs)
-   Often unstructured or semi-structured (e.g. web documents, news
    archives), often heterogeneous
-   Often not intended for geographic purposes, but implicitly
    containing geographic info implicitly (Web 2.0)
-   Often with little or no metadata

[Examples](https://www.flickr.com/groups/qgis/pool)
