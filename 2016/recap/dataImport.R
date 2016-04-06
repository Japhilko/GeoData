## ----echo=F--------------------------------------------------------------
library(knitr)
Ex <- F

## ----eval=Ex-------------------------------------------------------------
link <- "https://raw.githubusercontent.com/Japhilko/GeoData/master/data/TrustData.csv"

trust_data <- read_csv2(link)

## ----eval=F--------------------------------------------------------------
## head(trust_data)

## ----echo=F,eval=Ex------------------------------------------------------
kable(trust_data[1:6,1:4])

## ----eval=Ex-------------------------------------------------------------
colnames(trust_data)

## ----warning=F-----------------------------------------------------------
library("readxl")

## ----eval=F--------------------------------------------------------------
## ab <- read_excel("dataset.xlsx",sheet=1)

## ----eval=Ex-------------------------------------------------------------
table(whc$category)

## ----eval=Ex-------------------------------------------------------------
colnames(whc)

## ----eval=Ex-------------------------------------------------------------
barplot(table(whc$category))

## ----echo=F,eval=Ex------------------------------------------------------
setwd("J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/Folien/dataImport/data")
load("mz10_small.Rdata")

## ----eval=F--------------------------------------------------------------
## library(foreign)
## mz10 <- read.spss("mz2010_cf.sav",to.data.frame=T)

## ------------------------------------------------------------------------
?read.spss

## ----message=F,warning=F,eval=F------------------------------------------
## studis <- read.dta("studenten_cf_2000.dta")

## ----eval=F--------------------------------------------------------------
## x <- runif(1000)
## save(x, file="WasAuchImmer.RData")

## ----eval=F--------------------------------------------------------------
## install.packages("Rz")
## library(Rz)

