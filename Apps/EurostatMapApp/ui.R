
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("GDP Europe"),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("map")
    )
  )
)
