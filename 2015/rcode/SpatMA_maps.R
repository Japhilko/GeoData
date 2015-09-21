
library(maps)
map("state",fill=T,col=1:10)

?map

## Hello world a first map
map()

## A map of the US
map("usa")

## A map of the france
map("france")

## a map of Italy
map ("italy", col = "blue")

## Italy in blue
map ("italy",fill =T, col = "blue")

## Get more colors
colors <- c("blue","red","yellow")

## ------------------------------------------------------------------------
map ("italy",fill =T, col = colors)

## ------------------------------------------------------------------------
map("italy",fill=T, col = rgb(0,1,0))

map("italy",fill=T, col = rgb(1,0,0))
 map("italy",fill=T, col = rgb(1,1,1))
 map("italy",fill=T, col = rgb(1,0.5,0.4))

## ------------------------------------------------------------------------
italy <- map("italy", plot = F)
head(italy$names)

 map("county")

Argument <- c("county","france","italy","nz","state","usa","world")
What <- c("US Counties","France","Italy","New Zealand","US States","USA","Countries of the world")

data.frame(Argument,What)

map("world", "Germany")

map("world", c("Germany","Poland"))

## ------------------------------------------------------------------------
map("world", c("Germany","Austria"),fill=T,
col=c("red","green"))

## ------------------------------------------------------------------------
map("world", "China")
map.scale()

## ------------------------------------------------------------------------
map.text("county", "penn")

## ------------------------------------------------------------------------
data(world.cities)

head(world.cities)

## ------------------------------------------------------------------------
map()
map.cities(world.cities)

## ------------------------------------------------------------------------
data(world.cities)
map("france")
map.cities(world.cities)

## ------------------------------------------------------------------------
FrenchCity <- world.cities$country.etc=="France"
FCit <- world.cities[FrenchCity,]

head(FCit,n=4)

## ------------------------------------------------------------------------
map("france")
map.cities(FCit,col="blue",pch=20)

## ------------------------------------------------------------------------
FCit_Bc<-FCit[FCit$pop>50000,]
map("france")
map.cities(FCit,col="blue",pch=20)
map.cities(FCit_Bc,col="red",pch=20)

## ------------------------------------------------------------------------
library(maps)
data(unemp)
data(county.fips)

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

