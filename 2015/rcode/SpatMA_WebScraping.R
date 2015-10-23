# Spatial Visualisations
# Webscraping
# Jan-Philipp Kolb
# Tue Oct 13 08:30:11 2015


data.path <- "J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/data/NurseryData"
setwd(data.path)

## ------------------------------------------------------------------------
# install.packages("XML")
library(XML)



## ----eval=F--------------------------------------------------------------
l<-"http://www.pflegesuche.de/bundesland_pflegeheime.html"
ab <- readHTMLList(l)

## ----eval=F--------------------------------------------------------------
tab <- ab[[6]]
tab1 <- gsub("\t","",tab)
tab2 <- strsplit(tab1,"\n")
dat <- unlist(lapply(tab2,function(x)x[1]))
bla <- unlist(lapply(tab2,function(x)x[2]))
df_pflege <- data.frame(bla,
           Anz=as.numeric(as.character(dat)))

## ----echo=F--------------------------------------------------------------
head(df_pflege)

## ----warning=F,message=F,cache=T-----------------------------------------
library(raster)
DEU1 <- getData('GADM', country='DEU', level=1)
plot(DEU1)

## ------------------------------------------------------------------------
ind <- match(DEU1@data$NAME_1,df_pflege$bla)
ind

## ------------------------------------------------------------------------
DEU1@data$NAME_1[is.na(ind)]
which(is.na(ind))

## ------------------------------------------------------------------------
ind[1] <- agrep("rttemberg",df_pflege$bla)
ind[8] <- agrep("pommern",df_pflege$bla)
ind[13] <- agrep("Anhalt",df_pflege$bla)
ind[15] <- agrep("Holstein",df_pflege$bla)
ind[16] <- agrep("ringen",df_pflege$bla)

## ------------------------------------------------------------------------
DEU1@data$nursingHomes <- df_pflege$Anz[ind]
library(sp)
spplot(DEU1,"nursingHomes")

#----------------------------------------------#

maketable <- function(tab){
  tab1 <- gsub("\t","",tab)
  tab2 <- strsplit(tab1,"\n")
  dat <- unlist(lapply(tab2,function(x)x[1]))
  bla <- unlist(lapply(tab2,function(x)x[2]))
  df_pflege <- data.frame(place=bla,
                          Anz=as.numeric(as.character(dat)))
}


l<-"http://www.pflegesuche.de/bundesland_pflegeheime_BB.html"
ab <- readHTMLList(l)
df_pflege <- maketable(ab[[7]])
save(df_pflege,file="BB_df_pflege.RData")

l <- "http://www.pflegesuche.de/bundesland_pflegeheime_HE.html"
ab <- readHTMLList(l)
df_pflege <- maketable(ab[[7]])
save(df_pflege,file="HE_df_pflege.RData")

#----------------------------------------------#
# nr of people who need care per federal state
#----------------------------------------------#

l2 <- "https://www.gbe-bund.de/oowa921-install/servlet/oowa/aw92/dboowasys921.xwdevkit/xwd_init?gbe.isgbetol/xs_start_neu/&p_aid=3&p_aid=62857843&nummer=834&p_sprache=D&p_indsp=141&p_aid=27002330"

#----------------------------------------------#
# links
#----------------------------------------------#


# http://www.r-bloggers.com/htmltotext-extracting-text-from-html-via-xpath/