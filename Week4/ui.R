library(shiny)
library(plotly)

shinyUI(pageWithSidebar(
    headerPanel("Select year"),
    sidebarPanel(sliderInput("iYear", 'Year',value = 2017, min = 2000, max = 2017, sep="")),
    mainPanel(plotlyOutput('plot1'))
    )
)