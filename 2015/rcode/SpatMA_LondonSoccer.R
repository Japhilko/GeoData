# Jan-Philipp Kolb
# Mon Oct 19 08:25:10 2015


data.path2 <- "J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/data/LondonSoccer"
setwd(data.path2)

library(xlsx)

library(devtools)
install_github("Japhilko/GeoData/geosmdata2")
library(geosmdata2)
library(ggmap)


# data download from
# https://en.wikipedia.org/wiki/Football_in_London

Lfb <- read.xlsx("LondonFootball.xlsx",1)

Lfb_df <- data.frame(club=Lfb$Club,
                     stadium=Lfb$Stadium,
                     place="London",
                     Capacity=Lfb$Capacity,
                     Founded=Lfb$Founded,
                     lat=NA,
                     lon=NA)

Lfb_df <- Lfb_df[!is.na(Lfb_df$Capacity),]                     

for (i in 1:nrow(Lfb_df)){
  res <- geocode_osm(paste(as.character(Lfb_df$stadium[i]),"London"))
  Lfb_df$lat[i] <- res["lat"]
  Lfb_df$lon[i] <- res["lon"]
}

Lfb_df$rplace <- NA
for(i in 1:nrow(Lfb_df)){
  Lfb_df$rplace[i] <- revgeocode(c(Lfb_df$lon[i],Lfb_df$lat[i]))  
}


ind <- c(which(is.na(Lfb_df$rplace)),agrep("USA",Lfb_df$rplace),
         agrep("Australia",Lfb_df$rplace),agrep("Lesotho",Lfb_df$rplace),
         agrep("France",Lfb_df$rplace))


for (i in ind){
  res <- geocode_osm(paste(as.character(Lfb_df$club[i]),"London","UK"))
  Lfb_df$lat[i] <- res["lat"]
  Lfb_df$lon[i] <- res["lon"]
}


setwd(data.path2)
save(Lfb_df,file="Lfb_df.RData")


#---------------------------------------------------#



data.path <- "J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/data"
setwd(data.path)


#---------------------------------------------------#

place <- "London"
objectI <- c("soccer")
object <- get_osm_nodes(objectI,place)
soccer <- extract_info_op(object,objectI)

saveXML(object,file=paste(place,"_",objectI,".xml",sep=""))

#---------------------------------------------------#

place <- "London"
objectI <- c("stadium")
object <- get_osm_nodes(objectI,place)
stadium <- extract_info_op(object,objectI)

saveXML(object,file=paste(place,"_",objectI,".xml",sep=""))

#---------------------------------------------------#

place <- "London"
objectI <- c("pitch")
object <- get_osm_nodes(objectI,place)
pitch <- extract_info_op(object,objectI)

saveXML(object,file=paste(place,"_",objectI,".xml",sep=""))



#---------------------------------------------------#

objectList <- c("pitch","soccer")
i<-1
objectI <- objectList[i]
object <- get_osm_nodes(objectI,place)
obj <- extract_info_op(object,objectI)


setwd(data.path)
saveXML(object,file=paste(place,"_",objectI,".xml",sep=""))

#---------------------------------------------------#

l <- "https://en.wikipedia.org/wiki/Football_in_London"

res <- (l)


l <- "https://simple.wikipedia.org/wiki/List_of_English_football_teams"



#---------------------------------------------------#
# Links
#---------------------------------------------------#

# http://stackoverflow.com/questions/1395528/scraping-html-tables-into-r-data-frames-using-the-xml-package