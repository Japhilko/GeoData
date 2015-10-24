
data.path <- "C:/Forschung/GeoData/geosmdata2/data"

setwd(data.path)
load("osm_df.RData")

save(osm_df,file="osm_df.RData",compress='xz')

load("uaBerlin.RData")
save(uaBerlin,file="uaBerlin.RData",compress='xz')


#-------------------------------------#
# LaTeX warning

# http://tex.stackexchange.com/questions/125274/error-font-ts1-zi4r-at-540-not-found
