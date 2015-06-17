extract_info_op <- function(OSM.Data,value){
  node_id<- xpathApply(OSM.Data,paste("//tag[@v = '",value,"']/parent::node/@ id",sep="") )
  lat_x <- xpathApply(OSM.Data,paste("//tag[@v = '",value,"']/parent::node/@ lat",sep=""))
  lon_x <- xpathApply(OSM.Data,paste("//tag[@v = '",value,"']/parent::node/@ lon",sep="")) 
  Liste <- list()
  for (i in 1:length(node_id)){
    Liste_i <- unlist(xpathApply(OSM.Data,paste("//node[@id = ",node_id[i],"]//tag/attribute::*",sep="")))
    ind_k <- which(names(Liste_i)=="k")
    ind_v <- which(names(Liste_i)=="v")
    Liste[[i]] <- data.frame(k=Liste_i[ind_k],
                             v=Liste_i[ind_v],
                             id=rep(unlist(node_id[i]),length(ind_k))
    )
  }
  DF_x <- do.call(rbind,Liste)
  DF_x1 <- data.frame(with(DF_x,tapply(v,list(id,k),function(x)as.character(x))))
  DF_x1$lat <- unlist(as.numeric(lat_x))
  DF_x1$lon <- unlist(as.numeric(lon_x))
  return(DF_x1)
}
  