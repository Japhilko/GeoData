Library ggmap
-------------

    library(ggmap)

    qmap("Mannheim")

![](C_ggmap_files/figure-markdown_strict/unnamed-chunk-2-1.png)

    MA_map <- qmap("Mannheim",zoom=14)

Other zoom level
----------------

    qmap(location = 'Mannheim', zoom = 12)

![](C_ggmap_files/figure-markdown_strict/unnamed-chunk-3-1.png)

Get closer
----------

    qmap(location = 'Mannheim', zoom = 13)

![](C_ggmap_files/figure-markdown_strict/unnamed-chunk-4-1.png)

Get very close
--------------

    qmap(location = 'Mannheim', zoom = 20)

![](C_ggmap_files/figure-markdown_strict/unnamed-chunk-5-1.png)

ggmap - source
--------------

    qmap(location = 'Mannheim', zoom = 14, source="osm")

![](C_ggmap_files/figure-markdown_strict/unnamed-chunk-6-1.png)

ggmap - maptype
---------------

    qmap(location = 'Mannheim', zoom = 14, maptype="satellite")

![](C_ggmap_files/figure-markdown_strict/unnamed-chunk-7-1.png)

ggmap - maptype
---------------

    qmap(location = 'Mannheim', zoom = 14, maptype="hybrid")

![](C_ggmap_files/figure-markdown_strict/unnamed-chunk-8-1.png)

ggmap - maptype
---------------

    qmap(location = 'Mannheim', zoom = 14,
     maptype="toner",source="stamen")

![](C_ggmap_files/figure-markdown_strict/unnamed-chunk-9-1.png)

Geocoding
---------

    POI <- c("B2, 1 Mannheim","Hbf Mannheim",
             "Wasserturm Mannheim")

    ListPOI <- data.frame(lat=NA,lon=NA)

    for ( i in 1:length(POI)){
      geoPOI <- geocode(POI[i])
      ListPOI[i,"lat"] <-  geoPOI$lat 
      ListPOI[i,"lon"] <-  geoPOI$lon 
    }

Points in map
-------------

<http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf>

    MA_map +
    geom_point(aes(x = lon, y = lat),
    data = ListPOI)

![](C_ggmap_files/figure-markdown_strict/unnamed-chunk-11-1.png)
