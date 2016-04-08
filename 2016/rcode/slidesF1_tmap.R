# Nutzung von GeoDaten in den Sozialwissenschaften
# Slides F1 - tmap
# Jan-Philipp Kolb
# Fri Apr 08 07:50:07 2016

## ----warning=F,message=F-------------------------------------------------
# install.packages("tmap")
library(tmap)

## ----cache=T-------------------------------------------------------------
data(Europe)
qtm(Europe)

## ----echo=F--------------------------------------------------------------
EUR <- Europe@data

## ----echo=F--------------------------------------------------------------
Europe@data[,1:4]

## ----cache=T,eval=Ex-----------------------------------------------------
qtm(Europe, fill="gdp_cap_est")

## ----eval=Ex-------------------------------------------------------------
qtm(Europe, fill="gdp_cap_est", text="iso_a3")

## ----eval=Ex-------------------------------------------------------------
qtm(Europe, fill="gdp_cap_est", text="iso_a3", 
    text.size="AREA", root=5, fill.title="GDP per capita", 
    fill.textNA="Non-European countries", theme="Europe")

## ----cache=T,eval=Ex-----------------------------------------------------
qtm(Europe, fill="pop_est_dens", fill.title="Population density")

## ----echo=F,eval=Ex------------------------------------------------------
library(XML)
info <- colnames(Europe@data)

info_df <- data.frame(Europe@data)
info_df[1:8,1:6]

## ----echo=F,cache=T,eval=Ex----------------------------------------------
link <- "http://userpage.chemie.fu-berlin.de/diverse/doc/ISO_3166.html"
Tab <- readHTMLList(link)

Tab <- strsplit(x = Tab[[1]],split = "\n")

Tab3 <- Tab[[3]] 

Tab4 <- Tab3[-c(1:7)]
Tab4

## ----cache=T-------------------------------------------------------------
qtm(Europe, fill="continent")

## ----cache=T-------------------------------------------------------------
qtm(Europe, fill="part",fill.title="part of Europe")

## ----cache=T-------------------------------------------------------------
qtm(Europe, fill="area") # Russia is huge

## ----cache=T-------------------------------------------------------------
qtm(Europe, fill="pop_est",fill.title="Population") 

## ----cache=T-------------------------------------------------------------
qtm(Europe, fill="pop_est_dens",
    fill.title="Population density") 

## ----cache=T-------------------------------------------------------------
qtm(Europe, fill="economy") 

## ----cache=T-------------------------------------------------------------
qtm(Europe, fill="income_grp",fill.title="Income group") 

## ----echo=F,eval=F-------------------------------------------------------
data(World)
datatable(World@data)

## ----echo=F,eval=T-------------------------------------------------------
data(World)
World@data[1:15,]

## ----cache=T-------------------------------------------------------------
qtm(World, fill="income_grp",fill.title="Income group") 

## ----echo=F,eval=F-------------------------------------------------------
data(NLD_prov)
NLD_df <- NLD_prov@data
NLD_df[,6] <- round(NLD_df[,6])
 
## ----echo=F,eval=T-------------------------------------------------------
data(NLD_prov)
NLD_df <- NLD_prov@data

head(NLD_df)
        

## ----cache=T-------------------------------------------------------------
qtm(NLD_prov, fill="population",fill.title="population") 

## ----cache=T-------------------------------------------------------------
pop <- NLD_prov@data$population
pop

## ----cache=T-------------------------------------------------------------
popmen <- NLD_prov@data$pop_men
popmen

## ----cache=T-------------------------------------------------------------
prop <- popmen/pop
prop

## ----cache=T-------------------------------------------------------------
barplot(prop)

## ----warnings=F,cache=T--------------------------------------------------
barplot(prop,col="blue")

## ----cache=T-------------------------------------------------------------
NLD_prov@data$proportion <- prop

## ----cache=T-------------------------------------------------------------
qtm(NLD_prov, fill="proportion",fill.title="proportion") 

## ----cache=T-------------------------------------------------------------
ant <- runif(length(NLD_prov),.18,.28)
NLD_prov@data$pop_65plus <- round(NLD_prov@data$population*ant)
pop65plus <- NLD_prov@data$pop_65plus
prop65plus <- pop65plus/pop
NLD_prov@data$proportion65plus <- prop65plus

## ----cache=T-------------------------------------------------------------
qtm(NLD_prov, fill="proportion",fill.title="proportion") 

## ----cache=T-------------------------------------------------------------
data(NLD_muni)

## ----echo=F,eval=T-------------------------------------------------------
NLD_df <- NLD_muni@data
NLD_df[,6] <- round(NLD_df[,6])

NLD_df[,c("name","province","population")]

## ----cache=T-------------------------------------------------------------
qtm(NLD_muni, fill="population") 

## ----eval=F--------------------------------------------------------------
tm_shape(Europe) +
     tm_fill(c("pop_est_dens", "gdp_cap_est"),
         title=c("Population density", "GDP per capita"))
  tm_layout_Europe()

## ----eval=T,echo=F-------------------------------------------------------
tm_shape(Europe) +
    tm_fill(c("pop_est_dens", "gdp_cap_est"), 
        title=c("Population density", "GDP per capita"))


## ----echo=F,eval=F-------------------------------------------------------
data(land)
info_df <- land@data[1:100,]
datatable(info_df)

## ----echo=F,eval=T-------------------------------------------------------
data(land)
info_df <- land@data[1:15,]
info_df

## ------------------------------------------------------------------------
data(land)
data(World)
tm_shape(land,  relative=FALSE) +
    tm_raster("cover_cls", title="Global Land Cover")

## ----eval=F,echo=F-------------------------------------------------------
data(metro)
 
info_df <- metro@data[1:100,]


## ----eval=T,echo=F-------------------------------------------------------
data(metro)

info_df <- metro@data[1:100,]
kable(info_df)

## ------------------------------------------------------------------------
tm_shape(Europe[Europe$name=="Austria", ]) +
    tm_polygons()

## ------------------------------------------------------------------------
url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/Unemployment07a13.csv"

Unemp <- read.csv(url) 

## ----warning=F,echo=F----------------------------------------------------
kable(Unemp[1:8,c(2,3,4)])

## ----warning=F-----------------------------------------------------------
library("tmap")
data(Europe)

## ------------------------------------------------------------------------
iso_a2<- substr(Europe@data$iso_a3,1,2)
ind <- match(iso_a2,Unemp$GEO)
Europe@data$Val2007M12 <- Unemp$Val2007M12[ind]
Europe@data$Val2013M01 <- Unemp$Val2013M01[ind]

## ------------------------------------------------------------------------
qtm(Europe,c("Val2007M12","Val2013M01"))


## ----cache=T-------------------------------------------------------------
tm_shape(Europe[Europe$continent=="Europe",]) +
    tm_fill("part", thres.poly = 0) +
    tm_facets("name", free.coords=TRUE, drop.shapes=TRUE) +
tm_layout(legend.show = FALSE, title.position = c("center", "center"), 
          title.size = 2)

## ------------------------------------------------------------------------
citation("tmap")

