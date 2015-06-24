
plotbui <- function(ua){
  ua_ids <- osmar::find(ua, osmar::way(osmar::tags(k == "building")))
  ua_ids2 <- osmar::find_down(ua, osmar::way(ua_ids))
  bg <- subset(ua, ids = ua_ids2)

  bg_erg <- as_sp(bg, "polygons")
  return(bg_erg)
}
