#######################################################################################
####### Examples of the osmar-presentation at the Fossgis2012 in Dessau(Germany)#######
#######################################################################################

library("osmar")
library("fBasics")
library("plotrix")

par(ask=TRUE)
readline("Press <Enter> to continue")

#### Download (or load) 4 km² (2*2 km) bounding box from dessau
### downloading data from osm api
## src<- osmsource_api()
## bb<-center_bbox(12.232221,51.840577, 2000,2000)
## dessau<-get_osm(bb, source=src)
###

### download pre-computed data from website
download.file("http://osmar.r-forge.r-project.org/fossgis2012.RData",
              "fossgis2012.RData")
load("fossgis2012.RData")

dessau

#### structure of dessau with cut-out of examples
str(dessau,2,give.attr=FALSE)

dessau$nodes$attrs[1:6,]
dessau$ways$tags[1:4,]
dessau$ways$refs[1:4,]

#### summary of osmar-object
summary(dessau$nodes)
summary(dessau$ways)
summary(dessau$relations)
summary(dessau)$ways$keyval[1:6,]

par(ask=TRUE)
readline("Press <Enter> to continue")


###### making of the benchmap   ############################

#### function for reducing osmar object to original area
reduce_osmar<- function(object, boundbox){
  id<- find(object,
            node(attrs(lon>=boundbox[["left"]] & lon<=boundbox[["right"]] & lat>=boundbox[["bottom"]] & lat<=boundbox[["top"]])))
  ids<- find_up(object, node(id))
  ret<-subset(object, ids=ids)
  ret
}

#### defining original bounding box and
#### reducing the osmar object to this bounding box
bb<-center_bbox(12.232221,51.840577, 2000,2000)
red_dessau<-reduce_osmar(dessau,bb)
red_dessau

par(ask=TRUE)
readline("Press <Enter> to continue")

## 1) find amenity=bench in nodes
## 2) subset of these nodes ->new osmar-object
## 3) find ways with maxspeed=30
## 4) find corresponding nodes
## 5) subset of these nodes/ways ->new osmar-object
bench_ids<- find(red_dessau, node(tags(k=="amenity" & v=="bench")))
bench_dessau<-subset(red_dessau, node_ids=bench_ids)
footway_ids<- find(red_dessau,way(tags(k=="maxspeed" & v=="30")))
footway_ids<- find_down(red_dessau, way(footway_ids))
footway_dessau<-subset(red_dessau,ids=footway_ids)

par(ask=TRUE)
readline("Press <Enter> to continue")

## stepwise plotting of benchmap
## green (ways with maxspeed=30), red (bench), blue (location of Fossgis2012)
plot_ways(red_dessau, col=gray(0.4))
title("benches in dessau")
plot_ways(footway_dessau, col="darkgreen", add=TRUE, lwd=2)
plot_nodes(bench_dessau, col=2, add=TRUE, pch=8)
points(12.228295,51.840113, col="blue", pch=8, cex=2)

par(ask=TRUE)
readline("Press <Enter> to continue")


##### data.frame expansion with osmar-package ##########################
##### bench example                           ##########################

## finding benches and saving in data.frame with lon and lat variables
bench_ids<- find(dessau, node(tags(k=="amenity" & v=="bench")))
bench_dessau<-subset(dessau, node_ids=bench_ids)
bench_coords<-data.frame(id=bench_ids, lon=bench_dessau$nodes$attrs$lon, lat=bench_dessau$nodes$attrs$lat)
bench_coords[1:10,]

## downloading 2500m² bounding box around every bench
##
## bench_list<-vector("list", nrow(bench_coords))
## for(i in 1:nrow(bench_coords)){
##  tmp_bb<-center_bbox(bench_coords[i,"lon"],bench_coords[i,"lat"], 50,50)
##  tmp_osm<-get_osm(tmp_bb, source=src)
##  bench_list[[i]] <- tmp_osm
## }

bench_list[1:5]

par(ask=TRUE)
readline("Press <Enter> to continue")

## building new data.frame with counts of street-types and buildings
## for every data point

bench_data<-bench_coords
for(i in 1:nrow(bench_data)){
  bench_data$footway[i]<-summary(bench_list[[i]]$ways$tags$v)["footway"]
  bench_data$secondary[i]<-summary(bench_list[[i]]$ways$tags$v)["secondary"]
  bench_data$primary[i]<-summary(bench_list[[i]]$ways$tags$v)["primary"]
  bench_data$residential[i]<-summary(bench_list[[i]]$ways$tags$v)["residential"]
  bench_data$building[i]<-summary(bench_list[[i]]$ways$tags$k)["building"]
}
bench_data[is.na(bench_data)]<-0
head(bench_data)

par(ask=TRUE)
readline("Press <Enter> to continue")
##### Node count map ###################################################
#### red_dessau2: 10km x 10km area of dessau reduced to 10km x 10km
#### sp_dessau2: sp object as a result of as_sp(red_dessau2)

#### building a grid and making an osmar-object for every grid-cell ->bboxlist
summary(red_dessau2$nodes)$bbox->box
long <- seq(box[1,2], box[2,2], length.out=35)
lat <- seq(box[1,1], box[2,1], length.out=35)

coordslist <- vector("list", 34*34)
i <- 1
for(lo in 1:(length(long)-1)){
  for(la in 1:(length(lat)-1)){
    coordslist[[i]] <- c(left=long[lo],right=long[lo+1], bottom=lat[la],top=lat[la+1])
    i<-i+1
  }
}

bboxlist<-vector("list", 34*34)
for(i in 1:length(bboxlist)){
  bboxlist[[i]] <- reduce_osmar(red_dessau2, coordslist[[i]])
}


#### counting nodes in every grid.cell
nodecounts<-NA
for(i in 1:length(bboxlist))
  nodecounts[i]<- summary(bboxlist[[i]]$nodes)$n[["nodes"]]


#### plotting the map with help of the graphic packages
library(fBasics)
library(plotrix)
plot(sp_dessau2[[1]], col="white", axes=TRUE)
colors <- seqPalette(max(nodecounts)+1, "Reds")
for(i in 1:length(bboxlist)){
  tmp<-coordslist[[i]]
  rect(tmp[1],tmp[3],tmp[2],tmp[4], border=NA,angle=180, col=colors[summary(bboxlist[[i]]$nodes)$n[["nodes"]]])
}

color.legend(12.15, 51.891, 12.31, 51.894, rect.col=colors,
              legend=c(0,rep("",99),100,rep("",99),200,rep("",99),300, rep("",99),400,rep("",45)))

#### for orientation buildings and the river "Elbe" are plotted
build_id <- find(red_dessau2, way(tags(k=="building")))
build_ids<- find_down(red_dessau2, ids=way(build_id))
build_dessau2<-subset(red_dessau2, ids=build_ids)
plot_ways(build_dessau2, col=gray(0.6),add=TRUE)

elb_id<-find(red_dessau2, way(tags(v=="Elbe")))
elb_ids<-find_down(red_dessau2, ids=way(elb_id))
elbe<-subset(red_dessau2, ids=elb_ids)
plot_ways(elbe, col="lightblue", add=TRUE, lwd=2)

title("Count of Nodes in Dessau Area with buildings and the Elbe", line=3)
