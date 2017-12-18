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
       radioButtons("variable", "Choose Graph",
                          c("Show Revenue" = "checkgovrev",
                            "Show Development Expenditure" = "checkgovdevex",
                            "Show Opex" = "checkgovopex"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      span(),
      h2("MOF data for the years ", textOutput("year1", inline = TRUE)," to ",textOutput("year2", inline = TRUE)),

     
      conditionalPanel(
        condition = "input.variable == 'checkgovrev'",
        h3("Government Revenue"),
        h3("Total Revenue = RM ",textOutput("revenuetotal", inline = TRUE), "million"),
        tableOutput("revenuetotaltable"),
        plotOutput("revenueplot", width = 800)
      ),
      conditionalPanel(
        condition = "input.variable == 'checkgovdevex'",
        h3("Government Development Expenditure"),
        h3("Total Devex = RM ",textOutput("devextotal", inline = TRUE), "million"),
        tableOutput("devextotaltable"),
        plotOutput("devexplot", width=800)
      ),
      conditionalPanel(
        condition = "input.variable == 'checkgovopex'",
        h3("Government Operating Expenditure"),
        h3("Total Opex = RM ",textOutput("opextotal", inline = TRUE), "million"),
        tableOutput("opextotaltable"),
        plotOutput("opexplot", width=800)
      )
    )
  )
))
