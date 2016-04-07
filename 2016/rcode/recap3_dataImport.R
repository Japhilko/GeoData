# Nutzung von GeoDaten in den Sozialwissenschaften
# Recap 3 - Daten importieren
# Jan-Philipp Kolb
# Thu Apr 07 07:55:06 2016

## ----eval=Ex-------------------------------------------------------------
link <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/data/TrustData.csv"

## ----eval=Ex-------------------------------------------------------------
trust_data <- read.csv2(link)

## ----eval=Ex-------------------------------------------------------------
head(trust_data)

## ----eval=Ex-------------------------------------------------------------
colnames(trust_data)

## ----warning=F-----------------------------------------------------------
library("readxl")

## ----eval=F--------------------------------------------------------------
# ab <- read_excel("dataset.xlsx",sheet=1)

## ------------------------------------------------------------------------
url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/whcSites.csv"

whc <- read.csv(url) 

## ----eval=Ex-------------------------------------------------------------
table(whc$category)

## ----eval=Ex-------------------------------------------------------------
colnames(whc)

## ----eval=Ex-------------------------------------------------------------
barplot(table(whc$category))

# hier muss der eigene Pfad angegeben werden Beispiel:
# setwd("C:/")

load("mz10_small.Rdata")

## ----eval=F--------------------------------------------------------------
library(foreign)
mz10 <- read.spss("mz2010_cf.sav",
                  to.data.frame=T)

## ----eval=F--------------------------------------------------------------
?read.spss

## ----message=F,warning=F,eval=F------------------------------------------
studis <- read.dta("studenten_cf_2000.dta")

## ----eval=F--------------------------------------------------------------
x <- runif(1000)
save(x, file="WasAuchImmer.RData")

## ----eval=F--------------------------------------------------------------
# install.packages("Rz")
library(Rz)

