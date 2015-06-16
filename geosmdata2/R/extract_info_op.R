extract_info_op <- function(OSM.Data,value){
  way_id  <- unlist( xpathApply( OSM.Data, paste( "//tag[@v = '", value, "']/parent::way/@ id", sep = "" ) ) )
  n_obj <- length(xpathApply( OSM.Data, "//way" ))
  Liste <- list()
  for (i in 1:n_obj){
    Liste_i <- unlist(xpathApply( OSM.Data, paste("//way[@id = ",way_id[i],"]//tag/attribute::*",sep="") ) )

    p.node		<- paste( "//way[@id = '", way_id[i] ,"']/nd/@ref", sep = "" )
    way_node_save	<- as.numeric( xpathApply( OSM.Data, p.node ) )

    p.lat	<- paste("//node[@id = ", way_node_save  ,"]/@ lat", sep = "")
    p.lon	<- paste("//node[@id = ", way_node_save  ,"]/@ lon", sep = "")
    lat <- lon <- rep(NA,length(way_node_save ))
    for( j in 1:length(way_node_save ) )
    {
      lat_j 	<- as.numeric( xpathApply( OSM.Data, p.lat[ j ] ) )
      lat[ j ] <- ifelse(length(lat_j)>0,lat_j,NA)
      lon_j 	<- as.numeric( xpathApply( OSM.Data, p.lon[ j ] ) )
      lon[ j ] 	<-ifelse(length(lat_j)>0,lon_j,NA)
    }
    lon_i <- mean( lon ,na.rm=T)
    lat_i <-  mean( lat,na.rm=T )

    ind_k <- which(names(Liste_i)=="k")
    ind_v <- which(names(Liste_i)=="v")
    Liste[[i]] <- data.frame(k=Liste_i[ind_k],
                             v=Liste_i[ind_v],
                             id=rep(way_id[i],length(ind_k)),
                             lat=rep(lat_i,length(ind_k)),
                             lon=rep(lon_i,length(ind_k))
    )
  }

  DF_x <- do.call(rbind,Liste)
}
