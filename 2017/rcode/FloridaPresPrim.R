# The following code is from this blog post:
# http://www.arilamstein.com/blog/2016/03/21/mapping-election-results-r-choroplethr/

# Load required packages
library(ggplot2)
library(dplyr)
library(reshape2)
library(choroplethr)
library(choroplethrMaps)
library(gridExtra)
library(knitr)

# Read election results file from the web, and strip the white spaces
fl <- read.delim("http://fldoselectionfiles.elections.myflorida.com/enightfilespublic/20160315_ElecResultsFL.txt", strip.white = T)

# Filter leaving only one party, and select desired columns
dem <- filter(fl, PartyCode == "DEM") %>% select(CountyName, CanNameLast, CanVotes)

# Cast dem dataframe from long to wide using dcast
dem_cast <- dcast(dem, CountyName ~ CanNameLast, sum)  # Now we can see each candidate's votes per county
colnames(dem_cast)[3] <- "OMalley" # Remove apostrophe from O'Malley

# Change CountyName column from Factor to lowercase Character
dem_cast$CountyName <- tolower(as.character(dem_cast$CountyName))

# Create columns for total votes in each county
dem_cast <- mutate(dem_cast, total = Clinton + OMalley + Sanders)

# Create columns for percentage variables
dem_cast <- mutate(dem_cast, hc = (Clinton/total)*100, bs = (Sanders/total)*100, mo = (OMalley/total)*100)
dem_cast[,6:8] <- round(dem_cast[,6:8], digits = 1)  # Round new variables to 1 decimal place

# Read county.regions dataframe supplied by choroplethrMaps package
data("county.regions")

# Filter leaving only florida counties, and select only the 2 needed columns
fl.regions <- filter(county.regions, state.name == "florida") %>% select(region, "CountyName" = county.name)

# Join regions column from fl.regions dataframe to election results dataframe
df <- left_join(dem_cast, fl.regions)

bs.counties <- filter(df, Sanders > Clinton & Sanders > OMalley)
# kable(bs.counties, caption = "Counties won by Sanders")

hc.counties <- filter(df, Clinton > Sanders & Clinton > OMalley)
# kable(hc.counties, caption = "Counties won by Clinton")

# For each candidate, map the percent of each counties' total vote using choroplethr package
df$value = df$bs  # Set the desired 'value' column for choroplethr
choro_bs = county_choropleth(df, state_zoom="florida", legend = "%", num_colors=1) +
  ggtitle("Bernie Sanders") +
  coord_map()  # Adds a Mercator projection

choro_bs

df$value = df$hc  # Set the desired 'value' column for choroplethr
choro_hc = county_choropleth(df, state_zoom="florida", legend = "%", num_colors=1) +
  ggtitle("Hillary Clinton") +
  coord_map()
choro_hc

df$value = df$mo  # Set the desired 'value' column for choroplethr
choro_mo = county_choropleth(df, state_zoom="florida", legend = "%", num_colors=1) +
  ggtitle("Martin O'Malley") +
  coord_map()
choro_mo

# Plot all three maps in a grid
grid.arrange(choro_hc, choro_bs, choro_mo, ncol=3, top = "Florida Democratic Primary 2016\n Percent of Total Votes by County\n ")

# Function for highlighting a county
highlight_county = function(county_fips)
{
  library(choroplethrMaps)
  data(county.map, package="choroplethrMaps", envir=environment())
  df = county.map[county.map$region %in% county_fips, ]
  geom_polygon(data=df, aes(long, lat, group = group), color = "yellow", fill = NA, size = 0.5)
}
# Filter counties won by Sanders
bs.counties <- filter(df, Sanders > Clinton & Sanders > OMalley)

# Create list of counties won
bs.fips <- bs.counties[[9]]

# Map using the highlight_county() function after calling county_choropleth()
df$value = df$bs  # Set the desired 'value' column for choroplethr
choro_bs = county_choropleth(df, state_zoom="florida", legend = "%", num_colors=1) +
  highlight_county(bs.fips) +  # Highlight counties won
  ggtitle("Bernie Sanders") +
  coord_map()  # Adds a Mercator projection
choro_bs

# Add a new column to show each county's winner
df$winner <- as.factor(ifelse(df$hc > df$bs, "Clinton", "Sanders"))

# Plot of winner by county</div>
df$value = df$winner  # Set the desired 'value' column for choroplethr
choro_winner = county_choropleth(df, state_zoom="florida", legend = "Winner", num_colors=2) +
  ggtitle("Florida Presidential Primary\n 15 March 2016") +
  coord_map()


choro_winner
