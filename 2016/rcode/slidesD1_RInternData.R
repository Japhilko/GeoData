# Nutzung von GeoDaten in den Sozialwissenschaften
# Slides D1 - R interne Daten
# Jan-Philipp Kolb
# Thu Apr 07 07:55:06 2016

## ----eval=Ex-------------------------------------------------------------
library(datasets)

## ----eval=Ex-------------------------------------------------------------
head(quakes)

## ----echo=F,eval=F-------------------------------------------------------
head(quakes)

## ----eval=Ex-------------------------------------------------------------
library("FAOSTAT")

## ----eval=F--------------------------------------------------------------
FAOsearch()
test <- getFAO(query = .LastSearch)

## ----eval=F--------------------------------------------------------------
colnames(test)[3] <- "Annual Population"
head(test)

## ----eval=Ex-------------------------------------------------------------
library(survey)
data(nhanes)

## ----eval=F,echo=F-------------------------------------------------------
head(nhanes[,1:6])

## ----message=F,eval=Ex---------------------------------------------------
library(UScensus2010)

## ----message=F,eval=Ex---------------------------------------------------
library(WDI)

## ----eval=F,eval=Ex------------------------------------------------------
WDIsearch('gdp')[1:10,]

## ----echo=F,eval=Ex------------------------------------------------------
WDIsearch('gdp')[1:10,]

## ----cache=ca,eval=Ex----------------------------------------------------
dat <-  WDI(indicator='NY.GDP.PCAP.KD',
            country=c('MX','CA','US'), 
            start=1960, end=2012)
head(dat)

## ----echo=F,cache=ca,eval=Ex---------------------------------------------
library(ggplot2)
ggplot(dat, aes(year, NY.GDP.PCAP.KD, color=country)) + geom_line() + 
    xlab('Year') + ylab('GDP per capita')

## ----cache=ca,warning=F,message=F,eval=T---------------------------------
library(mapdata)
data(worldHiresMapEnv)
map('worldHires', col=1:10)

## ----cache=ca,warning=F,eval=Ex------------------------------------------
library(HistData)
data(Arbuthnot)

## ----eval=F,cache=ca,warning=F,eval=Ex-----------------------------------
library(GDELTtools)
test.filter <- list(ActionGeo_ADM1Code=c("NI", "US"),
                    ActionGeo_CountryCode="US")
test.results <- GetGDELT(start.date="1979-01-01",
                         end.date="1979-12-31",
                         filter=test.filter)

