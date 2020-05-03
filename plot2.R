#
library(dplyr)
library(data.table)

setwd("C:/Users/chris/Desktop/Coursera/ExplortoryAnalysis/wk4_project_files")

## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Initial look at the data
head(NEI)
dim(NEI) # records 6497651 rows 6 columns
str(NEI)
#
head(SCC)
dim(SCC) # records 11717 rows and 15 columns
str(NEI)

# Aggregate/summarise the data

baltimore.emissions <- summarise(group_by(filter(NEI, fips == "24510"),year), Emissions = sum(Emissions))

#Create bar plot for the data

png('plot2.png')

barplot(height=baltimore.emissions$Emissions/1000, names.arg=baltimore.emissions$year, xlab="years",
        ylab="Emissions Levels", main= "Baltimore City Emmission for 1999 thru 2008")

dev.off()

