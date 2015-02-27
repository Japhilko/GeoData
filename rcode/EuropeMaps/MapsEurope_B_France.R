# Eurona 
# 27.02.2015
# Jan-pHilipp Kolb
# maps for France


#-----------------------------------------------#
# Libraies
#-----------------------------------------------#

library(maptools)
library(sp)
library(XML)
require('RDSTK')

#-----------------------------------------------#
# Set paths
#-----------------------------------------------#

main.path <- "J:/Work/Statistik/Kolb/Paper/EURONAmaps/"
data.path <- paste(main.path,"data/",sep="")

#-----------------------------------------------#
# get map
#-----------------------------------------------#


setwd(data.path)
load("FRA_adm5.RData")

plot(gadm)

#https://datamarket.com/data

#-----------------------------------------------#
# Links - data sources
#-----------------------------------------------#


# http://www.ined.fr/fr/tout-savoir-population/chiffres/europe-pays-developpes/indicateurs-fecondite/
# http://www.insee.fr/fr/themes/tableau.asp?reg_id=98&ref_id=CMPTEF02215


#-----------------------------------------------#
# Links
#-----------------------------------------------#


# http://coulmont.com/cartes/rcarto.pdf

# http://coulmont.com/blog/2011/12/11/ah-36-000-communes/

#http://www.r-bloggers.com/subjective-ways-of-cutting-a-continuous-variables/

# http://www.r-bloggers.com/r-streets-of-france/

# http://www.r-bloggers.com/mapping-prosperity-in-france-with-r/

# http://www.r-bloggers.com/names-of-villages-in-france/