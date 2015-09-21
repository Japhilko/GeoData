# http://arc-team-open-research.blogspot.de/2013/01/manager-usefull-plugin-for-qgis.html


  # read and write shapefiles with R
# http://geostat-course.org/system/files/geostat13_in%2526outAM.pdf


# https://slipiste.wordpress.com/tag/writeogr/


save(bg_poly22, file = "bg_poly22.rda")

?writeOGR 
# td <- tempdir()
writeOGR(bg_poly22, td, "bg_poly22", driver="ESRI Shapefile")
writeOGR(obj=bg_poly22,dsn="bg_poly22",layer="bg_poly22",driver="ESRI Shapefile")

tmpfl <- paste(tempdir(), "xxpoly", sep="/")
writeSpatialShape(bg_poly22, tmpfl)
