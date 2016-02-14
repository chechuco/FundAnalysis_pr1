library(shiny)
library(googleVis)

# Get data (run in local computer)
Products <- read.csv("FundAnalysis_pr1.csv", header=FALSE, na.strings = c("N/A", "\\N"))
colnames(Products) <- c("Fecha", "ISIN", "Product", "AssetClass_2", "Currency", "Price", "AuM", "SPX", "US10Y")
Products$Fecha <- as.Date(Products$Fecha)

shinyUI(pageWithSidebar(
  headerPanel("PIMCO Fixed Income Funds Explorer"),
  sidebarPanel(
    selectInput("assetClass_2", "Choose an asset class:",
        choices = c("All", "Short term", "Corporate", "Flexible EUR", "Flexible others", "High Yield", "Emerging", "Others"))
    ),
    mainPanel(
      htmlOutput("view")
    )
))