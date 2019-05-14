library(ggplot2)
library(shiny)

inidata <- read.table(file = "SeaTemps.txt", header=TRUE,sep=",")

shinyServer(
    function(input, output) {
        output$plot3 <- renderPlot({
            temp <- inidata[inidata$Month==input$iMonth,]
            workdata <- data.frame(Year=temp$Year, Temperature=temp[,as.numeric(input$iDepth)])
            modelFit <- lm(Temperature~Year, data=workdata)
            predictedTemps <- round(predict(modelFit, newdata=data.frame(Year=2000:2040)),1)
            predictedData <- data.frame(Year=2000:2040, Temperature=predictedTemps)
            pr <- as.character(predictedData[predictedData$Year==input$iYear,2])
            prmessage <- paste0("Temperature predicted: ", pr, "C")
            ggplot(workdata, aes(Year, Temperature)) + geom_point(color="blue") + 
                geom_smooth(data=predictedData,aes(x=Year, y=Temperature), method = "lm",se=FALSE,color="red")+geom_vline(aes(xintercept=2017)) +geom_point(aes(x=input$iYear,y=predictedData[predictedData$Year==input$iYear,2]),color="red",lwd=5)+geom_text(x=2030,y=13,label=prmessage)+ylim(10,25)
        })
    }
)