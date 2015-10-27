# Spatial Visualisations
# Jan-Philipp Kolb
# Tue Oct 27 13:10:02 2015


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

## ----cache=T-------------------------------------------------------------
qtm(Europe, fill="gdp_cap_est")

## ------------------------------------------------------------------------
qtm(Europe, fill="gdp_cap_est", text="iso_a3")

## ------------------------------------------------------------------------
qtm(Europe, fill="gdp_cap_est", text="iso_a3", 
    text.size="AREA", root=5, fill.title="GDP per capita", 
    fill.textNA="Non-European countries", theme="Europe")

## ----cache=T-------------------------------------------------------------
qtm(Europe, fill="pop_est_dens", fill.title="Population density")

## ----echo=F,cache=T------------------------------------------------------
library(XML)
info <- colnames(Europe@data)
info2 <- c("ISO","Country name","Sovereignt","continent","part of Europe","Area","Population","Population density","Gross domestic product", "GDP per capita","Economy","Income group")

info_df <- data.frame(names=info,topics=info2)
kable(info_df)

## ----echo=F,cache=T------------------------------------------------------
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

## ----echo=F,eval=T-------------------------------------------------------
data(World)
World@data[1:15,]

## ----cache=T-------------------------------------------------------------
qtm(World, fill="income_grp",fill.title="Income group") 

## ----echo=F,eval=T-------------------------------------------------------
data(NLD_prov)
NLD_df <- NLD_prov@data
NLD_df[,6] <- round(NLD_df[,6])

NLD_df[,c("name","name.data","province")]
        

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

## ----eval=T,echo=F-------------------------------------------------------
tm_shape(Europe) +
    tm_fill(c("pop_est_dens", "gdp_cap_est"), 
        title=c("Population density", "GDP per capita"))

## ----echo=F,eval=T-------------------------------------------------------
data(land)
info_df <- land@data[1:15,]
info_df

## ------------------------------------------------------------------------
data(land)
data(World)
tm_shape(land,  relative=FALSE) +
    tm_raster("cover_cls", title="Global Land Cover")


## ----eval=T,echo=F-------------------------------------------------------
data(metro)

info_df <- metro@data[1:100,]
info_df

## ------------------------------------------------------------------------
tm_shape(Europe[Europe$name=="Austria", ]) +
    tm_polygons()

## ------------------------------------------------------------------------
data(land)
data(World)
pal8 <- c("#33A02C", "#B2DF8A", "#FDBF6F", "#1F78B4", "#999999", "#E31A1C", "#E6E6E6", "#A6CEE3")
tm_shape(land, ylim = c(-88,88), relative=FALSE) +
    tm_raster("cover_cls", palette = pal8, title="Global Land Cover", legend.hist=TRUE, legend.hist.z=0) +
tm_shape(World) +
    tm_borders() +
tm_layout_World(inner.margins=0, 
    legend.text.size=1,
    legend.title.size=1.2,
    legend.position = c("left","bottom"), 
    legend.bg.color = "white", legend.bg.alpha=.2, 
    legend.frame="gray50", 
    legend.width=.2, legend.height=.6, 
    legend.hist.height=.2, 
    legend.hist.bg.color="gray60", legend.hist.bg.alpha=.5)

## ----cache=T-------------------------------------------------------------
tm_shape(Europe[Europe$continent=="Europe",]) +
    tm_fill("part", thres.poly = 0) +
    tm_facets("name", free.coords=TRUE, drop.shapes=TRUE) +
tm_layout(legend.show = FALSE, title.position = c("center", "center"), 
          title.size = 2)

