Products <- read.csv("FundAnalysis_pr1.csv", header=FALSE, na.strings = c("N/A", "\\N"))
colnames(Products) <- c("Fecha", "ISIN", "Product", "AssetClass_2", "Currency", "Price", "AuM", "SPX", "US10Y")
Products$Fecha <- as.Date(Products$Fecha)