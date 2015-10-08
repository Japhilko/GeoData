library(data.table)
library(dplyr) 
library(leaflet)
library(rgdal)
library(RColorBrewer)

# http://www.r-bloggers.com/a-segmentation-of-the-world-according-to-migration-flows-ft-leaflet/
data.path <- "J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/data"
file <- "enigma-org.worldbank.migration-remittances.migrants.migration-flow-c57405e33412118c8757b1052e8a1490.csv"
setwd(data.path)


populflows = read.csv(file="enigma-org.worldbank.migration-remittances.migrants.migration-flow-c57405e33412118c8757b1052e8a1490.csv", stringsAsFactors=FALSE)
population = fread("enigma-org.worldbank.hnp.data-eaa31d1a34fadb52da9d809cc3bec954.csv")
# Population
population %>% 
  filter(indicator_name=="Population, total") %>% 
  as.data.frame %>% 
  mutate(decade=(year-year%%10)) %>% 
  group_by(country_name, country_code, decade) %>% 
  summarise(avg_pop=mean(value)) -> population2
# Inmigrants by country
populflows %>% filter(!is.na(total_migrants)) %>% 
  group_by(migration_year, destination_country) %>% 
  summarise(inmigrants = sum(total_migrants))  %>% 
  merge(population2, by.x = c("destination_country", "migration_year"), by.y = c("country_name", "decade"))  %>% 
  mutate(p_inmigrants=inmigrants/avg_pop) -> inmigrants
# Migrants by country
populflows %>% filter(!is.na(total_migrants)) %>% 
  group_by(migration_year, country_of_origin) %>% 
  summarise(migrants = sum(total_migrants)) %>%  
  merge(population2, by.x = c("country_of_origin", "migration_year"), by.y = c("country_name", "decade"))  %>%
  mutate(p_migrants=migrants/avg_pop) -> migrants
# Join of data sets
migrants %>% 
  merge(inmigrants, by.x = c("country_code", "migration_year"), by.y = c("country_code", "migration_year")) %>%
  filter(migration_year==2000) %>% 
  select(country_of_origin, country_code, avg_pop.x, migrants, p_migrants, inmigrants, p_inmigrants) %>% 
  plyr::rename(., c("country_of_origin"="Country", 
                    "country_code"="Country.code", 
                    "avg_pop.x"="Population.mean",
                    "migrants"="Total.migrants",
                    "p_migrants"="p.of.migrants",
                    "inmigrants"="Total.inmigrants",
                    "p_inmigrants"="p.of.inmigrants")) -> populflows2000
# Threshold to create groups
populflows2000 %>% 
  summarise(x=sum(Total.migrants), y=sum(Total.inmigrants), z=sum(Population.mean)) %>% 
  mutate(m=y/z) %>% 
  select(m)  %>% 
  as.numeric -> avg
# Segmentation
populflows2000$Group="Receiver"
populflows2000[populflows2000$p.of.migrants>avg & populflows2000$p.of.inmigrants>avg, "Group"]="Transit"
populflows2000[populflows2000$p.of.migrants<avg & populflows2000$p.of.inmigrants<avg, "Group"]="Isolated" populflows2000[populflows2000$p.of.migrants>avg & populflows2000$p.of.inmigrants<avg, "Group"]="Emitter" 

#Loading shapefile from http://data.okfn.org/data/datasets/geo-boundaries-world-110m 
countries=readOGR("countries.geojson", "OGRGeoJSON") 
# Join shapefile and enigma information 
joined=merge(countries, populflows2000, by.x="wb_a3", by.y="Country.code", all=FALSE, sort = FALSE) 
joined$Group=as.factor(joined$Group) 
# To define one color by segment 
factpal=colorFactor(brewer.pal(4, "Dark2"), joined$Group) 
leaflet(joined) %>%
addPolygons(stroke = TRUE, color="white", weight=1, smoothFactor = 0.2, fillOpacity = .8, fillColor = ~factpal(Group)) %>%
  addTiles() %>%
  addLegend(pal = factpal, values=c("Emitter", "Isolated", "Receiver", "Transit"))
