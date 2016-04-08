# Nutzung von GeoDaten in den Sozialwissenschaften
# Slides F2 - choroplethr
# Jan-Philipp Kolb
# Fri Apr 08 07:50:07 2016

## ----warning=F,message=F,echo=F------------------------------------------
library("choroplethr")
data(df_pop_state)

## ----echo=F,eval=internet------------------------------------------------
library("choroplethrMaps")

## ------------------------------------------------------------------------
library("choroplethrMaps")

## ----echo=F--------------------------------------------------------------
head(df_pop_state)

## ---- fig.width=8, fig.height=6------------------------------------------
state_choropleth(df_pop_state)

## ---- fig.width=8, fig.height=6------------------------------------------
state_choropleth(df_pop_state, title="2012 US State Population Estimates", legend="Population")

## ---- fig.width=8, fig.height=6------------------------------------------
state_choropleth(df_pop_state,
                 title      = "2012 Population Estimates",
                 legend     = "Population",
                 num_colors = 1,
                 zoom       = c("california", "washington", "oregon"))

## ----eval=F--------------------------------------------------------------
?df_pop_county
?county_choropleth

## ---- fig.width=8, fig.height=6------------------------------------------
data(df_pop_county)
county_choropleth(df_pop_county)

## ---- fig.width=8, fig.height=6------------------------------------------
data(df_pop_country)
country_choropleth(df_pop_country,
              title      = "2012 Population Estimates",
              legend     = "Population",
              num_colors = 1,
              zoom       = c("united states of america",
                             "mexico", "canada"))

## ----cache=T,warning=F,message=F, fig.width=8, fig.height=6--------------
library(choroplethr)
library(WDI) 
choroplethr_wdi(code="SP.POP.TOTL", year=2012, 
                title="2012 Population", 
                num_colors=1)

## ----warning=F,message=F, fig.width=8, fig.height=6----------------------
library(WDI) 
choroplethr_wdi(code="SP.DYN.LE00.IN", year=2012,
                title="2012 Life Expectancy")

## ----cache=T-------------------------------------------------------------
data(df_president_ts)

## ----eval=F--------------------------------------------------------------
?df_president_ts

## ------------------------------------------------------------------------
df_president_ts[1:8,1:8]

## ------------------------------------------------------------------------
citation("choroplethr")

