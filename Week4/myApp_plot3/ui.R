library(shiny)
shinyUI(pageWithSidebar(
    headerPanel(""),
    sidebarPanel(
        radioButtons("iDepth", "Select depth expressed in meters",
                     choices = c("0" = 3, "-20"=4, "-50"=5, "-80"=6), selected = 3),
        selectInput("iMonth", "Select month", 
                    choices = list("January","Febrary","March","April", "May", "June",
                                   "July", "August",
                                   "September", "October","November","December"),
                    selected = "January", multiple = FALSE),
        sliderInput("iYear", 'Select year', value = 2018, min = 2018, max = 2040, sep="")
    ),
    mainPanel(
        plotOutput('plot3')
    )
))