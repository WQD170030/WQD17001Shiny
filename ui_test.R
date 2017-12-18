#
# This is the user-interface definition of a Shiny web application. You can
#

library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Principle of Data Science"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("sliderYear","Choose Year",min = 1970 , max = 2017, value = c(1990,2010)),
       checkboxGroupInput("variable", "Choose Graph",
                          c("Show Revenue" = "checkgovrev",
                            "Show Development Expenditure" = "checkgovdevex",
                            "Show Opex" = "checkgovopex")
       )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      #span(),
      #h2("MOF data for the years ", textOutput("year1", inline = TRUE)," to ",textOutput("year2", inline = TRUE)),
      
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
      
        
    )
  )
))
