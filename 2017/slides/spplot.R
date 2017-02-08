## ----echo=F,warning=F----------------------------------------------------
library(knitr)
ca <- T

## ----warning=F,message=F-------------------------------------------------
library(maps)
data(unemp)
data(county.fips)

## ----eval=F--------------------------------------------------------------
## install.packages("colorRamps")

## ----warning=F-----------------------------------------------------------
library(colorRamps)
colors <- blue2red(6)
barplot(1:6,col=colors)

## ------------------------------------------------------------------------
unemp$colorSteps <- cut(unemp$unemp, 
          c(0, 2, 4, 6, 8,10, 100))
colorsmatch <- unemp$colorSteps[match(county.fips$fips, 
          unemp$fips)]

## ------------------------------------------------------------------------
map("county", col = colors[colorsmatch], 
    fill = TRUE)

## ----message=F,cache=ca,warning=F----------------------------------------
library(sp)

## ----message=F,cache=ca,warning=F----------------------------------------
library(maptools)
data("wrld_simpl")
ISO2codes <- wrld_simpl@data$ISO2
countries <- c("FR","DE","AT","CH")
ind <- match(countries,ISO2codes)
my_map <- wrld_simpl[ind,]

## ----message=F-----------------------------------------------------------
library(maptools)
plot(my_map)

## ----eval=F,cache=ca,warning=F-------------------------------------------
## head(my_map@data)

## ----echo=F,cache=ca,warning=F-------------------------------------------
library(knitr)
kable(my_map@data[1:4,c("ISO2","NAME","AREA","POP2005","REGION")])

## ----cache=ca,warning=F--------------------------------------------------
spplot(my_map,"POP2005")

## ----message=F,cache=ca,warning=F----------------------------------------
library(colorRamps)
spplot(my_map,"POP2005",col.regions=blue2red(100))

## ----cache=ca,warning=F--------------------------------------------------
spplot(my_map,"POP2005",col.regions=blue2green(100))

## ----cache=ca,warning=F--------------------------------------------------
spplot(my_map,"POP2005",col.regions=green2red(100))

## ----cache=ca,warning=F--------------------------------------------------
spplot(my_map,"POP2005",col.regions=blue2yellow(100))

## ----cache=ca,warning=F--------------------------------------------------
spplot(my_map,"POP2005",col.regions=matlab.like(100))

## ----cache=ca,warning=F--------------------------------------------------
my_map$Pop2010 <- my_map$POP2005 + 
                    runif(length(my_map),-10000,10000)

## ----cache=ca,warning=F--------------------------------------------------
spplot(my_map,c("POP2005","Pop2010"),
       col.regions=matlab.like(100))

