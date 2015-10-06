
library(htmltab)
library(geosmdata2)
library(geocodeHERE)
library(ggmap)


#---------------------------------------------#
# Get a list of heritages
#---------------------------------------------#


link <- "https://en.wikipedia.org/wiki/List_of_World_Heritage_Sites_in_Germany"


heritageG <- htmltab(doc = link, which = "//th[text() = 'Site']/ancestor::table")
head(heritageG)


lat1 <- vector()
lon1 <- vector()

for (i in 1:length(heritageG[,3])){
  info <- strsplit(heritageG[i,3],"»¿")[[1]][3]
  info2 <- strsplit(info,"Â°N")
  lat1[i] <- as.numeric(info2[[1]][1])
  lon1[i] <- as.numeric(substr(info2[[1]][2],1,8))
}

heritageG_df <- data.frame(site=heritageG[,1],lat=unlist(lat1),lon=unlist(lon1))


#---------------------------------------------#
# Produce a map
#---------------------------------------------#

DE_map <- qmap("Deutschland",zoom=6)


DE_map + geom_point(aes(x = lon, y = lat),
             data = heritageG_df,col="red",size=3)

#---------------------------------------------#
# Misc
#---------------------------------------------#


for (i in 1:nrow(heritageG_df)){
  info <- geocodeHERE_simple(as.character(heritageG[i,1]))  
  heritageG_df$lat[i] <- info[1]
  heritageG_df$lon[i] <- info[2]
}


library("XML")

swim1500 <-  readHTMLTable(link,which=1,stringsAsFactors=FALSE)


library(XML)
# url
swim_wiki <-   "http://en.wikipedia.org/wiki/World_record_progression_1500_metres_freestyl"
swim1500 <-  readHTMLTable(swim_wiki,which=1,stringsAsFactors=FALSE)

install.packages("htmltab")
library(htmltab)

url <- "http://en.wikipedia.org/wiki/Demography_of_the_United_Kingdom"
ukLang <- htmltab(doc = url, which = "//th[text() = 'Ability']/ancestor::table")
head(ukLang)





# http://gastonsanchez.com/work/webdata/getting_web_data_r2_reading_files.pdf

# http://stackoverflow.com/questions/1395528/scraping-html-tables-into-r-data-frames-using-the-xml-package


# https://cran.r-project.org/web/packages/htmltab/vignettes/htmltab.html