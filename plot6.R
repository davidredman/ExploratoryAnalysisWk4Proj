#
library(dplyr)
library(ggplot2)
library(data.table)

setwd("C:/Users/chris/Desktop/Coursera/ExplortoryAnalysis/wk4_project_files")

## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Initial look at the data
head(NEI)
dim(NEI) # records 6497651 rows 6 columns
str(NEI)
head(SCC)
dim(SCC) # records 11717 rows and 15 columns
str(NEI)

# subset the data  California fips == 06037

veh <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehSCC <- SCC[vehicles,]$SCC
vehNEI <- NEI[NEI$SCC %in% vehSCC,]



# Subset the vehicles NEI data by each city's fip and add city name.

vehBalNEI <- vehNEI[vehNEI$fips=="24510",]
vehBalNEI$city <- "Baltimore City"
vehLANEI <- vehNEI[vehNEI$fips=="06037",]
vehLANEI$city <- "Los Angeles County"


# Combine the two subsets with city name into one data frame
bothNEI <- rbind(vehBalNEI,vehLANEI)


png("plot6.png",width=480,height=480)

gsubc1  <- ggplot(bothNEI,aes(factor(year),Emissions)) +
    
    geom_bar(aes(fill=year),stat="identity") +
    facet_grid(scales="free", space="free", .~city) +
    guides(fill=FALSE) + theme_bw() +
    labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
    labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))


print(gsubc1)

dev.off()

