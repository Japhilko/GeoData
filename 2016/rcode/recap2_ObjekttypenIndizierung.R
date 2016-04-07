# Nutzung von GeoDaten in den Sozialwissenschaften
# R-Recap - Objekttypen und Indizierung
# Jan-Philipp Kolb
# Thu Apr 07 07:55:06 2016


## ----echo=F--------------------------------------------------------------
# Rstudio aktualisieren
# https://www.rstudio.com/products/rstudio/download/

## ----eval=F--------------------------------------------------------------
## install.packages("shinyjs")

## ------------------------------------------------------------------------
a <- c(1,2,3,4)
str(a)

## ------------------------------------------------------------------------
b <- c("red","green","blue")
str(b)

## ------------------------------------------------------------------------
d <- c(1,2,"green")
str(d)

## ------------------------------------------------------------------------
1:4
4:1
seq(1,4,by=.5)
rep(1,5)

## ------------------------------------------------------------------------
barplot(rep(1,5),
        col=c("red",1,"#01B8AA",
              rgb(0,1,0),"purple"))

## ------------------------------------------------------------------------
vector1 <- 1:10
vector1==5

## ------------------------------------------------------------------------
vector1>5
vector1<5

## ------------------------------------------------------------------------
A <- 1:6
B <- rep(1:2,3)
C <- runif(6)

## ------------------------------------------------------------------------
ABC <- data.frame(A,B,C)
ABC

## ------------------------------------------------------------------------
ABC[1,]

## ------------------------------------------------------------------------
ABC[,1]

## ------------------------------------------------------------------------
ABC$A

## ------------------------------------------------------------------------
ABC[-1,]

## ------------------------------------------------------------------------
ABC[ABC$B==2,]

## ----echo=F--------------------------------------------------------------

# R-Intro
# http://cran.r-project.org/doc/manuals/R-intro.html

# Kurs auf Github
# https://github.com/Japhilko/IntroR/tree/master/2016

# Sehr kurze Einführung in R
# https://cran.r-project.org/doc/contrib/Torfs+Brauer-Short-R-Intro.pdf

# Youtube zur Einführung in R
# https://www.youtube.com/watch?v=7cGwYMhPDUY

## ----echo=F--------------------------------------------------------------
# https://cran.r-project.org/doc/contrib/Short-refcard.pdf

##Cheatsheets
# http://www.rstudio.com/wp-content/uploads/2016/01/rstudio-IDE-cheatsheet.pdf

# http://www.rstudio.com/wp-content/uploads/2015/12/ggplot2-cheatsheet-2.0.pdf

## ----eval=F--------------------------------------------------------------
 for (i in 1:4){
   paste(i,"\n")
 }

