# Jan-Philipp Kolb
# Overview OSM data
# Fri Jan 15 13:31:19 2016

link <- "https://raw.githubusercontent.com/Japhilko/GeoData/master/data/Deutschland_generator.csv"

dat <- read.csv(link)

dat$generator.source[dat$generator.source=="Wind"] <- "wind"

dat$generator.source[dat$generator.source=="hydrogen"] <- "hydro"

dat$generator.source[dat$generator.source=="http://www.hedayati.eu/wkw/wkw03.html"] <- "hydro" 


dat$generator.source[dat$generator.source%in%c("Gas; Ã–l"
, "oil;gas")] <- "gas"

dat$generator.source <- as.character(dat$generator.source)

tab_generator <- table(dat$generator.source)

info <- names(tab_generator)[tab_generator==1]

dat$generator.source[dat$generator.source%in%info]<- "other"


table(dat$generator.source)
