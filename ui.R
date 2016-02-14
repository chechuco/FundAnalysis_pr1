library(shiny)
library(ggplot2)
library(googleVis)

# Get data (run in local computer)
Products <- read.csv("AllProducts12M_pr1.csv", header=FALSE, na.strings = c("N/A", "\\N"))
colnames(Products) <- c("Fecha", "ID", "ISIN", "Product", "AssetClass_1", "AssetClass_2", "Type", "Currency", "Price", "AuM", "SPX", "US10Y")
Products$Fecha <- as.Date(Products$Fecha)

shinyUI(pageWithSidebar(
  headerPanel("Financial products explorer"),
  sidebarPanel(
    selectInput("dataset", "Choose a dataset:",
        choices = c("Products", "pressure", "cars"))
    ),
    mainPanel(
      htmlOutput("view")
    )
))