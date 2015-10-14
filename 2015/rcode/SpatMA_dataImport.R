
## ----echo=F--------------------------------------------------------------
data.path <- "J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/Folien/dataImport/data"
setwd(data.path)
lod <- read.csv("listofdeath.csv")

## ----cache=T,eval=F------------------------------------------------------
link <- "https://raw.githubusercontent.com/mihi-tr/list-of-deaths-dpkg/master/data/listofdeath.csv"
lod <- read.csv(link)

## ------------------------------------------------------------------------
colnames(lod)

## ----echo=F,cache=T------------------------------------------------------
load("whc.RData")

## ----eval=F--------------------------------------------------------------
library(xlsx)
whc <- read.xlsx("whc-sites-2015.xls",1)

## ------------------------------------------------------------------------
table(whc$category)

## ------------------------------------------------------------------------
colnames(whc)

## ------------------------------------------------------------------------
barplot(table(whc$category))

## ----eval=F--------------------------------------------------------------
library(foreign)
mz10 <- read.spss("mz2010_cf.sav",to.data.frame=T)

## ----message=F,warning=F,eval=F------------------------------------------
studis <- read.dta("studenten_cf_2000.dta")

## ----eval=F--------------------------------------------------------------
install.packages("Rz")
library(Rz)

