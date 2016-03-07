Das R-Paket `XML`
-----------------

Gaston Sanchez - [Basics of XML and
HTML](https://www.dropbox.com/s/eyd4t9h7n9fx0du/getting_web_data_r3_basics_xml_html.pdf?dl=0)

    # install.packages("XML")
    library(XML)

    BLA_link <- "http://www.bernhard-gaul.de/wissen/bundeslaender.php"
    BLA_tab <- readHTMLTable(BLA_link)

Überblick über die Daten
------------------------

Das Paket `rvest`
-----------------

    install.packages("rvest")

    library("rvest")
    link <- "https://de.wikipedia.org/wiki/Liste_der_St%C3%A4dte_in_Finnland"

    staedte_fi <- read_html(link)

    # parse the document for R representation:
    mps.doc <- htmlParse(staedte_fi)

    # get all the tables in mps.doc as data frames
    mps.tabs <- readHTMLTable(mps.doc) 

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
    ##   Duncan Temple Lang and the CRAN Team (2015). XML: Tools for
    ##   Parsing and Generating XML Within R and S-Plus. R package
    ##   version 3.98-1.3. https://CRAN.R-project.org/package=XML
    ## 
    ## A BibTeX entry for LaTeX users is
    ## 
    ##   @Manual{,
    ##     title = {XML: Tools for Parsing and Generating XML Within R and S-Plus},
    ##     author = {Duncan Temple Lang and the CRAN Team},
    ##     year = {2015},
    ##     note = {R package version 3.98-1.3},
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
