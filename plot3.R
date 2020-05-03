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

# subset the data

#subNEI <- NEI[NEI$fips == "24510",]

#balbytype <- aggregate(Emissions~year + type, data = subNEI, sum) 

balbytype <- summarise(group_by(filter(NEI, fips=="24510"), year, type), Emissions = sum(Emissions))

#Create ggplot for the data
png("plot3.png",width=640,height=480, bg = "transparent")


baltypeCH <- ggplot(balbytype,aes(x=factor(year), y=Emissions, fill = type, label = round(Emissions, 2))) +
            geom_bar(stat="identity")+
            facet_grid(.~type)+
            xlab("year")+
            ylab(expression("Total PM "[2.5]*"  emission in tons"))+
            ggtitle(expression("PM" [2.5]*paste(" Emissions in Baltimore City, Maryland from 1999 to 2008",
                    sep = "")))+
            geom_label(aes(fill = type, colours = "black", fontface ="bold"))

print(baltypeCH)

dev.off()

