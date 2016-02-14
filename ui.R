library(shiny)
library(ggplot2)
library(googleVis)

#Get data
Products <- read.csv("ProductFeatures_pr1.csv", header=FALSE)
colnames(Products) <- c("Product", "AssetClass_1", "AssetClass_2", "Type", "Currency", "IsComplex", "TER")

dataset <- Products

fluidPage(
  
  titlePanel("Funds Analysis"),
  
  sidebarPanel(
    
    sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                value=min(19, nrow(dataset)), step=5, round=0),
    
    selectInput('x', 'X', names(dataset)),
    selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
    selectInput('color', 'Color', c('None', names(dataset))),
    
    checkboxInput('jitter', 'Jitter'),
    checkboxInput('smooth', 'Smooth'),
    
    selectInput('facet_row', 'Facet Row', c(None='.', names(dataset))),
    selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)))
  ),
  
  mainPanel(
    plotOutput('plot')
  )
)