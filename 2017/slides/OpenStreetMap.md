# Das Arbeiten mit OSM Daten
Jan-Philipp Kolb  
22 Februar 2017  










## [OSM Ausschnitte herunterladen](http://www.openstreetmap.org/export)

<www.openstreetmap.org/export>

![osm export](http://www.azavea.com/blogs/atlas/wp-content/uploads/2015/11/openstreetmap_export-1024x505.png)

## Das R-Paket `XML` - Gaston Sanchez


```r
library("XML")
```

![Gaston Sanchez - Dataflow](https://raw.githubusercontent.com/gastonstat/tutorial-R-web-data/master/01-introduction/images/jaume_nit.jpg)

Seine Arbeit sieht man [hier](http://gastonsanchez.com/).


## Wichtiger für mich:

[Das Arbeiten mit XML Daten](https://github.com/gastonstat/tutorial-R-web-data/blob/master/04-parsing-xml/04-parsing-xml.pdf)

<https://github.com/gastonstat/tutorial-R-web-data/blob/master/04-parsing-xml/04-parsing-xml.pdf>

![Manual von Gaston Sanchez](figure/GastonSanchez.PNG)


## Funktionen im XML Paket


     1                2                                        
---  ---------------  -----------------------------------------
2    xmlName()        name of the node                         
3    xmlSize()        number of subnodes                       
4    xmlAttrs()       named character vector of all attributes 
5    xmlGetAttr()     value of a single attribute              
6    xmlValue()       contents of a leaf node                  
7    xmlParent()      name of parent node                      
8    xmlAncestors()   name of ancestor nodes                   
9    getSibling()     siblings to the right or to the left     
10   xmlNamespace()   the namespace (if there’s one)           

## Beispiel: administrative Grenzen Berlin

[Administrative Grenzen für Deutschland](http://wiki.openstreetmap.org/wiki/DE:Grenze#Bundesl.C3.A4ndergrenze_-_admin_level.3D4)




```r
url <- "http://api.openstreetmap.org/api/0.6/
relation/62422"
```



```r
library(xml2)
BE <- xmlParse(url)
```

![Administrative Grenzen  Berlin](https://raw.githubusercontent.com/Japhilko/GeoData/master/data/figure/ExampleAdmBE.PNG)

## Das XML analysieren

- [Tobi Bosede - Working with XML Data in R](http://www.informit.com/articles/article.aspx?p=2215520)


```r
xmltop = xmlRoot(BE)
class(xmltop)
```

```
## [1] "XMLInternalElementNode" "XMLInternalNode"       
## [3] "XMLAbstractNode"
```

```r
xmlSize(xmltop)
```

```
## [1] 1
```

```r
xmlSize(xmltop[[1]])
```

```
## [1] 327
```


## Nutzung von Xpath

[Xpath](https://de.wikipedia.org/wiki/XPath), the XML Path Language, is a query language for selecting nodes from an XML document. 



```r
xpathApply(BE,"//tag[@k = 'source:population']")
```

```
## [[1]]
## <tag k="source:population" v="http://www.statistik-berlin-brandenburg.de/Publikationen/Stat_Berichte/2010/SB_A1-1_A2-4_q01-10_BE.pdf 2010-10-01"/> 
## 
## attr(,"class")
## [1] "XMLNodeSet"
```


## Mehr Beispiele, wie man mit XML Daten umgeht:


- [Daten aus XML extrahieren](http://www.stat.berkeley.edu/~statcur/Workshop2/Presentations/XML.pdf)

<http://www.stat.berkeley.edu/~statcur/Workshop2/Presentations/XML.pdf>

- Duncan Temple Lang - [A Short Introduction to the XML package for R](http://www.omegahat.org/RSXML/shortIntro.pdf)

<http://www.omegahat.org/RSXML/shortIntro.pdf>

## Noch mehr Informationen

- [Web Daten manipulieren](http://www.di.fc.ul.pt/~jpn/r/web/index.html#parsing-xml)

<http://www.di.fc.ul.pt/~jpn/r/web/index.html#parsing-xml>

- [Information zu xquery](http://www.w3schools.com/xquery/)

<http://www.w3schools.com/xquery/>

- [R und das Web (für Anfänger), Teil II: XML und R](http://giventhedata.blogspot.de/2012/06/r-and-web-for-beginners-part-ii-xml-in.html)

<http://giventhedata.blogspot.de/2012/06/r-and-web-for-beginners-part-ii-xml-in.html>

- [String Manipulation](http://gastonsanchez.com/Handling_and_Processing_Strings_in_R.pdf)

<http://gastonsanchez.com/Handling_and_Processing_Strings_in_R.pdf>

## Referenzen


```r
citation("XML")
```

```
## 
## To cite package 'XML' in publications use:
## 
##   Duncan Temple Lang and the CRAN Team (2016). XML: Tools for
##   Parsing and Generating XML Within R and S-Plus. R package
##   version 3.98-1.5. https://CRAN.R-project.org/package=XML
## 
## A BibTeX entry for LaTeX users is
## 
##   @Manual{,
##     title = {XML: Tools for Parsing and Generating XML Within R and S-Plus},
##     author = {Duncan Temple Lang and the CRAN Team},
##     year = {2016},
##     note = {R package version 3.98-1.5},
##     url = {https://CRAN.R-project.org/package=XML},
##   }
## 
## ATTENTION: This citation information has been auto-generated from
## the package DESCRIPTION file and may need manual editing, see
## 'help("citation")'.
```

