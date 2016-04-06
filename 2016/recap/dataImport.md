# Nutzung von GeoDaten in den Sozialwissenschaften - Daten Import
Jan-Philipp Kolb  
07 April  




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



```r
ab <- read_excel("dataset.xlsx",sheet=1)
```

- Blatt Index als zweites Argument nötig


## Übersicht zum Weltkulturerbe Datensatz


```r
table(whc$category)
```


```r
colnames(whc)
```


## Ein Balkendiagramm erzeugen


```r
barplot(table(whc$category))
```


## Import .sav-Daten




```r
library(foreign)
mz10 <- read.spss("mz2010_cf.sav",to.data.frame=T)
```

## Der Befehl read.spss


```r
?read.spss
```

```
## No documentation for 'read.spss' in specified packages and libraries:
## you could try '??read.spss'
```


## stata-Dateien lesen

- Datensatz über Studierende (2000) vom [Forschungsdatenzentrum](http://www.forschungsdatenzentrum.de/bestand/studenten/cf/2000/index.asp)
- Datensatz hat 206867 Einträge


```r
studis <- read.dta("studenten_cf_2000.dta")
```

- Blog post zum lesen und schreiben von stata Dateien auf [is.R](http://is-r.tumblr.com/post/37181850668/readingwriting-stata-dta-files-with-foreign)

## Quick R zum Datenimport

<http://www.statmethods.net/input/index.html>

## Datenexport


```r
x <- runif(1000)
save(x, file="WasAuchImmer.RData")
```



## Datenmanagement ein wenig wie bei SPSS


```r
install.packages("Rz")
library(Rz)
```


