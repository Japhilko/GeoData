# Zufallszahlen
Jan-Philipp Kolb  
08 April 2016  




## Erzeugung von ganzzahligen Zufallszahlen


```r
Asample <- sample(1:5,1000,replace=T)
head(Asample)
```

```
## [1] 3 4 1 5 2 5
```

```r
table(Asample)
```

```
## Asample
##   1   2   3   4   5 
## 203 206 217 182 192
```

## Gleichverteilte Zufallszahlen


```r
A <- runif(100)
head(A)
hist(A)
```

## Gleichverteilte Zufallszahlen in einem Rahmen


```r
A2 <- runif(100,100,200)
head(A2)
hist(A2)
```

## Normalverteilte Zufallszahlen


```r
Bnrom <- rnorm(1000)
hist(Bnrom,col="royalblue")
```

![](Zufallszahlen_files/figure-slidy/unnamed-chunk-4-1.png)<!-- -->

## Normalverteilte Zufallszahlen


```r
?rnorm
```



```r
Bnrom2 <- rnorm(1000,mean=-100,sd=20)
hist(Bnrom2,col="red")
```

![](Zufallszahlen_files/figure-slidy/unnamed-chunk-6-1.png)<!-- -->

## Das Runden

Zahlen runden:


```r
(A <- rnorm(10))
```

```
##  [1]  0.594899919  0.785367020 -0.041297187 -0.551802750  1.841647547
##  [6]  0.328521279 -0.725163522  1.289282010  0.003590732  2.368750115
```


```r
round(A)
```

```
##  [1]  1  1  0 -1  2  0 -1  1  0  2
```


```r
round(A,digits=2)
```

```
##  [1]  0.59  0.79 -0.04 -0.55  1.84  0.33 -0.73  1.29  0.00  2.37
```

## R als Taschenrechner


```r
2/4
```

```
## [1] 0.5
```


```r
2*4
```

```
## [1] 8
```


```r
sqrt(5)
```

```
## [1] 2.236068
```

## Ein Kreisdiagramm


```r
Students <- c(100, 200,30)
pie(Students)
```

![](Zufallszahlen_files/figure-slidy/unnamed-chunk-13-1.png)<!-- -->

## Graphiken speichern


```r
pdf("pie_Students.pdf")
pie(Students)
dev.off()
```

```
## png 
##   2
```
