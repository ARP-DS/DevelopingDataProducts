library(shiny)
library(ggplot2)
library(dplyr)
library(tidyr)

inidata <- read.table(file = "SeaTemps.txt", header=TRUE,sep=",")

shinyServer(
    function(input, output) {
        output$plot2 <- renderPlot({
            workdata <- inidata %>%
                filter(Year==input$iYear) %>%
                select(-Year) %>%
                gather(Depth,Temperature,-Month)
            ggplot(workdata,aes(x=Depth,y=Temperature,group=1))+ geom_line()+ facet_wrap(.~ Month, ncol = 4)+ scale_x_discrete(labels= c("0", "-20", "-50", "-80"))
        })
    }
)