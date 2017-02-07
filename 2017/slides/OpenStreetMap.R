## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,cache=T,eval=T,warning=F)

## ----echo=F--------------------------------------------------------------
library("knitr")

## ------------------------------------------------------------------------
library("XML")

## ----echo=F,eval=T-------------------------------------------------------
names <- c("xmlName()","name of the node","xmlSize()","number of subnodes","xmlAttrs()","named character vector of all attributes","xmlGetAttr()","value of a single attribute","xmlValue()","contents of a leaf node","xmlParent()","name of parent node","xmlAncestors()","name of ancestor nodes","getSibling()","siblings to the right or to the left","xmlNamespace()","the namespace (if there’s one)")
tab <- data.frame(t(array(names,dim=c(2,length(names)/2))))
colnames(tab) <- c("Function","Description")
kable(tab)

## ----echo=F--------------------------------------------------------------
url <- "http://api.openstreetmap.org/api/0.6/relation/62422"

## ------------------------------------------------------------------------
# library(xml2)
# BE <- read_xml.raw(url)
BE <- xmlParse(url)

## ------------------------------------------------------------------------
xmltop = xmlRoot(BE)
class(xmltop)
xmlSize(xmltop)
xmlSize(xmltop[[1]])

## ------------------------------------------------------------------------
xpathApply(BE,"//tag[@k = 'population']")

## ------------------------------------------------------------------------
xpathApply(BE,"//tag[@k = 'source:population']")

## ------------------------------------------------------------------------
xpathApply(BE,"//tag[@k = 'name:ta']")

## ------------------------------------------------------------------------
region <- xpathApply(BE,"//tag[@k = 'geographical_region']")
# regular expressions
region[[1]]

## ------------------------------------------------------------------------
url2 <- "http://api.openstreetmap.org/api/0.6/node/25113879"
obj2 <- xmlParse(url2)
obj_amenity <- xpathApply(obj2,"//tag[@k = 'amenity']")[[1]]
obj_amenity

## ------------------------------------------------------------------------
xpathApply(obj2,"//tag[@k = 'wikipedia']")[[1]]

## ----eval=F--------------------------------------------------------------
## xpathApply(obj2,"//tag[@k = 'wheelchair']")[[1]]

## ----eval=F--------------------------------------------------------------
## xpathApply(obj2,"//tag[@k = 'name']")[[1]]

## ------------------------------------------------------------------------
url3 <- "http://api.openstreetmap.org/api/0.6/node/303550876"
obj3 <- xmlParse(url3)
xpathApply(obj3,"//tag[@k = 'opening_hours']")[[1]]

## ------------------------------------------------------------------------
url4 <- "http://api.openstreetmap.org/api/0.6/node/25439439"
obj4 <- xmlParse(url4)
xpathApply(obj4,"//tag[@k = 'railway:station_category']")[[1]]

## ------------------------------------------------------------------------
library(rvest)
bhfkat <- read_html("https://de.wikipedia.org/wiki/Bahnhofskategorie")
df_html_bhfkat <- html_table(html_nodes(bhfkat, "table")[[1]], 
                             fill = TRUE)

## ----echo=F--------------------------------------------------------------
library(knitr)
kable(df_html_bhfkat)

## ------------------------------------------------------------------------
url5 <- "http://api.openstreetmap.org/api/0.6/way/162149882"
obj5 <- xmlParse(url5)
xpathApply(obj5,"//tag[@k = 'name']")[[1]]

## ------------------------------------------------------------------------
xpathApply(obj5,"//tag[@k = 'website']")[[1]]

## ------------------------------------------------------------------------
xpathApply(obj5,"//tag[@k = 'iata']")[[1]]

## ------------------------------------------------------------------------
citation("XML")

## ------------------------------------------------------------------------
citation("xml2")

