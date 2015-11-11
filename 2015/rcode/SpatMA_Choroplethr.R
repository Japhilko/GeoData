# Jan-Philipp Kolb
# Wed Nov 11 13:39:56 2015


## ----warning=F,message=F,echo=F------------------------------------------
library(choroplethr)
data(df_pop_state)

## ----echo=F,eval=Nint----------------------------------------------------
df_pop_state[1:10,]

## ------------------------------------------------------------------------
state_choropleth(df_pop_state)

## ------------------------------------------------------------------------
state_choropleth(df_pop_state, title="2012 US State Population Estimates", legend="Population")

## ------------------------------------------------------------------------
state_choropleth(df_pop_state,
                 title      = "2012 Population Estimates",
                 legend     = "Population",
                 num_colors = 1,
                 zoom       = c("california", "washington", "oregon"))

## ----eval=F--------------------------------------------------------------
?df_pop_county

?county_choropleth

## ------------------------------------------------------------------------
data(df_pop_county)

county_choropleth(df_pop_county)

## ------------------------------------------------------------------------
data(df_pop_country)

country_choropleth(df_pop_country,
                 title      = "2012 Population Estimates",
                 legend     = "Population",
                 num_colors = 1,
                 zoom       = c("united states of america", "mexico", "canada"))

## ----cache=T,warning=F,message=F-----------------------------------------
library(choroplethr)
library(WDI) 

choroplethr_wdi(code="SP.POP.TOTL", year=2012, title="2012 Population", num_colors=1)

## ----warning=F,message=F-------------------------------------------------
library(WDI) 
choroplethr_wdi(code="SP.DYN.LE00.IN", year=2012, title="2012 Life Expectancy")

## ----cache=T-------------------------------------------------------------
data(df_president_ts)

## ----eval=F--------------------------------------------------------------
?df_president_ts

## ----cache=F,echo=F,warning=F,eval=internet------------------------------
head(df_president_ts)

