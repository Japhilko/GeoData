
plotbui <- function(ua){
  ua_ids <- find(ua, way(tags(k == "building")))
  ua_ids2 <- find_down(ua, way(ua_ids))
  bg <- subset(ua, ids = ua_ids2)
  
  bg_erg <- as_sp(bg, "polygons")  
  return(bg_erg)
}
