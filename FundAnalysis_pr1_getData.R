## Open libraries
library(googleVis)
library(scales)

# Set the root path.
#path <- "./FundAnalysis_pr1/"

# Get and clean data
#funds <- read.csv(paste0(path, "FundAnalysis_pr1.csv"), header=TRUE)
Funds <- read.csv("FundAnalysis_pr1.csv", header=FALSE)
colnames(Funds) <- c("Fecha", "Date", "ISIN", "Fund", "AssetClass_2", "Currency", "Price", "AuM", "SPX", "US10Y")
Funds$Fecha <- as.Date(Funds$Fecha,format='%m/%d/%Y')

#Plot the chart
Motion=gvisMotionChart(Funds, idvar = "ISIN", timevar = "Fecha", xvar = "US10Y", yvar = "Price", colorvar = "AssetClass_2", date.format = "%Y%m%d")
plot(Motion)
