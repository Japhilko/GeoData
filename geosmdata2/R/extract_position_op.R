extract_position_op <- function(OSM.Data,value){
  kov <- ifelse(value%in%osm_df$Value,"v","k")
  if(kov=="v"){
    ind <- which(value==osm_df$Value)
  }else{
    ind <- which(value==osm_df$Key)
  }
  Element <- osm_df$Element2[ind]

  node_id<- xpathApply(OSM.Data,paste("//tag[@",kov,"= '",value,"']/parent::",Element,"/@ id",sep="") )
  if (length(node_id)==0){
    Element <- osm_df$Element3[ind]
    node_id<- xpathApply(OSM.Data,paste("//tag[@",kov,"= '",value,"']/parent::",Element,"/@ id",sep="") )
    if (length(node_id)==0){
      Element <- osm_df$Element4[ind]
      node_id<- xpathApply(OSM.Data,paste("//tag[@",kov,"= '",value,"']/parent::",Element,"/@ id",sep="") )
      if (length(node_id)==0){
        Element <- osm_df$Element5[ind]
        node_id<- xpathApply(OSM.Data,paste("//tag[@",kov,"= '",value,"']/parent::",Element,"/@ id",sep="") )
      }
    }
  }

  pb <- txtProgressBar(min = 0, max = length(node_id), style = 3)

  lat_x <- xpathApply(OSM.Data,paste("//tag[@",kov," = '",value,"']/parent::",Element,"/@ lat",sep=""))
  lon_x <- xpathApply(OSM.Data,paste("//tag[@",kov," = '",value,"']/parent::",Element,"/@ lon",sep=""))
  Liste <- list()
  if (length(node_id)>5000){cat("It can take some time!","\n")}
  for (i in 1:length(node_id)){
    Liste_i <- unlist(xpathApply(OSM.Data,paste("//",Element,"[@id = ",node_id[i],"]//nd/attribute::*",sep="")))
    ind_ref <- which(names(Liste_i)=="lat")
    ind_lat <- which(names(Liste_i)=="lat")
    ind_lon <- which(names(Liste_i)=="lon")
    Liste[[i]] <- data.frame(ref=Liste_i[ind_ref],
                             lat=Liste_i[ind_lat],
                             lon=Liste_i[ind_lon],
                             id=rep(unlist(node_id[i]),length(ind_ref))
    )
    # cat("Object", i, "from",length(node_id), "\n")
    setTxtProgressBar(pb, i)
  }
  DF_x <- do.call(rbind,Liste)
  return(DF_x)
}
