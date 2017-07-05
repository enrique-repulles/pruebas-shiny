myGadgetFunc <- function(inputValue1, inputValue2) {
  ui <- miniPage(
    gadgetTitleBar("My Gadget"),
    miniContentPanel(
      # Define layout, inputs, outputs
    )
  )
  
  server <- function(input, output, session) {
    # Define reactive expressions, outputs, etc.
    
    # When the Done button is clicked, return a value
    observeEvent(input$done, {
      returnValue <- ...
      stopApp(returnValue)
    })
  }
  
  runGadget(ui, server)
  
  
}


myGadgetFunc()


library(shiny)
library(miniUI)
library(ggplot2)

ggbrush <- function(data, xvar, yvar) {
  
  ui <- miniPage(
    gadgetTitleBar("Drag to select points"),
    miniContentPanel(
      # The brush="brush" argument means we can listen for
      # brush events on the plot using input$brush.
      plotOutput("plot", height = "100%", brush = "brush")
    )
  )
  
  server <- function(input, output, session) {
    
    # Render the plot
    output$plot <- renderPlot({
      # Plot the data with x/y vars indicated by the caller.
      ggplot(data, aes_string(xvar, yvar)) + geom_point()
    })
    
    # Handle the Done button being pressed.
    observeEvent(input$done, {
      # Return the brushed points. See ?shiny::brushedPoints.
      stopApp(brushedPoints(data, input$brush))
    })
  }
  
  runGadget(ui, server)
}



ggbrush(mtcars, "hp", "mpg")
