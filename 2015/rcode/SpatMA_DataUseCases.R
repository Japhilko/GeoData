# Spatial Visualisations
# Jan-Philipp Kolb
# Wed Oct 21 13:33:42 2015


## ----echo=F--------------------------------------------------------------
Toppics <- c("London Soccer","World Heritage Sites","Nursery Data","Backpacker","Economic Crisis","Camping","Refugee Routes","Rivers")
DataSet <- c("Lfb_df.csv","whcSites.csv","df_pflege.csv","Hostels_Madrid.csv","Unemployment.csv","CampSites_Bayern.csv","","")

topics_df <- data.frame(Toppics,DataSet)


## ----soccer data,cache=T-------------------------------------------------
url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/Lfb_df.csv"

Lfb_df <- read.csv(url) 

## ----echo=F--------------------------------------------------------------
Lfb_df[1:8,1:4]

## ----whcSites,cache=T----------------------------------------------------
url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/whcSites.csv"

whcSites <- read.csv(url) 

## ----echo=F--------------------------------------------------------------
whcSites[1:8,1:5]

## ------------------------------------------------------------------------
url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/df_pflege.csv"

nursery <- read.csv(url) 

## ----echo=F--------------------------------------------------------------
nursery[1:8,1:5]

## ------------------------------------------------------------------------
url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/Hostels_Madrid.csv"

Hostels <- read.csv(url) 

## ----echo=F--------------------------------------------------------------
Hostels[1:8,1:4]

## ------------------------------------------------------------------------
url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/Unemployment.csv"

Hostels <- read.csv(url) 

## ----echo=F--------------------------------------------------------------
Hostels[1:8,1:4]

## ------------------------------------------------------------------------
url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/CampSites_Bayern.csv"

CampSites <- read.csv(url) 

## ----echo=F--------------------------------------------------------------
CampSites[1:8,1:4]

