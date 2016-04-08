Erzeugung von ganzzahligen Zufallszahlen
----------------------------------------

    Asample <- sample(1:5,1000,replace=T)
    head(Asample)

    ## [1] 5 5 4 2 5 3

    table(Asample)

    ## Asample
    ##   1   2   3   4   5 
    ## 205 200 197 202 196

Gleichverteilte Zufallszahlen
-----------------------------

    A <- runif(100)
    head(A)
    hist(A)

Gleichverteilte Zufallszahlen in einem Rahmen
---------------------------------------------

    A2 <- runif(100,100,200)
    head(A2)
    hist(A2)

Normalverteilte Zufallszahlen
-----------------------------

    Bnrom <- rnorm(1000)
    hist(Bnrom,col="royalblue")

![](Zufallszahlen_files/figure-markdown_strict/unnamed-chunk-4-1.png)<!-- -->

Normalverteilte Zufallszahlen
-----------------------------

    ?rnorm

    Bnrom2 <- rnorm(1000,mean=-100,sd=20)
    hist(Bnrom2,col="red")

![](Zufallszahlen_files/figure-markdown_strict/unnamed-chunk-6-1.png)<!-- -->

Das Runden
----------

Zahlen runden:

    (A <- rnorm(10))

    ##  [1] -0.81632157 -1.24539330  1.38670117 -0.51115873 -0.28718225
    ##  [6] -0.41021274  1.62368087  2.05953921  0.02592153  0.37508675

    round(A)

    ##  [1] -1 -1  1 -1  0  0  2  2  0  0

    round(A,digits=2)

    ##  [1] -0.82 -1.25  1.39 -0.51 -0.29 -0.41  1.62  2.06  0.03  0.38

R als Taschenrechner
--------------------

    2/4

    ## [1] 0.5

    2*4

    ## [1] 8

    sqrt(5)

    ## [1] 2.236068

Ein Kreisdiagramm
-----------------

    Students <- c(100, 200,30)
    pie(Students)

![](Zufallszahlen_files/figure-markdown_strict/unnamed-chunk-13-1.png)<!-- -->

Graphiken speichern
-------------------

    pdf("pie_Students.pdf")
    pie(Students)
    dev.off()

    ## png 
    ##   2
