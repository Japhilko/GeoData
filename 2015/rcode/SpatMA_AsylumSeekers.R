#-------------------------------------#
# Load libraries
#-------------------------------------#

library(tmap)

#-------------------------------------#
# Set paths
#-------------------------------------#

data.path <- "J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/data"
graph.path <- "C:/Users/kolbjp/Documents/GitHub/GeoData/data/figure"
graph.path2 <- "J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/data/figure"

#-------------------------------------#
# Load data
#-------------------------------------#

setwd(data.path)
# Extracted from the UNHCR Population Statistics Reference Database,"United Nations High Commissioner for Refugees"
# Date extracted: 2015-08-20 17:18:16 +02:00

dat2 <- read.csv2("unhcr_data.csv")
dat <- dat2

  # Polygons are in the world data tmap-package
data(World)
World2 <- World

#-------------------------------------#
# Prepare data
#-------------------------------------#

colnames(dat)[2] <- "Country"
colnames(dat)[4] <- "Refugees"
colnames(dat)[5] <- "Asylum_seekers"
colnames(dat)[11] <- "Others"

dat <- dat[,-c(6:10)]


dat$Asylum_seekers <- as.character(dat$Asylum_seekers)
dat$Asylum_seekers[dat$Asylum_seekers=="*"] <- NA
dat$Asylum_seekers[dat$Asylum_seekers==""] <- NA
dat$Asylum_seekers <- as.numeric(dat$Asylum_seekers)


dat$Refugees <- as.numeric(as.character(dat$Refugees))

save(dat,file="UNHCR_dat.RData")

#-------------------------------------#
# Find countries - preparation
#-------------------------------------#


tmap_c <- as.character(World@data$name)

dat_c <- as.character(dat[dat$Year==2014,2])

dat_c <- unique(as.character(dat[,2]))

ind <- match(tmap_c,dat_c)

#-------------------------------------#
# Find countries
#-------------------------------------#

tmap_c2 <- tmap_c
tmap_c2[which(tmap_c=="Bosnia and Herz.")] <- "Bosnia and Herzegovina"
tmap_c2[which(tmap_c=="Bolivia")] <- "Bolivia (Plurinational State of)"
tmap_c2[which(tmap_c=="Brunei")] <- "Brunei Darussalam"
tmap_c2[which(tmap_c=="Cote d'Ivoire")] <- "CÃ´te d'Ivoire"
tmap_c2[which(tmap_c=="Dem. Rep. Congo")] <- "Dem. Rep. of the Congo"
tmap_c2[which(tmap_c=="N. Cyprus")] <- "Cyprus"
tmap_c2[which(tmap_c=="Eq. Guinea")] <- "Equatorial Guinea"
tmap_c2[which(tmap_c=="Iran")] <- "Iran (Islamic Rep. of)"
tmap_c2[which(tmap_c=="Lao PDR")] <- "Lao People's Dem. Rep."
tmap_c2[which(tmap_c=="Syria")] <- "Syrian Arab Rep."
tmap_c2[which(tmap_c=="Kosovo")] <- "Serbia and Kosovo (S/RES/1244 (1999))"
tmap_c2[which(tmap_c=="Russia")] <- "Russian Federation"
tmap_c2[which(tmap_c=="Macedonia")] <- "The former Yugoslav Republic of Macedonia"

#-------------------------------------#
# Combine data
#-------------------------------------#

dat14G <- dat[dat$Year==2014 & dat$Country=="Germany",]

indG <- match(tmap_c2,as.character(dat14G$Origin))
World2@data$Asylum_seekers_14 <- as.numeric(dat14G$Asylum_seekers[indG])

#-------------------------------------#
# Maps
#-------------------------------------#

setwd(graph.path)

png("Germany_Asylum_seekers_14.png")
qtm(World2, fill="Asylum_seekers_14",fill.title="Asylum 2014") 
dev.off()


#-------------------------------------#
# Create maps for more years
#-------------------------------------#

years <- unique(dat$Year)

for (i in 50:length(years)){
  datxG <- dat[dat$Year==years[i] & dat$Country=="Germany",]
  
  indG <- match(tmap_c2,as.character(datxG$Origin))
  World2@data$Asylum_seekers <- as.numeric(datxG$Asylum_seekers[indG])
  setwd(graph.path2)
  
  png(paste("Germany_Asylum_seekers_",years[i],".png",sep=""),width=800)
    qtm(World2, fill="Asylum_seekers",fill.title=paste("Asylum",years[i])) 
  dev.off()
  cat(i,"\n")
}

#-------------------------------------#
# Map on refugees
#-------------------------------------#

datR14 <- with(dat[dat$Year==2014,],tapply(Refugees,Country,sum,na.rm=T))

indR14 <- match(tmap_c2,names(datR14))
World2@data$Refugees_14 <- as.numeric(datR14[indR14])

setwd(graph.path)
png("Refugees_14.png")
qtm(World2, fill="Refugees_14",fill.title="Refugees 2014") 
dev.off()

# map for Europe
data(Europe)
tmap_e <- as.character(Europe@data$name)

tmap_e2 <- tmap_e
tmap_e2[which(tmap_e=="Bosnia and Herz.")] <- "Bosnia and Herzegovina"
tmap_e2[which(tmap_e=="N. Cyprus")] <- "Cyprus"
tmap_e2[which(tmap_e=="Kosovo")] <- "Serbia and Kosovo (S/RES/1244 (1999))"
tmap_e2[which(tmap_e=="Russia")] <- "Russian Federation"
tmap_e2[which(tmap_e=="Macedonia")] <- "The former Yugoslav Republic of Macedonia"

indR14 <- match(tmap_e2,names(datR14))
Europe@data$Refugees_14 <- as.numeric(datR14[indR14])
Europe@data$lRefugees_14 <- log(Europe@data$Refugees_14)

Europe@data$Refugees2area_14 <- Europe@data$Refugees_14/Europe@data$area

tpop <- Europe@data$pop_est/1000
Europe@data$Refugees2pop_14 <- round(Europe@data$Refugees_14/tpop,digits=2)

setwd(graph.path2)
png("Europe_Refugees_14.png")
qtm(Europe, fill="Refugees_14",fill.title="Refugees 2014",
    fill.style="kmeans",width=800) 
dev.off()

png("lEurope_Refugees_14.png")
qtm(Europe, fill="lRefugees_14",fill.title="Log nr Refugees 2014",
    fill.style="kmeans",width=800) 
dev.off()

png("Europe_Refugees2area_14.png")
qtm(Europe, fill="Refugees2area_14",fill.title="Refugees/area 2014", 
    fill.style="kmeans",width=800) 
dev.off()

png("Europe_Refugees2pop_14.png")
qtm(Europe, fill="Refugees2pop_14",fill.title="Refugees per t", 
    fill.style="kmeans",width=800) 
dev.off()


setwd(data.path)
save(Europe,file="Europe.RData")


#-------------------------------------#
# Analysis
#-------------------------------------#

dat2years <- with(dat[dat$Country=="Germany",],tapply(Asylum_seekers,Year,sum,na.rm=T))

setwd(data.path)
save(dat2years,file="dat2years.RData")


maxi <- sort(dat14G$Asylum_seekers,decreasing = T)[1:20]
dat14G[match(maxi,dat14G$Asylum_seekers),"Origin"]


maxi2 <- sort(World2@data$Asylum_seekers,decreasing = T)[1:20]
World2@data[match(maxi2,World2@data$Asylum_seekers),"name"]

dat14G[which.max(dat14G$Asylum_seekers),]

World2@data[which.max(World2@data$Asylum_seekers_14 ),]

World2@data[World2@data$sovereignt=="Syria",]

#-------------------------------------#
# Misc
#-------------------------------------#

i <- 6
tmap_c[is.na(ind)][i]

dat_c2 <- sort(unique(as.character(dat[,2])))

dat14 <- dat[dat$Year==2014,]

dat14Go <- dat[dat$Year==2014 & dat$Origin=="Germany",]

head(dat_c2,n=30)


ind2 <- list()
for (i in 1:length(tmap_c)){
  ind2[[i]] <- agrep(tmap_c[i],dat_c)  
}


#-------------------------------------#
# Links
#-------------------------------------#


# http://www.umm.uni-heidelberg.de/ag/cf_facs/oeffnen_csv.pdf

# RefugeeMapGermany2015_tn.jpg
# http://www.viewsoftheworld.net/?p=4556