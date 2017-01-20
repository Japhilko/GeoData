## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,cache=T)

## ----echo=F--------------------------------------------------------------
library("knitr")

## ------------------------------------------------------------------------
library("XML")

## ----echo=F--------------------------------------------------------------
names <- c("Function","Description","xmlName()","name of the node","xmlSize()","number of subnodes","xmlAttrs()","named character vector of all attributes","xmlGetAttr()","value of a single attribute","xmlValue()","contents of a leaf node","xmlParent()","name of parent node","xmlAncestors()","name of ancestor nodes","getSibling()","siblings to the right or to the left","xmlNamespace()","the namespace (if there’s one)")
tab <- data.frame(t(array(names,dim=c(2,length(names)/2))))
colnames(tab) <- tab[1,]
tab <- tab[-1,]
kable(tab)

## ----echo=F--------------------------------------------------------------
url <- "http://api.openstreetmap.org/api/0.6/relation/62422"

## ----eval=F--------------------------------------------------------------
## url <- "http://api.openstreetmap.org/api/0.6/
## relation/62422"

## ------------------------------------------------------------------------
BE <- xmlParse(url)

## ------------------------------------------------------------------------
xmltop = xmlRoot(BE)
class(xmltop)
xmlSize(xmltop)
xmlSize(xmltop[[1]])

## ------------------------------------------------------------------------
xpathApply(BE,"//tag[@k = 'source:population']")

## ------------------------------------------------------------------------
citation("XML")

