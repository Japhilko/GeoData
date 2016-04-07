# Nutzung von GeoDaten in den Sozialwissenschaften
# Slides D3 - Webscraping
# Jan-Philipp Kolb
# Thu Apr 07 07:55:06 2016


## ------------------------------------------------------------------------
# install.packages("XML")
library(XML)
library("rvest")

## ----eval=Ex1,cache=T----------------------------------------------------
BLA_link <- "http://www.bergziege-owl.de/deutschland-
bundeslander-und-ihre-hauptstadte/"
BLA_tab <- readHTMLTable(BLA_link)

## ----eval=Ex1------------------------------------------------------------
BLA_tab <- BLA_tab[[1]]

## ----echo=F--------------------------------------------------------------
load("data/BLA_tab.RData")

## ----echo=F,eval=T-------------------------------------------------------
head(BLA_tab)

## ------------------------------------------------------------------------
colnames(BLA_tab) <- c("Bundesländer","Hauptstädte")

## ----eval=Ex1------------------------------------------------------------
BLA_tab <- BLA_tab[-1,]

## ----eval=F,message=F----------------------------------------------------
## install.packages("rvest")

## ----eval=Ex2,cache=T----------------------------------------------------
library("rvest")

link <- "https://de.wikipedia.org/wiki/Fl%C3%BCchtlingskrise_in_Europa_ab_2015"

## ----eval=F,echo=F-------------------------------------------------------
link <- "https://de.wikipedia.org/wiki/Fl%C3%BCchtlingskrise_in_Europa_ab_2015"

## ----eval=Ex2------------------------------------------------------------
link_data <- read_html(link)

## ----eval=Ex2------------------------------------------------------------
# parse the document for R representation:
mps.doc <- htmlParse(link_data)

## ----eval=Ex2------------------------------------------------------------
mps.tabs <- readHTMLTable(mps.doc) 

## ----eval=Ex2------------------------------------------------------------
mps.tabs <- mps.tabs[[2]]
refugeeTab <- mps.tabs[-c(1,34),]

## ----cache=T,eval=Ex3----------------------------------------------------
link2 <- "http://www.laenderdaten.de/bevoelkerung/
geburtenrate.aspx"
link_data2 <- read_html(link2)
doc <- htmlParse(link_data2)
tab <- readHTMLTable(doc)
tab1 <- tab[[2]]

## ----cache=T-------------------------------------------------------------
link3 <- "https://en.wikipedia.org/wiki/List_of_sovereign_states_and_dependent_territories_by_fertility_rate"
link_data3 <- read_html(link3)
doc3 <- htmlParse(link_data3)
tab3 <- readHTMLTable(doc3)
tab4 <- tab3[[2]]

## ----eval=F--------------------------------------------------------------
link1 <- "http://openflights.svn.sourceforge.net/viewvc/openflights/openflights/data/airports.dat"
airport <- read.csv(link1, header = F)

link2 <- "http://openflights.svn.sourceforge.net/viewvc/openflights/openflights/data/routes.dat"
route <- read.csv(link2, header = F)

## ------------------------------------------------------------------------
citation("XML")

## ------------------------------------------------------------------------
citation("rvest")

