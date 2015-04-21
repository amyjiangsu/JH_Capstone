library(shiny)
source("LoadModel.R")

shinyServer(
  function(input, output) {
    input.new   <- reactive({
        input$inputString
    })
    
    output$textOutput <- renderPrint({
        prediction = predict.word(input.new())
        cat(as.character(prediction$pred1), "   ", as.character(prediction$pred2), "   ", as.character(prediction$pred3))
    })
  }
)
