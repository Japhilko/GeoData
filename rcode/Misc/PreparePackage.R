
data.path <- "C:/Forschung/GeoData/geosmdata2/data"

setwd(data.path)
load("osm_df.RData")
for (i in 1:ncol(osm_df)){
  osm_df[,i] <- iconv(osm_df[,i], "latin1", "ASCII", sub="")
}


which(osm_df$Key=="aqueduct")

osm_df <- osm_df[1:5,]
saveRDS(osm_df,file="osm_df.rds",compress='xz')
save(osm_df,file="osm_df.RData",compress='xz')

load("uaBerlin.RData")
save(uaBerlin,file="uaBerlin.RData",compress='xz')


#-------------------------------------#
# LaTeX warning

# http://tex.stackexchange.com/questions/125274/error-font-ts1-zi4r-at-540-not-found


# http://dewoods.com/blog/character-encodings-demystified
