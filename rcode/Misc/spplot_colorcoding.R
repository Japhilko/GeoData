



library(sp)
library(maptools)

data("wrld_simpl")

EUR <- wrld_simpl[wrld_simpl@data$REGION==150,]

Earea <- EUR@data$AREA

myColorScheme <- rep("blue",length(EUR))

spplot(EUR,"REGION",col.regions=myColorScheme)

myColorScheme[which.max(Earea)] <- "red"

spplot(EUR,"REGION",col.regions=myColorScheme)
