#
# This is the server logic of a Shiny web application.
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {

  output$year1 <- reactive(input$sliderYear[1])
  output$year2 <- reactive(input$sliderYear[2])
  
    #revenue data plot slider
    revenuedata <- fedgovrevtype
    makeReactiveBinding("revenuedata")
    
    newRevenueData <- reactive({
      input$sliderYear
      isolate({
        revenuedata <- fedgovrevtype
        revenuedata <- filter(fedgovrevtype, Year>=input$sliderYear[1], Year<=input$sliderYear[2])
      })
    })
    

    #devex data plot slider
    devexdata <- fedgovdevextype
    makeReactiveBinding("devexdata")
    
    newDevexData <- reactive({
      input$sliderYear
      isolate({
        devexdata <- fedgovdevextype
        devexdata <- filter(fedgovdevextype, Year>=input$sliderYear[1], Year<=input$sliderYear[2])
      })
    })
    

    #opex data plot 
    opexdata <- fedgovopextype
    makeReactiveBinding("opexdata")
    
    newOpexData <- reactive({
      input$sliderYear
      isolate({
        opexdata <- fedgovopextype
        opexdata <- filter(fedgovopextype, Year>=input$sliderYear[1], Year<=input$sliderYear[2])
      })
    })
    
    output$opexplot <- renderPlot({
      opexdata <- newOpexData()
      opexplot <- ggplot(data=opexdata, aes(x=Year, y=Value, colour=Type)) + geom_line()
      return(opexplot)
    })
    
    #revenue plot
      output$revenueplot <- renderPlot({
      revenuedata <- newRevenueData()
      revenueplot <- ggplot(data=revenuedata, aes(x=Year, y=Value, colour=Type)) + geom_line()
      return(revenueplot)
      
    })
    
    

    #devex data plot
      output$devexplot <- renderPlot({
      devexdata <- newDevexData()
      devexplot <- ggplot(data=devexdata, aes(x=Year, y=Value, colour=Type)) + geom_line()
      return(devexplot)
    })
    
    
    #opex data plot
      output$opexplot <- renderPlot({
      opexdata <- newOpexData()
      opexplot <- ggplot(data=opexdata, aes(x=Year, y=Value, colour=Type)) + geom_line()
      return(opexplot)
    })
    

    
  })
