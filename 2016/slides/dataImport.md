Import von csv-Dateien
----------------------

You can download a statistic on dead refugees from
[unitedagainstracism.org](unitedagainstracism.org)

[Link
datahub.io](http://datahub.io/dataset/list-of-deaths-on-the-borders-of-europe-1993-2012/resource/cc85b8fc-99be-4503-9040-099ee3a42efd)

    data.path <- "C:/Work/data/"
    setwd(data.path)
    lod <- read.csv("listofdeath.csv")

-   Für Deutsche Daten sollte `read.csv2` verwendet werden

csv-Dateien aus dem Internet direkt einlesen
--------------------------------------------

    link <- "https://raw.githubusercontent.com/
    mihi-tr/list-of-deaths-dpkg/master/data/
    listofdeath.csv"
    lod <- read.csv(link)

Show the data
-------------

<table>
<thead>
<tr class="header">
<th align="left">date</th>
<th align="right">count</th>
<th align="left">name</th>
<th align="left">origin</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">25/10/12</td>
<td align="right">54</td>
<td align="left">N.N.</td>
<td align="left">unknown</td>
</tr>
<tr class="even">
<td align="left">23/10/12</td>
<td align="right">1</td>
<td align="left">N.N. (Â±25, man)</td>
<td align="left">Sub-Saharan Africa</td>
</tr>
<tr class="odd">
<td align="left">09/10/12</td>
<td align="right">1</td>
<td align="left">N.N. (Â±5, girl)</td>
<td align="left">Sub-Saharan Africa</td>
</tr>
<tr class="even">
<td align="left">09/10/12</td>
<td align="right">1</td>
<td align="left">N.N. (Â±5, girl)</td>
<td align="left">Sub-Saharan Africa</td>
</tr>
<tr class="odd">
<td align="left">08/10/12</td>
<td align="right">6</td>
<td align="left">N.N.</td>
<td align="left">Africa</td>
</tr>
<tr class="even">
<td align="left">08/10/12</td>
<td align="right">10</td>
<td align="left">N.N.</td>
<td align="left">Africa</td>
</tr>
</tbody>
</table>

    colnames(lod)

    ##  [1] "date"           "count"          "name"           "origin"        
    ##  [5] "cause.of.death" "source"         "Column.7"       "Column.8"      
    ##  [9] "Column.9"       "Column.10"      "Column.11"      "Column.12"

Import Excel-files
------------------

Unesco world heritage sites: [Link
datahub.io](http://datahub.io/dataset/unesco-world-heritage-sites/resource/d4116195-44d8-4bc1-9f91-9b570870dc19)

-   You have to provide a sheet index as second argument
-   For German data use read.xlsx2 because of the comma separation

<!-- -->

    library(xlsx)
    whc <- read.xlsx("whc-sites-2015.xls",1)

Overview of World Heritage Dataset
----------------------------------

    table(whc$category)

    colnames(whc)

Create a barplot
----------------

    barplot(table(whc$category))

Import sav-files
----------------

    library(foreign)
    mz10 <- read.spss("mz2010_cf.sav",to.data.frame=T)

Command read.spss
-----------------

![pic](figure/ReadSPSS.PNG)

Read stata-files
----------------

-   Datset about students (2000) from
    [Forschungsdatenzentrum](http://www.forschungsdatenzentrum.de/bestand/studenten/cf/2000/index.asp)
-   Datset has 206.867 entries

<!-- -->

    studis <- read.dta("studenten_cf_2000.dta")

-   Blog post about reading and writing stata files on
    [is.R](http://is-r.tumblr.com/post/37181850668/readingwriting-stata-dta-files-with-foreign)

Quick R on data import
----------------------

![pic](figure/sminput.jpg)

<http://www.statmethods.net/input/index.html>

Data management a bit similar to SPSS
-------------------------------------

    install.packages("Rz")
    library(Rz)
