library(shiny)
library(plotly)
library(dplyr)
library(tidyr)

inidata <- read.table(file = "SeaTemps.txt", header=TRUE,sep=",")

shinyServer(
    function(input, output) {
        output$plot1 <- renderPlotly({
            workdata <- inidata %>%
                filter(Year==input$iYear) %>%
                select(-Year) %>%
                gather(Depth,Temperature,-Month) %>%
                mutate(Month=factor(Month, levels = month.name))
            plot_ly(workdata,x=~Month,y=~Temperature,color=~Depth,type = "bar")
        })
    }
)