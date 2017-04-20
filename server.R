library(shiny)

shinyServer(function(input, output) {
  output$tableOut <- renderTable({
    head(cars,4)
  })
  output$verbatimOut <- renderText({
    paste(input$text, input$slider, input$action, sep = ", ")
  })
})
