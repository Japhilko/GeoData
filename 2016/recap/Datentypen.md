Ein `data.frame`
----------------

    ?data.frame

    L3 <- LETTERS[1:3]
    fac <- sample(L3, 10, replace = TRUE)
    d <- data.frame(x = 1, y = 1:10, fac = fac)

<table>
<thead>
<tr class="header">
<th align="right">x</th>
<th align="right">y</th>
<th align="left">fac</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="right">1</td>
<td align="right">1</td>
<td align="left">C</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">2</td>
<td align="left">C</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">3</td>
<td align="left">B</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">4</td>
<td align="left">B</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">5</td>
<td align="left">B</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">6</td>
<td align="left">B</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">7</td>
<td align="left">C</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">8</td>
<td align="left">B</td>
</tr>
<tr class="odd">
<td align="right">1</td>
<td align="right">9</td>
<td align="left">B</td>
</tr>
<tr class="even">
<td align="right">1</td>
<td align="right">10</td>
<td align="left">B</td>
</tr>
</tbody>
</table>

Einen Überblick über die Daten
------------------------------

    head(d)

    ##   x y fac
    ## 1 1 1   C
    ## 2 1 2   C
    ## 3 1 3   B
    ## 4 1 4   B
    ## 5 1 5   B
    ## 6 1 6   B

Datentypen
----------

-   Wenn ein Vektor als `factor` dargestellt wird, gibt es manchmal
    Probleme diesen mit einem anderen Vektor zu matchen.

-   Deshalb muss man den Datentyp verändern.

-   Am Besten ist es `character` zu matchen.

`integer` in `character` umwandeln
----------------------------------

    A <- 1:10
    A

    ##  [1]  1  2  3  4  5  6  7  8  9 10

    str(A)

    ##  int [1:10] 1 2 3 4 5 6 7 8 9 10

    B <- as.character(A)
    B

    ##  [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10"

    str(B)

    ##  chr [1:10] "1" "2" "3" "4" "5" "6" "7" "8" "9" ...

Ein `factor`
------------

    AB <- sample(LETTERS,4)
    AB <- as.factor(AB)
    levels(AB) <- LETTERS
    table(AB)

    ## AB
    ## A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 
    ## 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

Das Matchen
-----------

    ?match

    1:10 %in% c(1,3,5,9)

    ##  [1]  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE

-   Ergebnis ist ein `logical`.
-   Man bekommt die Aussagen wahr und falsch.

<!-- -->

    match(1:10,c(1,3,5,9))

    ##  [1]  1 NA  2 NA  3 NA NA NA  4 NA

-   Als Ergebnis bekommt man die Stelle an der sich die Zahl im zweiten
    Vektor wiederfindet.

Fehlende Werte
--------------

-   Fehlende Werte sind in R mit `NA` definiert.
-   Man bekommt die Information, ob es sich um einen fehlenden Wert
    handelt mit der Funktion `is.na`.

<!-- -->

    A <- 1:10
    is.na(A)

    ##  [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE

    A[5] <- NA
    is.na(A)

    ##  [1] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE

Die Länge eines Vektors
-----------------------

    A <- 1:10
    length(A)

    ## [1] 10

if-Abfrage
----------

-   Nur wenn Bedingung erfüllt ist, wird das Statement in den
    geschweiften Klammern ausgeführt.

<!-- -->

    a <- 5
    if (a>4){
      cat("Dies stimmt")
    }

    ## Dies stimmt

    a <- 3
    if (a>4){
      cat("Dies stimmt")
    }

Schleifen
---------

    A <- 1
    for (i in 1:5){
      A <- A + i
      cat(A,"\n")
    }

    ## 2 
    ## 4 
    ## 7 
    ## 11 
    ## 16

Matchen mit `agrep`
-------------------

    ?agrep

    agrep("lasy", "1 lazy 2")

    ## [1] 1

Die Funktion `which`
--------------------

    A <- 1:10
    A

    ##  [1]  1  2  3  4  5  6  7  8  9 10

    which(A==5)

    ## [1] 5

    which(A>5)

    ## [1]  6  7  8  9 10

Tabellieren
-----------

    A <- sample(1:10,100,replace=T)
    table(A)

    ## A
    ##  1  2  3  4  5  6  7  8  9 10 
    ##  4  9 10 14  8 12 13 13 13  4

Die Funktion cut
----------------

-   Diese Funktion kann verwendet werden um zu kategorisieren

<!-- -->

    ?cut

    Z <- rnorm(10000)
    head(Z)

    ## [1]  1.612124378 -0.326085724  0.736554296  0.008194126 -0.523867191
    ## [6] -0.493458194

    Zc <- cut(Z, breaks = -6:6)
    head(Zc)

    ## [1] (1,2]  (-1,0] (0,1]  (0,1]  (-1,0] (-1,0]
    ## 12 Levels: (-6,-5] (-5,-4] (-4,-3] (-3,-2] (-2,-1] (-1,0] (0,1] ... (5,6]

    table(Zc)

    ## Zc
    ## (-6,-5] (-5,-4] (-4,-3] (-3,-2] (-2,-1]  (-1,0]   (0,1]   (1,2]   (2,3] 
    ##       0       0      18     226    1411    3388    3425    1299     221 
    ##   (3,4]   (4,5]   (5,6] 
    ##      12       0       0

Die Funktion `plot`
-------------------

-   `plot` ist eine generische Funktion
-   d.h. je nachdem welches Objekt man rein steckt kommt ein anderes
    Ergebnis heraus.

<!-- -->

    plot(1:10)

![](Datentypen_files/figure-markdown_strict/unnamed-chunk-25-1.png)<!-- -->

Ein weiterer plot
-----------------

    A <- runif(100)
    B <- runif(100)
    mod1 <- lm(A~B)

    par(mfrow=c(2,2))
    plot(mod1)

![](Datentypen_files/figure-markdown_strict/unnamed-chunk-26-1.png)<!-- -->

Eine Graphik ohne Rand
----------------------

-   Optionen bei der Gestaltung von Basis-Graphiken

<!-- -->

    ?par

    par(mai=c(0,0,0,0))
    plot(hist(runif(1000)))

![](Datentypen_files/figure-markdown_strict/unnamed-chunk-28-1.png)<!-- -->![](Datentypen_files/figure-markdown_strict/unnamed-chunk-28-2.png)<!-- -->

Ein Balkendiagramm
------------------

    A <- sample(1:10,1000,replace=T)
    tabA <- table(A)

    barplot(tabA)

![](Datentypen_files/figure-markdown_strict/unnamed-chunk-29-1.png)<!-- -->

Die Achsenbezeichnung
---------------------

    barplot(tabA,xlab="Die Ausprägungen",
            ylab="Häufigkeiten",
            main="Ein Balkendiagramm")

![](Datentypen_files/figure-markdown_strict/unnamed-chunk-30-1.png)<!-- -->
