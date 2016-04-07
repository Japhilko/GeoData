Das shapefile Format ...
------------------------

-   ... ist ein beliebtes Format räumlicher Vektordaten für
    geographisches Informationssysteme (GIS).
-   Es wurde entwickelt und reguliert von [ESRI](http://www.esri.com/)

-   (meist) offene Spezifikation um Daten Interoperabilität zwischen
    Esri und anderen Formaten zu sichern.

-   Es können Punkte, Linien und Polygone beschrieben werden

-   Jedes Element hat Attribute, wie bspw. Name oder Temperatur die
    es beschreiben.

Quelle: <https://en.wikipedia.org/wiki/Shapefile>

Global Adminastrative Boundaries - [GADM](http://www.gadm.org/) - NUTS level 1
------------------------------------------------------------------------------

    library(raster)
    LUX1 <- getData('GADM', country='LUX', level=1)
    plot(LUX1)

![](polygonSources_files/figure-markdown_strict/unnamed-chunk-2-1.png)<!-- -->

Ein Blick auf die Daten
-----------------------

Koordinaten im polygon slot

    LUX1@polygons[[1]]@Polygons[[1]]@coords

    ##          [,1]     [,2]
    ## [1,] 6.026519 50.17767
    ## [2,] 6.031361 50.16563
    ## [3,] 6.035646 50.16410
    ## [4,] 6.042747 50.16157
    ## [5,] 6.043894 50.16116
    ## [6,] 6.048243 50.16008

Der Datenslot
-------------

    head(LUX1@data)

    ##   OBJECTID ID_0 ISO     NAME_0 ID_1       NAME_1 HASC_1 CCN_1 CCA_1
    ## 1        1  131 LUX Luxembourg    1     Diekirch  LU.DI    NA      
    ## 2        2  131 LUX Luxembourg    2 Grevenmacher  LU.GR    NA      
    ## 3        3  131 LUX Luxembourg    3   Luxembourg  LU.LU    NA      
    ##     TYPE_1 ENGTYPE_1 NL_NAME_1            VARNAME_1
    ## 1 District  District               Dikrech|Dikkrich
    ## 2 District  District                  Gréivemaacher
    ## 3 District  District           Lëtzebuerg|Luxemburg

[GADM](http://www.gadm.org/)- NUTS level 3
------------------------------------------

<http://www.gadm.org/>

    LUX3 <- getData('GADM', country='LUX', level=3)
    plot(LUX3)

![](polygonSources_files/figure-markdown_strict/unnamed-chunk-7-1.png)<!-- -->

[GADM](http://www.gadm.org/)- NUTS level 4
------------------------------------------

    LUX4 <- getData('GADM', country='LUX', level=4)
    plot(LUX4)

![](polygonSources_files/figure-markdown_strict/unnamed-chunk-8-1.png)<!-- -->

[GADM](http://www.gadm.org/)- NUTS level 3
------------------------------------------

    DEU3 <- getData('GADM', country='DEU', level=3)
    plot(DEU3)

![](polygonSources_files/figure-markdown_strict/unnamed-chunk-9-1.png)<!-- -->

PLZ für Deutschland
-------------------

<http://datahub.io/de/dataset/postal-codes-de>

    library(rgdal)
    PLZ <- readOGR ("post_pl.shp","post_pl")

Der R Befehl readShapePoly
--------------------------

Um Shape-Dateien zu lesen, ist es notwendig, die drei Dateien mit den
folgenden Dateierweiterungen im gleichen Verzeichnis zu haben:

-   .shp
-   .dbf
-   .shx

Mannheim zeichnen
-----------------

    MA <- PLZ[PLZ@data$PLZORT99=="Mannheim",]
    plot(MA)

![Mannheim PLZ](figure/MannheimPLZ.png)

Gemeinden in Deutschland
------------------------

Bundesamt für Kartographie und Geodäsie (BKG)

[Link zum Download der
Karten](http://www.geodatenzentrum.de/geodaten/gdz_rahmen.gdz_div?gdz_spr=deu&gdz_akt_zeile=5&gdz_anz_zeile=1&gdz_unt_zeile=15&gdz_user_id=0)

<http://www.geodatenzentrum.de/>

    library(maptools)
    krs <- readShapePoly("vg250_krs.shp")
    plot(krs)

![Kreise Deutschland](figure/vg250_krs.png)

Kreise eines Bundeslandes
-------------------------

    fds <- substr(krs@data$AGS,1,2)

    plot(krs[fds=="05",])

![Kreise NRW](figure/KreiseNRW.png)

[Vorwahlbereiche in Deutschland](http://www.bundesnetzagentur.de/SharedDocs/Downloads/DE/Sachgebiete/Telekommunikation/Unternehmen_Institutionen/Nummerierung/Rufnummern/ONVerzeichnisse/ONBGrenzen/ONB_Grenzen.html)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

<http://www.bundesnetzagentur.de/>

    onb <- readShapePoly("onb_grenzen.shp")

    kable(head(onb@data))

<table>
<thead>
<tr class="header">
<th align="left"></th>
<th align="left">VORWAHL</th>
<th align="left">NAME</th>
<th align="left">KENNUNG</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">0</td>
<td align="left">04651</td>
<td align="left">Sylt</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">1</td>
<td align="left">04668</td>
<td align="left">Klanxbüll</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">2</td>
<td align="left">04664</td>
<td align="left">Neukirchen b Niebüll</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">3</td>
<td align="left">04663</td>
<td align="left">Süderlügum</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">4</td>
<td align="left">04666</td>
<td align="left">Ladelund</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">5</td>
<td align="left">04631</td>
<td align="left">Glücksburg Ostsee</td>
<td align="left">NA</td>
</tr>
</tbody>
</table>

Vorwahlbereich 06
-----------------

    VW <- substr(onb@data$VORWAHL,1,2)
    plot(onb[VW=="06",])

![Vorwahlbereich 06](figure/Vorwahl06.png)

Wo ist Mannheim?
----------------

    Com <- onb@data$NAME
    plot(onb[VW=="06",])
    plot(onb[Com=="Mannheim",],col="red",add=T)
    plot(onb[Com=="Heidelberg",],col="green",add=T)
    plot(onb[Com=="Kaiserslautern",],col="blue",add=T)

![Drei Städte](figure/DreiStaedte.png)

Andere Quellen
--------------

[World Port
Index](http://msi.nga.mil/NGAPortal/MSI.portal?_nfpb=true&_pageLabel=msi_portal_page_62&pubCode=0015)

    library(rgdal)
    WPI <- readOGR ("WPI.shp","WPI")
    plot(WPI)

![World Port Index](figure/WPI.png)

Datenbanken für Karten

    library(mapdata)

Weitere Quellen
---------------

-   [Eurostat
    Karten](http://epp.eurostat.ec.europa.eu/portal/page/portal/gisco_Geographical_information_maps/popups/%20references/administrative_units_statistical_units_1)

<http://epp.eurostat.ec.europa.eu>

-   [Open linked
    data](https://www.ordnancesurvey.co.uk/business-and-government/products/opendata-products-grid.html)

<https://www.ordnancesurvey.co.uk/>

-   [World Borders
    Datensatz](http://thematicmapping.org/downloads/world_borders.php)
    <http://thematicmapping.org>

-   [National Historical Information System](https://www.nhgis.org/)

<https://www.nhgis.org/>

-   [Freie polygon Daten für die
    USA](http://www.freemapdata.com/html/free_polygon_data.html)

<http://www.freemapdata.com/>

Noch mehr Quellen
-----------------

-   [Spatial Data in
    R](https://science.nature.nps.gov/im/datamgmt/statistics/r/advanced/spatial.cfm)

<https://science.nature.nps.gov/>

-   [ggmap und
    shapefiles](http://www.r-bloggers.com/shapefile-polygons-plotted-on-google-maps-using-ggmap-in-r-throw-some-throw-some-stats-on-that-mappart-2/)

<http://www.r-bloggers.com/>
