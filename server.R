library(googleVis)

shinyServer(function(input, output) {
   assetClass_2Input <- reactive({
     switch(input$assetClass_2,
        "All" = Products[!duplicated(Products),],
        "Short term" = Products[Products$AssetClass_2 == "RF Corto plazo",],
        "Corporate" = Products[Products$AssetClass_2 == "RF Corporativa",],
        "Flexible EUR" = Products[Products$AssetClass_2 == "RF Flexible EUR",],
        "Flexible others" = Products[Products$AssetClass_2 == "RF Flexible Otros",],
        "High Yield" = Products[Products$AssetClass_2 == "RF High Yield",],
        "Emerging" = Products[Products$AssetClass_2 == "RF Emergente",],
        "Others" = Products[Products$AssetClass_2 == "RF Otros",])
   })

  output$view <- renderGvis({
     #gvisScatterChart(datasetInput())
    gvisMotionChart(assetClass_2Input(), idvar = "ISIN", timevar = "Fecha", xvar = "US10Y", yvar = "Price", sizevar = "AuM", colorvar = "AssetClass_2", date.format = "%Y%m%d")
  })
})



