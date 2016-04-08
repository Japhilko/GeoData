# Nutzung von GeoDaten in den Sozialwissenschaften
# Slides D4 - Datenaufbereitung
# Jan-Philipp Kolb
# Fri Apr 08 07:50:07 2016

## Eigener Pfad z.B.
## setwd("D:/Eigene Dateien/")

## ----eval=Ex1------------------------------------------------------------
load("data/refugeeTab.RData")

## ----eval=Ex1------------------------------------------------------------
mean(refugeeTab[,2])

## ----eval=Ex1------------------------------------------------------------
refugeeTab[,2] <- as.numeric(refugeeTab[,2])

## ----eval=Ex1------------------------------------------------------------
mean(refugeeTab[,2])

## ----eval=Ex1------------------------------------------------------------
refugeeTab[,3] <- gsub(",",".",refugeeTab[,3])
refugeeTab[,3] <- as.numeric(refugeeTab[,3])

## ----eval=Ex1------------------------------------------------------------
ab <- as.character(refugeeTab[,1])
info <- round(nchar(ab)/2)
Namen <- substr(ab,1,info)
Namen[1:29] <- gsub(" ","",Namen[1:29])
Namen[31]  <- "Zypern"
refugeeTab[,1] <- Namen

## ----eval=Ex1------------------------------------------------------------
colnames(refugeeTab) <- c("Land","2015",
                          "pro_tsd_Einwohner")


## Eigener Pfad z.B.
## setwd("D:/Eigene Dateien/")

## ----eval=F--------------------------------------------------------------
save(refugeeTab,file="refugeeTab_final.RData")

## ----echo=F,eval=Ex1,warning=F-------------------------------------------
head(refugeeTab)

## ----eval=Ex4,echo=F-----------------------------------------------------
link <- "https://en.wikipedia.org/wiki/List_of_countries_by_carbon_dioxide_emissions_per_capita"

## ----cache=T,eval=Ex4----------------------------------------------------
link_data <- read_html(link)
doc <- htmlParse(link_data)
tab <- readHTMLTable(doc)

## ----eval=F,echO=F-------------------------------------------------------
save(tab,file="co2tab.RData")

## ----echo=F--------------------------------------------------------------
load("data/co2tab.RData")

## ------------------------------------------------------------------------
str(tab)

## ------------------------------------------------------------------------
tab[[1]]

## ------------------------------------------------------------------------
head(tab[[2]][,1:7])

## ------------------------------------------------------------------------
co2<- tab[[2]]
Cnames <- c("Rank","Country",paste("j",1990:2011,sep=""))
colnames(co2) <- Cnames 

## ----warning=F-----------------------------------------------------------
mean(co2[,3])

## ----warning=F-----------------------------------------------------------
co2[,3] <- as.numeric(as.character(co2[,3]))

## ----warning=F-----------------------------------------------------------
for (i in 3:ncol(co2)){
  co2[,i] <- as.numeric(as.character(co2[,i]))
}

## Eigener Pfad z.B.
## setwd("D:/Eigene Dateien/")

## ----eval=F--------------------------------------------------------------
save(co2,file="CO2emissions.RData")

## ----warning=F-----------------------------------------------------------
library(lattice)
emissions <- as.numeric(co2[,3])
names(emissions) <- co2[,2]
barchart(emissions[1:10],col="royalblue")

