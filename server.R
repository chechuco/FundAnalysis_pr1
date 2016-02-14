library(googleVis)

shinyServer(function(input, output) {
   datasetInput <- reactive({
     switch(input$dataset,
        "Products" = Products,
        "pressure" = pressure,
        "cars" = cars)
   })

  output$view <- renderGvis({
     #gvisScatterChart(datasetInput())
    gvisMotionChart(datasetInput(), idvar = "ID", timevar = "Fecha", xvar = "US10Y", yvar = "Price", sizevar = "AuM", colorvar = "AssetClass_1", date.format = "%Y%m%d")
  })
})