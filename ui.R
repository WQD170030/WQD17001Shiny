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
       checkboxInput("checkgovrev", "Show Reveneu", TRUE),
       checkboxInput("checkgovdevex", "Show Development Expenditure", FALSE),
       checkboxInput("checkgovopex", "Show Opex", FALSE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      span(),
      h2("MOF data for the years ", textOutput("year1", inline = TRUE)," to ",textOutput("year2", inline = TRUE)),

      h3("Government Revenue"),
      plotOutput("revenueplot", width=800),
      
      h3("Government Development Expenditure"),
      plotOutput("devexplot", width=800),
      
      h3("Government Operating Expenditure"),
      plotOutput("opexplot", width=800)
    )
  )
))
