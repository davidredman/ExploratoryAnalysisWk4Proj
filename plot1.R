#
library(dplyr)
library(ggplot2)
library(scales)
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

total.emissions <- summarise(group_by(NEI, year), Emissions = sum(Emissions))

#Create bar plot for the data

png('plot1.png')

barplot(height=total.emissions$Emissions/1000, names.arg=total.emissions$year, xlab="years",
        ylab="Emissions Levels", main= "Emmission for 1999 thru 2008")

dev.off()

