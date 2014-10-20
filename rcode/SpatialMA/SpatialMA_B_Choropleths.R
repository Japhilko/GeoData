##################################
# Spatial Mannheim
# Jan-Philipp Kolb
# 17.10.2014
#
# Choropleths
#
##################################

#--------------------------------#
# Define paths
#--------------------------------#

graph.path <- "J:/Work/Statistik/Kolb/Workshops/2014/SpatialMannheim/Rslides/SpatialMA_B_Choropleths/figure"

graph.path <- "C:/Users/Kolb/Dropbox/RForschung/SpatialMannheim/Rslides/SpatialMA_B_Choropleths/figure"

graph.path <- "D:/Dropbox/RForschung/SpatialMannheim/Rslides/SpatialMA_B_Choropleths/figure"


#--------------------------------#
# Package maps
#--------------------------------#


library(maps)

map("world")

# national boundaries

setwd(graph.path)

pdf("usa_map.pdf")
map('usa')
dev.off()

map("france")

pdf("france_map.pdf")
map('france')
dev.off()

map("france", fill = TRUE)


map("italy", col = "blue")

  # get blue borders 

pdf("italy_maps.pdf")
map("italy", col = "blue")
dev.off()

  # if we want the areas in blue:

map("italy",fill=T, col = "blue")

pdf("italy_maps2.pdf")
map("italy",fill=T, col = "blue")
dev.off()

pdf("italy_maps3.pdf")
map("italy",fill=T, col = 1:10)
dev.off()


map("italy", fill = TRUE , col = 1:10)

  # If you only type 4 you get blue:

map("italy",fill=T, col = 4)

setwd(graph.path)
pdf("italy_maps_blue.pdf")
map("italy",fill=T, col = 4)
dev.off()

  # Try it with other numbers


italy <- map("italy", plot = F)
head(italy$names)




map("france",border="green")


map("state")
map.axes()


  # For most of the countries you have to specify two arguments:

map("world", "Germany")

pdf("map_Germany.pdf")
map("world", "Germany")
dev.off()


  # Get a map for more than one country:

map("world", c("Germany","Poland"))

pdf("map_GermanyPoland.pdf")
map("world", c("Germany","Poland"))
dev.off()

map("world", c("Germany","Austria"),fill=T,col=c("red","green"))


pdf("map_GermanyAustria.pdf")
map("world", c("Germany","Austria"),fill=T,col=c("red","green"))
dev.off()

  # Some additional features:

map("world", "China")
map.scale()


pdf("map_China.pdf")
map("world", "China")
map.scale()
dev.off()

  # maps with labels

map.text("county", "penn")

pdf("maps_penn.pdf")
map.text("county", "penn")
dev.off()

map.text("world", "Germany")

map("world", "Australia")

map("world", "Poland")

map('state.carto', fill = TRUE, col = palette())


#---------------#
# map cities


data(world.cities)
map()
map.cities(world.cities)

png("worldCities.png")
map.cities(world.cities)
dev.off()


data(world.cities)

head(world.cities)


  # ignore the following two lines
library(xtable)
xtable(head(world.cities))

map("france")
map.cities(world.cities)

pdf("citiesFrance.pdf")
map("france")
map.cities(world.cities)
dev.off()


FCit <- world.cities[world.cities$country.etc=="France",]

xtable(head(FCit))

pdf("FCit.pdf")
map("france")
map.cities(FCit,col="blue",pch=20)
dev.off()


FCit_Bc <- FCit[FCit$pop>50000,]

pdf("FCit_Bc.pdf")
map("france")
map.cities(FCit,col="blue",pch=20)
map.cities(FCit_Bc,col="red",pch=20)
dev.off()



#--------------------------------#
# Package maptools
#--------------------------------#

library(maptools)
data(wrld_simpl)


plot(wrld_simpl)

pdf("wrld_simpl.pdf")
plot(wrld_simpl)
dev.off()

head(wrld_simpl@data)

####
# only South Africa

SouthAfrica <- wrld_simpl[wrld_simpl@data$NAME =="South Africa",]
plot(SouthAfrica)

pdf("maptools_SouthAfrica.pdf")
plot(SouthAfrica)
dev.off()

Pol <- wrld_simpl@data$NAME=="Poland"
table(Pol)

Poland <- wrld_simpl[Pol==T,]
plot(Poland,col="royalblue",border="darkblue")

pdf("Poland_maptools.pdf")
plot(Poland,col="royalblue",border="darkblue")
dev.off()

EuropeList <- c('Germany', 'France')
my_map <- wrld_simpl[wrld_simpl$NAME %in% EuropeList, ]

plot(my_map)

my_map@data$color <- c("blue","green")
plot(my_map,col=my_map@data$color)

pdf("DEFra_maptools.pdf")
plot(my_map,col=my_map@data$color)
dev.off()

plot(wrld_simpl, bg='azure2', col='khaki', border='#AAAAAA')

  # Draw only parts of the world
my_map <- wrld_simpl[wrld_simpl$NAME %in% c('China', 'Mongolia','Kazakhstan'),]

con <- url("http://gadm.org/data/rda/CHE_adm1.RData")
print(load(con))
close(con)




#--------------------------------#
# Package dismo
#--------------------------------#

library(dismo)
mymap <- gmap("France")  # choose whatever country
plot(mymap)

setwd(graph.path)
pdf("France_dismo.pdf")
plot(mymap)
dev.off()


MAmap <- gmap("Mannheim")
plot(MAmap)

pdf("Mannheim_dismo.pdf")
plot(MAmap)
dev.off()
