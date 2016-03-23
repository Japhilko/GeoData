# Daten Import
Jan-Philipp Kolb  
Wed Oct 14 07:54:24 2015  


```
## Warning: package 'knitr' was built under R version 3.2.4
```


## Import von csv-Dateien

- csv-Dateien aus dem Internet direkt einlesen


```r
link <- "https://raw.githubusercontent.com/Japhilko/GeoData/master/data/TrustData.csv"

trust_data <- read_csv2(link)
```

- Für Deutsche Daten sollte `read_csv2` verwendet werden

## Sich die Daten anzeigen lassen


```r
head(trust_data)
```





```r
colnames(trust_data)
```


## Import Excel-files


```r
library("readxl")
```

```
## Warning: package 'readxl' was built under R version 3.2.4
```



```r
ab <- read_excel("dataset.xlsx",sheet=1)
```

- You have to provide a sheet index as second argument


## Overview of World Heritage Dataset


```r
table(whc$category)
```


```r
colnames(whc)
```


## Create a barplot


```r
barplot(table(whc$category))
```


## Import sav-files




```r
library(foreign)
mz10 <- read.spss("mz2010_cf.sav",to.data.frame=T)
```

## Command read.spss


```r
?read.spss
```

```
## No documentation for 'read.spss' in specified packages and libraries:
## you could try '??read.spss'
```


## Read stata-files

- Datensatz über Studierende (2000) vom [Forschungsdatenzentrum](http://www.forschungsdatenzentrum.de/bestand/studenten/cf/2000/index.asp)
- Datset has 206.867 entries


```r
studis <- read.dta("studenten_cf_2000.dta")
```

- Blog post about reading and writing stata files on [is.R](http://is-r.tumblr.com/post/37181850668/readingwriting-stata-dta-files-with-foreign)

## Quick R on data import


http://www.statmethods.net/input/index.html

## Data management a bit similar to SPSS


```r
install.packages("Rz")
library(Rz)
```


