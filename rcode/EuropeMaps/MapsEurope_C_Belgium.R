# Maps for Europe
# 27.02.2015
# Jan-Philipp Kolb
# Belgium



#-----------------------------------------------#
# Set paths
#-----------------------------------------------#

main.path <- "J:/Work/Statistik/Kolb/Paper/EURONAmaps/"
data.path <- paste(main.path,"data/",sep="")

#-----------------------------------------------#
# Get data
#-----------------------------------------------#

# https://cohesiondata.ec.europa.eu/dataset/GDP-Per-Head-2011-PPS-/j8wb-jxec?
setwd(data.path)
Dat <- read.csv("GDP_Per_Head_2011__PPS_.csv")



