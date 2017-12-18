#
# This is the server logic of a Shiny web application.
#

library(shiny)
library(ggplot2)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {

  output$year1 <- reactive(input$sliderYear[1])
  output$year2 <- reactive(input$sliderYear[2])
  
    #revenue data sum & plot
    revenuedata <- fedgovrevtype
    makeReactiveBinding("revenuedata")
    
    #sum revenue total based on years selected
    sumRevenueTotal <- reactive({
      input$sliderYear
      isolate({
        sumrevenuedata <- filter(fedgovrevtype, Year>=input$sliderYear[1], Year<=input$sliderYear[2])
        sumrevenuedata <- sum(sumrevenuedata$Value)
      })
    })

    output$revenuetotal <- renderText(formatC(sum(sumRevenueTotal()), format="d", big.mark = ","))

    #sum revenue type total based on years selected
    sumRevenueTable <- reactive({
      input$sliderYear
      isolate({
        sumrevenuedata <- filter(fedgovrevtype, Year>=input$sliderYear[1], Year<=input$sliderYear[2])
        
        sumrevenuedata <- sumrevenuedata %>% 
          group_by(Type) %>% 
          summarise(Value = formatC(sum(Value),format="d", big.mark=","))
      })
    })
    
    output$revenuetotaltable <- renderTable(sumRevenueTable(), align="r")
    
    newRevenueData <- reactive({
      input$sliderYear
      isolate({
        revenuedata <- fedgovrevtype
        revenuedata <- filter(fedgovrevtype, Year>=input$sliderYear[1], Year<=input$sliderYear[2])
      })
    })
    
    output$revenueplot <- renderPlot({
      revenuedata <- newRevenueData()
      revenueplot <- ggplot(data=revenuedata, aes(x=Year, y=Value, colour=Type)) + geom_line()
      return(revenueplot)
    })

    #devex data sum & plot 
    devexdata <- fedgovdevextype
    makeReactiveBinding("devexdata")
    
    #sum devex total based on years selected
    sumDevexTotal <- reactive({
      input$sliderYear
      isolate({
        sumdevexdata <- filter(fedgovdevextype, Year>=input$sliderYear[1], Year<=input$sliderYear[2])
        sumdevexdata <- sum(sumdevexdata$Value)
      })
    })
    
    output$devextotal <- renderText(formatC(sum(sumDevexTotal()), format="d", big.mark = ","))
    
    #sum devex type total based on years selected
    sumDevexTable <- reactive({
      input$sliderYear
      isolate({
        sumdevexdata <- filter(fedgovdevextype, Year>=input$sliderYear[1], Year<=input$sliderYear[2])
        
        sumdevexata <- sumdevexdata %>% 
          group_by(Type) %>% 
          summarise(Value = formatC(sum(Value),format="d", big.mark=","))
      })
    })
    
    output$devextotaltable <- renderTable(sumDevexTable(), align="r")
    
    newDevexData <- reactive({
      input$sliderYear
      isolate({
        devexdata <- fedgovdevextype
        devexdata <- filter(fedgovdevextype, Year>=input$sliderYear[1], Year<=input$sliderYear[2])
      })
    })
    
    output$devexplot <- renderPlot({
      devexdata <- newDevexData()
      devexplot <- ggplot(data=devexdata, aes(x=Year, y=Value, colour=Type)) + geom_line()
      return(devexplot)
    })

    #opex data sum & plot 
    opexdata <- fedgovopextype
    makeReactiveBinding("opexdata")
    
    #sum opex total based on years selected
    sumOpexTotal <- reactive({
      input$sliderYear
      isolate({
        sumopexdata <- filter(fedgovopextype, Year>=input$sliderYear[1], Year<=input$sliderYear[2])
        sumopexdata <- sum(sumopexdata$Value)
      })
    })
    
    output$opextotal <- renderText(formatC(sum(sumOpexTotal()), format="d", big.mark = ","))
    
    #sum opex type total based on years selected
    sumOpexTable <- reactive({
      input$sliderYear
      isolate({
        sumopexdata <- filter(fedgovopextype, Year>=input$sliderYear[1], Year<=input$sliderYear[2])
        
        sumopexdata <- sumopexdata %>% 
          group_by(Type) %>% 
          summarise(Value = formatC(sum(Value),format="d", big.mark=","))
      })
    })
    
    output$opextotaltable <- renderTable(sumOpexTable(), align="r")
    
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
    
  })
