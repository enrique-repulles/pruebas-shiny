library(shiny)
shinyUI(fluidPage(
    titlePanel("Mi ejemplo 1"),
    sidebarLayout(
      sidebarPanel(
          sliderInput("bins","Numeor de bins", min=-1, max=5, value=3)
      ),
      
      
      
      
      mainPanel(
        plotOutput("distPlot")
      )
    )
    
))
        
