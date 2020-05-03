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
mrg <- merge(NEI, SCC, by  = "SCC")

dim(mrg)
head(mrg)

c1  <- grepl("coal", mrg$Short.Name, ignore.case=TRUE)
subc1 <- mrg[c1, ]


png("plot4.png",width=480,height=480,units="px",bg="transparent")

gsubc1  <- ggplot(subc1,aes(factor(year),Emissions/10^5)) +
    
             geom_bar(stat="identity",fill="blue",width=0.75) +
             theme_classic() +  guides(fill=FALSE) +
             labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
             labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))
             ggtitle("Emissions from coal combustion-related sources in kilotons")+
             geom_label(aes(fill = year),colour = "white", fontface = "bold")


print(gsubc1)

dev.off()













