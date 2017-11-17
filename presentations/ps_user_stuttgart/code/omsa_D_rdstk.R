# Jan-Philipp Kolb
# Thu Sep 08 13:42:12 2016

library("RDSTK")

## Set paths

data.path <- "J:/Work/Statistik/Kolb/Paper/OSM_SmallArea/data"

## load data

setwd(data.path)

load("osmsa_PLZ_14.RData")

load("info_rdstk.RData")
(load("info_rdstk_landcover.RData"))
(load("info_rdstk_mean_temperature.RData"))
(load("info_rdstk_elevation.RData"))
(load("info_rdstk_mean_temperature.RData"))


coo_PLZ <- coordinates(PLZ)
info_rdstk <- list()

# http://www.datasciencetoolkit.org/developerdocs#coordinates2statistics
# https://cran.r-project.org/web/packages/RDSTK/RDSTK.pdf

for (i in 1:nrow(coo_PLZ)){
  info_rdstk[[i]] <- coordinates2statistics(coo_PLZ[i,2], 
                                            coo_PLZ[i,1], 
                                            'population_density')
  cat(PLZ@data$PLZ99_N[i],PLZ@data$PLZORT99[i],info_rdstk[[i]]$statistics.population_density.value,"\n")
  
}

# save(info_rdstk,file="info_rdstk.RData")

## Combine data

PLZ$population_density <- NA

for (i in 1:nrow(coo_PLZ)){
  PLZ$population_density[i] <- info_rdstk[[i]]$statistics.population_density.value
}

# save(PLZ,file="osmsa_PLZ_6.RData")

### Get more info

load("data/info_rdstk.RData")

info_rdstk[[1]]


coo_PLZ <- coordinates(PLZ)

i<-1
# info_rdstk2 <- list()


for (i in 1:nrow(coo_PLZ)){
  info_rdstk2[[i]] <- coordinates2statistics(coo_PLZ[i,2], 
                                            coo_PLZ[i,1], 
                                            'land_cover')
  cat(PLZ@data$PLZ99_N[i],PLZ@data$PLZORT99[i],as.character(info_rdstk2[[i]]$statistics.land_cover.description),"\n")
  
}

save(info_rdstk2,file="info_rdstk_landcover.RData")

## elevation

info_rdstk3 <- list()
for (i in 1:nrow(coo_PLZ)){
  info_rdstk3[[i]] <- coordinates2statistics(coo_PLZ[i,2], 
                                             coo_PLZ[i,1], 
                                             'elevation')
  cat(PLZ@data$PLZ99_N[i],PLZ@data$PLZORT99[i],info_rdstk3[[i]]$statistics.elevation.value,"\n")
}
save(info_rdstk3,file="info_rdstk_elevation.RData")

## mean_temperature

info_rdstk4 <- list()
for (i in 1:nrow(coo_PLZ)){
  info_rdstk4[[i]] <- coordinates2statistics(coo_PLZ[i,2], 
                                             coo_PLZ[i,1], 
                                             'mean_temperature')
  cat(PLZ@data$PLZ99_N[i],PLZ@data$PLZORT99[i],info_rdstk4[[i]]$statistics.mean_temperature.value,"\n")
}


save(info_rdstk4,file="info_rdstk_mean_temperature.RData")


## Daten an PLZ anspielen


PLZ$land_cover.index <- NA
PLZ$land_cover.value <- NA
PLZ$land_cover.description <- NA

for (i in 1:length(PLZ)){
  if(!is.null(info_rdstk2[[i]])){
    PLZ$land_cover.index[i] <- info_rdstk2[[i]]$statistics.land_cover.index  
    info_lc <- info_rdstk2[[i]]$statistics.land_cover.description
    info_lc <- as.character(info_lc)
    info_lc <- gsub("What type of environment exists around this point - ","",info_lc)
    PLZ$land_cover.description[i] <- info_lc
    value_lc <- info_rdstk2[[i]]$statistics.land_cover.value
    PLZ$land_cover.value[i] <- as.character(value_lc)
  }
}


PLZ$elevation.value <- NA

for (i in 1:length(PLZ)){
  if(!is.null(info_rdstk3[[i]])){
    PLZ$elevation.value[i] <- info_rdstk3[[i]]$statistics.elevation.value  
  }
}


PLZ$temp_Jan <- NA
PLZ$temp_Feb <- NA
PLZ$temp_Mar <- NA
PLZ$temp_Apr <- NA
PLZ$temp_May <- NA
PLZ$temp_Jun <- NA
PLZ$temp_Jul <- NA
PLZ$temp_Aug <- NA
PLZ$temp_Sep <- NA
PLZ$temp_Oct <- NA
PLZ$temp_Nov <- NA
PLZ$temp_Dez <- NA


for (i in 1:length(PLZ)){
  if(!is.null(info_rdstk4[[i]])){
    PLZ$temp_Jan[i] <- info_rdstk4[[i]]$statistics.mean_temperature.value[1]
    PLZ$temp_Feb[i] <- info_rdstk4[[i]]$statistics.mean_temperature.value[2]
    PLZ$temp_Mar[i] <- info_rdstk4[[i]]$statistics.mean_temperature.value[3]
    PLZ$temp_Apr[i] <- info_rdstk4[[i]]$statistics.mean_temperature.value[4]
    PLZ$temp_May[i] <- info_rdstk4[[i]]$statistics.mean_temperature.value[5]
    PLZ$temp_Jun[i] <- info_rdstk4[[i]]$statistics.mean_temperature.value[6]
    PLZ$temp_Jul[i] <- info_rdstk4[[i]]$statistics.mean_temperature.value[7]
    PLZ$temp_Aug[i] <- info_rdstk4[[i]]$statistics.mean_temperature.value[8]
    PLZ$temp_Sep[i] <- info_rdstk4[[i]]$statistics.mean_temperature.value[9]
    PLZ$temp_Oct[i] <- info_rdstk4[[i]]$statistics.mean_temperature.value[10]
    PLZ$temp_Nov[i] <- info_rdstk4[[i]]$statistics.mean_temperature.value[11]
    PLZ$temp_Dez[i] <- info_rdstk4[[i]]$statistics.mean_temperature.value[12]
    
  }
}



save(PLZ,file="osmsa_PLZ_14.RData")

# precipitation 


coordinates2politics(coo_PLZ[i,2], 
                       coo_PLZ[i,1])




## Resources

# http://www.twofishes.net/

# r-project + lat lon get population density


