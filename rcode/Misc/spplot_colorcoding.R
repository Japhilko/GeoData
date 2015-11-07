# Jan-Philipp kOLB
# Sat Nov 07 13:13:22 2015



library(sp)
library(maptools)

data("wrld_simpl")

EUR <- wrld_simpl[wrld_simpl@data$REGION==150,]

Earea <- EUR@data$AREA

myColorScheme <- rep("blue",length(EUR))

spplot(EUR,"AREA",col.regions=myColorScheme)

myColorScheme[which.max(Earea)] <- "red"

spplot(EUR,"AREA",col.regions=myColorScheme)

#---------------------------------------#
# LatticeExtra
#---------------------------------------#

# http://casoilresource.lawr.ucdavis.edu/software/r-advanced-statistical-package/working-spatial-data/customizing-maps-r-spplot-and-latticeextra-functions/

library(latticeExtra)

Russia <- EUR[EUR@data$NAME=="Russia",]
p1 <- spplot(EUR, 'AREA')

#---------------------------------------#
# Example spplot
#---------------------------------------#

# http://www.bristol.ac.uk/media-library/sites/cmpo/migrated/documents/gwr.pdf

colours=c("green","red","green")
t <- EUR$AREA
breaks1=c(min(t),median(t),mean(t),max(t))
spplot(EUR,"AREA" ,cuts=breaks1, col.regions=colours)


#---------------------------------------#
# ggmap
#---------------------------------------#

# https://journal.r-project.org/archive/2013-1/kahle-wickham.pdf

library(ggmap)

EURmap <- qmap("Europe" , zoom = 3, maptype = "satellite")

EUR2 <- fortify(EUR)

EURmap + geom_polygon(aes(x = long, y = lat), data = EUR2,
               colour = "white", fill = "black", alpha = .4, size = .3)


# http://www.r-bloggers.com/shapefile-polygons-plotted-on-google-maps-using-ggmap-in-r-throw-some-throw-some-stats-on-that-mappart-2/

#---------------------------------------#
# tmap
#---------------------------------------#

library(tmap)

qtm(EUR)

EUR@data$AREA2 <- as.character(EUR@data$AREA)

qtm(EUR,"AREA2")

qtm(Europe,"pop_est")

#---------------------------------------#
# Further example
#---------------------------------------#

# https://rstudio-pubs-static.s3.amazonaws.com/45950_5cfa0392d2d449a2a83144a5f66ad9b5.html

col.b<-colorRampPalette(brewer.pal(9,"Blues"))(47)

spplot(EUR,"AREA", col.regions=col.b, colorkey = TRUE, lwd=1, col="black",
       par.settings=list(panel.background=list(col="azure2")))


brks.qt=classIntervals(EUR$AREA,n=8,style="quantile")
brks.jk=classIntervals(EUR$AREA,n=8,style="jenks")
brks.eq=classIntervals(EUR$AREA,n=8,style="equal")
brks.sd=classIntervals(EUR$AREA,n=8,style="sd")

col.g<-colorRampPalette(brewer.pal(9,"Greens"))(47) #This is a single hue (sequential color scheme)

spplot(EUR,"AREA",at=brks.jk$brks,col.regions=col.g)

col.d<-c("#2d004b","#542788","#8073ac","#b2abd2","#d8daeb","#f7f7f7","#fee0b6","#fdb863","#e08214","#b35806","#7f3b08")

spplot(EUR,"AREA",at=brks.jk$brks,col.regions=col.d)


spplot(EUR,"AREA",at=brks.jk$brks,col.regions=col.d,
colorkey=list(width=0.5,     # works
              space="right", # not honoured
              tick.number=5, # not honoured, can be left out
              labels=list( # so we must do it by hand
                at=brks.jk$brks,
                labels=brks.jk$brks )))



#-----------------------#

p1<-spplot(EUR,"AREA",at=brks.eq$brks,col.regions=col.g,col="black",lwd=1,main=list(label="Equal Breaks"),par.settings=list(panel.background=list(col="azure2")))
p2<-spplot(EUR,"AREA",at=brks.jk$brks,col.regions=col.g,col="black",lwd=1,main=list(label="Jenks"),par.settings=list(panel.background=list(col="azure2")))
p3<-spplot(EUR,"AREA",at=brks.qt$brks,col.regions=col.g,col="black",lwd=1,main=list(label="Quantile"),par.settings=list(panel.background=list(col="azure2")))
p4<-spplot(EUR,"AREA",at=brks.sd$brks,col.regions=col.g,col="black",lwd=1,main=list(label="Standard Deviations"),par.settings=list(panel.background=list(col="azure2")))

print(p1,position=c(0,.5,.5,1),more=T) 
print(p2,position=c(.5,.5,1,1),more = T) 
print(p3,position=c(0,0,.5,0.5),more=T) 
print(p4,position=c(.5,0,1,0.5)) 


#---------------------------------------#
# Further example
#---------------------------------------#

# https://rpubs.com/daniballari/geovisualizacion

spplot(EUR, "AREA",
       scales=list(draw=T), cuts = 4,col.regions=c('blue', 'gray80', 'red',"green"),   legendEntries = c("low", "intermediate", "high","very high"))

#---------------------------------------#
# Further example
#---------------------------------------#

# http://r.789695.n4.nabble.com/make-an-own-different-color-legend-with-spplot-td3335552.html

library(sp)
data(meuse.grid)
gridded(meuse.grid) = ~x+y
meuse.grid$random <- rnorm(nrow(meuse.grid), 7, 2) # generate random data
meuse.grid$random[meuse.grid$random < 0] <- 0 # make sure there is no
meuse.grid$random[meuse.grid$random > 10] <- 10 # and bigger than ten
meuse.grid$random <- cut(meuse.grid$random, seq(0, 10, 0.1)) # here I

labelat = seq(0,100,by=10)
labeltext = paste("Hx",labelat)
spplot(meuse.grid, c("random"), col.regions = rainbow(100, start = 4/6,
                                                      end = 1),
       colorkey=list(width=0.3,     # works
                     space="right", # not honoured
                     tick.number=5, # not honoured, can be left out
                     labels=list( # so we must do it by hand
                       at=labelat,
                       labels=labeltext )))


#---------------------------------------#
# Links
#---------------------------------------#


plotvar <- EUR@data$AREA # gets data from shapefile .dbf
nclr <- 11
plotclr <- brewer.pal(nclr,"PuOr")
plotclr <- plotclr[nclr:1] # reorder colors
class <- classIntervals(plotvar, nclr, style="quantile")
colcode <- findColours(class, plotclr)

spplot(EUR,"AREA",col.regions=plotclr)

# a further example

nclr <- 8
plotclr <- brewer.pal(nclr,"BuPu")
class <- classIntervals(plotvar, nclr, style="equal")
colcode <- findColours(class, plotclr)
spplot(EUR, "AREA",
       col.regions=plotclr, at=round(class$brks, digits=1))

#---------------------------------------#
# Links
#---------------------------------------#

   # Paper
# https://cran.r-project.org/doc/contrib/intro-spatial-rl.pdf

# https://rpubs.com/daniballari/geovisualizacion

# http://geog.uoregon.edu/GeogR/topics/maps02.html

# https://ryouready.wordpress.com/2009/11/16/infomaps-using-r-visualizing-german-unemployment-rates-by-color-on-a-map/