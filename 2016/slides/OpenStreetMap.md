Ausschnitte herunterladen
-------------------------

&lt;www.openstreetmap.org/export&gt;

![osm
export](http://www.azavea.com/blogs/atlas/wp-content/uploads/2015/11/openstreetmap_export-1024x505.png)

Das R-Paket `XML` - Gaston Sanchez
----------------------------------

    library("XML")

![Gaston Sanchez -
Dataflow](http://gastonsanchez.com/images/blog/dataflow_page.jpg)

Seine Arbeit sieht man [hier](http://gastonsanchez.com/) und ein anderes
[Bild](https://images.duckduckgo.com/iu/?u=http%3A%2F%2Fsomelab.net%2Fwp-content%2Fuploads%2F2013%2F01%2FR_Dials.jpg&f=1).

Wichtiger für mich:
-------------------

[Das Arbeiten mit XML
Daten](http://gastonsanchez.com/work/webdata/getting_web_data_r4_parsing_xml_html.pdf)

<http://gastonsanchez.com/work/webdata/getting_web_data_r4_parsing_xml_html.pdf>

![Manual von Gaston Sanchez](figure/GastonSanchez.PNG)

Funktionen im XML Paket
-----------------------

<table>
<tbody>
<tr class="odd">
<td align="left">Function</td>
<td align="left">Description</td>
</tr>
<tr class="even">
<td align="left">xmlName()</td>
<td align="left">name of the node</td>
</tr>
<tr class="odd">
<td align="left">xmlSize()</td>
<td align="left">number of subnodes</td>
</tr>
<tr class="even">
<td align="left">xmlAttrs()</td>
<td align="left">named character vector of all attributes</td>
</tr>
<tr class="odd">
<td align="left">xmlGetAttr()</td>
<td align="left">value of a single attribute</td>
</tr>
<tr class="even">
<td align="left">xmlValue()</td>
<td align="left">contents of a leaf node</td>
</tr>
<tr class="odd">
<td align="left">xmlParent()</td>
<td align="left">name of parent node</td>
</tr>
<tr class="even">
<td align="left">xmlAncestors()</td>
<td align="left">name of ancestor nodes</td>
</tr>
<tr class="odd">
<td align="left">getSibling()</td>
<td align="left">siblings to the right or to the left</td>
</tr>
<tr class="even">
<td align="left">xmlNamespace()</td>
<td align="left">the namespace (if there’s one)</td>
</tr>
</tbody>
</table>

Beispiel: administrative Grenzen Berlin
---------------------------------------

[Administrative Grenzen für
Deutschland](http://wiki.openstreetmap.org/wiki/DE:Grenze#Bundesl.C3.A4ndergrenze_-_admin_level.3D4)

    url <- "http://api.openstreetmap.org/api/0.6/
    relation/62422"

    BE <- xmlParse(url)

![Administrative Grenzen
Berlin](https://raw.githubusercontent.com/Japhilko/GeoData/master/data/figure/ExampleAdmBE.PNG)

Das XML analysieren
-------------------

-   [Tobi Bosede - Working with XML Data in
    R](http://www.informit.com/articles/article.aspx?p=2215520)

<!-- -->

    xmltop = xmlRoot(BE)
    class(xmltop)

    ## [1] "XMLInternalElementNode" "XMLInternalNode"       
    ## [3] "XMLAbstractNode"

    xmlSize(xmltop)

    ## [1] 1

    xmlSize(xmltop[[1]])

    ## [1] 324

[Xpath](https://de.wikipedia.org/wiki/XPath), the XML Path Language, is
a query language for selecting nodes from an XML document.

    xpathApply(BE,"//tag[@k = 'source:population']")

    ## [[1]]
    ## <tag k="source:population" v="http://www.statistik-berlin-brandenburg.de/Publikationen/Stat_Berichte/2010/SB_A1-1_A2-4_q01-10_BE.pdf 2010-10-01"/> 
    ## 
    ## attr(,"class")
    ## [1] "XMLNodeSet"

Mehr Beispiele, wie man mit XML Daten umgeht:
---------------------------------------------

-   [Daten aus XML
    extrahieren](http://www.stat.berkeley.edu/~statcur/Workshop2/Presentations/XML.pdf)

<http://www.stat.berkeley.edu/~statcur/Workshop2/Presentations/XML.pdf>

-   Duncan Temple Lang - [A Short Introduction to the XML package for
    R](http://www.omegahat.org/RSXML/shortIntro.pdf)

<http://www.omegahat.org/RSXML/shortIntro.pdf>

Noch mehr Informationen
-----------------------

-   [Web Daten
    manipulieren](http://www.di.fc.ul.pt/~jpn/r/web/index.html#parsing-xml)

<http://www.di.fc.ul.pt/~jpn/r/web/index.html#parsing-xml>

-   [Information zu xquery](http://www.w3schools.com/xquery/)

<http://www.w3schools.com/xquery/>

-   [R und das Web (für Anfänger), Teil II: XML und
    R](http://giventhedata.blogspot.de/2012/06/r-and-web-for-beginners-part-ii-xml-in.html)

<http://giventhedata.blogspot.de/2012/06/r-and-web-for-beginners-part-ii-xml-in.html>

-   [String
    Manipulation](http://gastonsanchez.com/Handling_and_Processing_Strings_in_R.pdf)

<http://gastonsanchez.com/Handling_and_Processing_Strings_in_R.pdf>

Referenzen
----------

    citation("XML")

    ## 
    ## To cite package 'XML' in publications use:
    ## 
    ##   Duncan Temple Lang and the CRAN Team (2016). XML: Tools for
    ##   Parsing and Generating XML Within R and S-Plus. R package
    ##   version 3.98-1.4. https://CRAN.R-project.org/package=XML
    ## 
    ## A BibTeX entry for LaTeX users is
    ## 
    ##   @Manual{,
    ##     title = {XML: Tools for Parsing and Generating XML Within R and S-Plus},
    ##     author = {Duncan Temple Lang and the CRAN Team},
    ##     year = {2016},
    ##     note = {R package version 3.98-1.4},
    ##     url = {https://CRAN.R-project.org/package=XML},
    ##   }
    ## 
    ## ATTENTION: This citation information has been auto-generated from
    ## the package DESCRIPTION file and may need manual editing, see
    ## 'help("citation")'.
