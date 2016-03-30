# http://www.r-bloggers.com/easier-composite-u-s-choropleths-with-albersusa/

library(readxl)
library(rgeos)
library(maptools)
library(ggplot2)   # devtools::install_github("hadley/ggplot2") only if you want subtitles/captions
library(ggalt)
library(ggthemes)
library(albersusa) # devtools::install_github("hrbrmstr/albersusa")
library(viridis)
library(scales)