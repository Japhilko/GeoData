Import von csv-Dateien
----------------------

-   csv-Dateien aus dem Internet direkt einlesen

<!-- -->

    link <- "https://raw.githubusercontent.com/Japhilko/
    GeoData/master/data/TrustData.csv"

    trust_data <- read.csv2(link)

-   Für Deutsche Daten sollte `read_csv2` verwendet werden

Sich die Daten anzeigen lassen
------------------------------

    head(trust_data)

    ##   Personal.characteristics      Countries Periods score
    ## 1                    Total        Austria    2010     .
    ## 2                    Total        Belgium    2010     6
    ## 3                    Total       Bulgaria    2010   3,9
    ## 4                    Total        Croatia    2010   4,4
    ## 5                    Total         Cyprus    2010   5,5
    ## 6                    Total Czech Republic    2010   4,9

<table>
<thead>
<tr class="header">
<th align="left">Personal.characteristics</th>
<th align="left">Countries</th>
<th align="right">Periods</th>
<th align="left">score</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Total</td>
<td align="left">Austria</td>
<td align="right">2010</td>
<td align="left">.</td>
</tr>
<tr class="even">
<td align="left">Total</td>
<td align="left">Belgium</td>
<td align="right">2010</td>
<td align="left">6</td>
</tr>
<tr class="odd">
<td align="left">Total</td>
<td align="left">Bulgaria</td>
<td align="right">2010</td>
<td align="left">3,9</td>
</tr>
<tr class="even">
<td align="left">Total</td>
<td align="left">Croatia</td>
<td align="right">2010</td>
<td align="left">4,4</td>
</tr>
<tr class="odd">
<td align="left">Total</td>
<td align="left">Cyprus</td>
<td align="right">2010</td>
<td align="left">5,5</td>
</tr>
<tr class="even">
<td align="left">Total</td>
<td align="left">Czech Republic</td>
<td align="right">2010</td>
<td align="left">4,9</td>
</tr>
</tbody>
</table>

    colnames(trust_data)

    ## [1] "Personal.characteristics" "Countries"               
    ## [3] "Periods"                  "score"

Import Excel-files
------------------

    library("readxl")

    ab <- read_excel("dataset.xlsx",sheet=1)

-   Blatt Index als zweites Argument nötig

Weltkulturerbe Datensatz einlesen
---------------------------------

    url <- "https://raw.githubusercontent.com/Japhilko/
    GeoData/master/2015/data/whcSites.csv"

    whc <- read.csv(url) 

Übersicht zum Weltkulturerbe Datensatz
--------------------------------------

    table(whc$category)

    ## 
    ## Cultural    Mixed  Natural 
    ##      802       32      197

    colnames(whc)

    ##  [1] "X"                    "unique_number"        "id_no"               
    ##  [4] "rev_bis"              "name_en"              "name_fr"             
    ##  [7] "short_description_en" "short_description_fr" "justification_en"    
    ## [10] "justification_fr"     "date_inscribed"       "secondary_dates"     
    ## [13] "danger_list"          "longitude"            "latitude"            
    ## [16] "area_hectares"        "C1"                   "C2"                  
    ## [19] "C3"                   "C4"                   "C5"                  
    ## [22] "C6"                   "N7"                   "N8"                  
    ## [25] "N9"                   "N10"                  "criteria_txt"        
    ## [28] "category"             "category_short"       "states_name_en"      
    ## [31] "states_name_fr"       "name_en.1"            "name_fr.1"           
    ## [34] "iso_code"             "udnp_code"            "transboundary"

Ein Balkendiagramm erzeugen
---------------------------

    barplot(table(whc$category))

![](dataImport_files/figure-markdown_strict/unnamed-chunk-12-1.png)<!-- -->

Import .sav-Daten
-----------------

    library(foreign)
    mz10 <- read.spss("mz2010_cf.sav",to.data.frame=T)

Der Befehl read.spss
--------------------

    ?read.spss

stata-Dateien lesen
-------------------

-   Datensatz über Studierende (2000) vom
    [Forschungsdatenzentrum](http://www.forschungsdatenzentrum.de/bestand/studenten/cf/2000/index.asp)
-   Datensatz hat 206867 Einträge

<!-- -->

    studis <- read.dta("studenten_cf_2000.dta")

-   Blog post zum lesen und schreiben von stata Dateien auf
    [is.R](http://is-r.tumblr.com/post/37181850668/readingwriting-stata-dta-files-with-foreign)

Datenexport und Quellen
-----------------------

    x <- runif(1000)
    save(x, file="WasAuchImmer.RData")

Quick R zum Datenimport

<http://www.statmethods.net/input/index.html>

Datenmanagement ein wenig wie bei SPSS

    install.packages("Rz")
    library(Rz)
