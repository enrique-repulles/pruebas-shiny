
shinyServer(function (input, output) {
  
  
  salida <- renderPlot({ 
    x    <- faithful[, 2]  # Old Faithful Geyser data
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
    })
  
  output$distPlot<-salida
})
