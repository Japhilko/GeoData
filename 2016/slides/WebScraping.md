Das R-Paket `XML`
-----------------

Gaston Sanchez - [Basics of XML and
HTML](https://www.dropbox.com/s/eyd4t9h7n9fx0du/getting_web_data_r3_basics_xml_html.pdf?dl=0)

    # install.packages("XML")
    library(XML)
    library("rvest")

    ## Loading required package: xml2

    ## 
    ## Attaching package: 'rvest'

    ## The following object is masked from 'package:XML':
    ## 
    ##     xml

Einlesen einer Tabelle mit der Funktion `readHTMLTable`:

Beispieldaten für die Bundesländer

    BLA_link <- "http://www.bergziege-owl.de/deutschland-
    bundeslander-und-ihre-hauptstadte/"
    BLA_tab <- readHTMLTable(BLA_link)

Überblick über Daten
--------------------

    BLA_tab <- BLA_tab[[1]]

<table>
<thead>
<tr class="header">
<th align="left">V1</th>
<th align="left">V2</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Bundesländer</td>
<td align="left">Hauptstädte</td>
</tr>
<tr class="even">
<td align="left">Schleswig-Holstein</td>
<td align="left">Kiel</td>
</tr>
<tr class="odd">
<td align="left">Mecklenburg-Vorpommern</td>
<td align="left">Schwerin</td>
</tr>
<tr class="even">
<td align="left">Hamburg</td>
<td align="left">Hamburg</td>
</tr>
<tr class="odd">
<td align="left">Bremen</td>
<td align="left">Bremen</td>
</tr>
<tr class="even">
<td align="left">Niedersachsen</td>
<td align="left">Hannover</td>
</tr>
</tbody>
</table>

Daten bearbeiten
----------------

Die erste Zeile ist die Überschrift:

    colnames(BLA_tab) <- c("Bundesländer","Hauptstädte")

Die erste Zeile entfernen:

    BLA_tab <- BLA_tab[-1,]

Die Daten speichern
-------------------

    write.csv(BLA_tab,file="BLA_tab.csv")

Das Paket `rvest`
-----------------

    install.packages("rvest")

    library("rvest")

    link <- "https://de.wikipedia.org/wiki/Fl%C3%BCchtlingskrise_in_Europa_ab_2015"

    link_data <- read_html(link)

    # parse the document for R representation:
    mps.doc <- htmlParse(link_data)

Alle Tabellen bekommen:

    mps.tabs <- readHTMLTable(mps.doc) 

Daten zu Asylanträgen bearbeiten
--------------------------------

    mps.tabs <- mps.tabs[[2]]
    refugeeTab <- mps.tabs[-c(1,34),]

<table>
<thead>
<tr class="header">
<th align="left"></th>
<th align="left">V1</th>
<th align="left">V2</th>
<th align="left">V3</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">2</td>
<td align="left">Belgien Belgien</td>
<td align="left">44.665</td>
<td align="left">3,97</td>
</tr>
<tr class="even">
<td align="left">3</td>
<td align="left">Bulgarien Bulgarien</td>
<td align="left">20.375</td>
<td align="left">2,83</td>
</tr>
<tr class="odd">
<td align="left">4</td>
<td align="left">Danemark Dänemark</td>
<td align="left">20.940</td>
<td align="left">3,70</td>
</tr>
<tr class="even">
<td align="left">5</td>
<td align="left">Deutschland Deutschland</td>
<td align="left">476.510</td>
<td align="left">5,87</td>
</tr>
<tr class="odd">
<td align="left">6</td>
<td align="left">Estland Estland</td>
<td align="left">230</td>
<td align="left">0,18</td>
</tr>
<tr class="even">
<td align="left">7</td>
<td align="left">Finnland Finnland</td>
<td align="left">32.345</td>
<td align="left">5,91</td>
</tr>
</tbody>
</table>

Geburtenrate
------------

    link2 <- "http://www.laenderdaten.de/bevoelkerung/
    geburtenrate.aspx"
    link_data2 <- read_html(link2)
    doc <- htmlParse(link_data2)
    tab <- readHTMLTable(doc)
    tab1 <- tab[[2]]

<table>
<thead>
<tr class="header">
<th align="left">Land</th>
<th align="left">Â</th>
<th align="left">Geburtenrate</th>
<th align="left">Weltrang</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"></td>
<td align="left">Niger</td>
<td align="left">45,45</td>
<td align="left">1</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">Mali</td>
<td align="left">44,99</td>
<td align="left">2</td>
</tr>
<tr class="odd">
<td align="left"></td>
<td align="left">Uganda</td>
<td align="left">43,79</td>
<td align="left">3</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">Sambia</td>
<td align="left">42,13</td>
<td align="left">4</td>
</tr>
<tr class="odd">
<td align="left"></td>
<td align="left">Burkina Faso</td>
<td align="left">42,03</td>
<td align="left">5</td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">Burundi</td>
<td align="left">42,01</td>
<td align="left">6</td>
</tr>
</tbody>
</table>

Fertility Rate
--------------

    link3 <- "https://en.wikipedia.org/wiki/List_of_sovereign_states_and_dependent_territories_by_fertility_rate"
    link_data3 <- read_html(link3)
    doc3 <- htmlParse(link_data3)
    tab3 <- readHTMLTable(doc3)
    tab4 <- tab3[[2]]

-   [Die US Flughäfen und
    Fluglinien](http://www.sasanalysis.com/2013/06/the-us-airports-with-most-flight-routes.html)

<http://www.sasanalysis.com/2013/06/the-us-airports-with-most-flight-routes.html>

-   Mehr Daten - <http://openflights.org/data.html>

<!-- -->

    link1 <- "http://openflights.svn.sourceforge.net/viewvc/openflights/
    openflights/data/airports.dat"
    airport <- read.csv(link1, header = F)

    link2 <- "http://openflights.svn.sourceforge.net/viewvc/openflights/
    openflights/data/routes.dat"
    route <- read.csv(link2, header = F)

Links
-----

Beispiel:
[GiventheData](http://giventhedata.blogspot.de/2012/08/r-and-web-for-beginners-part-iii.html)

[Five easy steps for
webscraping](http://www.unt.edu/rss/class/Jon/Benchmarks/ScrapingData_L_JDS_Nov2013.pdf)

Reference XML
-------------

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

Reference `rvest`
-----------------

    citation("rvest")

    ## 
    ## To cite package 'rvest' in publications use:
    ## 
    ##   Hadley Wickham (2015). rvest: Easily Harvest (Scrape) Web Pages.
    ##   R package version 0.3.1.
    ##   https://CRAN.R-project.org/package=rvest
    ## 
    ## A BibTeX entry for LaTeX users is
    ## 
    ##   @Manual{,
    ##     title = {rvest: Easily Harvest (Scrape) Web Pages},
    ##     author = {Hadley Wickham},
    ##     year = {2015},
    ##     note = {R package version 0.3.1},
    ##     url = {https://CRAN.R-project.org/package=rvest},
    ##   }
