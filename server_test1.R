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
      opexplot <- ggplot(data=opexdata, aes(x=Year, y=Value, colour=Type, c("checkgovrev", input$variable))) + geom_line()
      return(opexplot)
    })
    
    if (input$checkbox == c("checkgovrev")){
      #revenue plot
      output$revenueplot <- renderPlot({
        revenuedata <- newRevenueData()
        revenueplot <- ggplot(data=revenuedata, aes(x=Year, y=Value, colour=Type, c("checkgovrev", input$variable))) + geom_line()
        return(revenueplot)
        
      })
    }
    
    else if (input$checkbox == c("checkgovdevex")){
      
      #devex data plot
      output$devexplot <- renderPlot({
        devexdata <- newDevexData()
        devexplot <- ggplot(data=devexdata, aes(x=Year, y=Value, colour=Type, c("checkgovrev", input$variable))) + geom_line()
        return(devexplot)
      })
    }
    
    else if (input$checkbox == c("checkgovopex")){
      #opex data plot
      output$opexplot <- renderPlot({
        opexdata <- newOpexData()
        opexplot <- ggplot(data=opexdata, aes(x=Year, y=Value, colour=Type, c("checkgovrev", input$variable))) + geom_line()
        return(opexplot)
      })
    }
    
  })










if (input$checkbox == c("checkgovrev")){
  #h3("Government Revenue")
  plotOutput("revenueplot", width=800)}

else if (input$checkbox == c("checkgovdevex")){
  #h3("Government Development Expenditure"),
  plotOutput("devexplot", width=800)}

else if (input$checkbox == c("checkgovopex")){
  #h3("Government Operating Expenditure"),
  plotOutput("opexplot", width=800)}

else
{
  h3("Invalid")
}
