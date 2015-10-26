
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(tmap)
library(shiny)
GDP <- readRDS("data/EurostatGDP.rds")

data(Europe)
ind <- match(Europe@data$name,GDP$geo)
Europe@data$GDP <- as.numeric(GDP$X2012Q3[ind])

shinyServer(function(input,output) {

  output$map <- renderPlot({
    
    qtm(Europe,"GDP")
  })

})
