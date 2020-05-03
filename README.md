# ExploratoryAnalysisWk4Proj
Exploratory Analysis Week 4 Project


Assignment:
The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. 

This assignment looks at the fine particulate matter (PM2.5) which is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI).

For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. The data for this assignment are for 1999, 2002, 2005, and 2008.

Data for this project is at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip (29mb)

The zip file contains two files: PM2.5 Emissions Data summarySCC_PM25.rds and summarySCC_PM25.rds These file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year.  The data types are: 

- fips: A five-digit number (represented as a string) indicating the U.S. county
- SCC: The name of the source as indicated by a digit string (see source code classification table)
- Pollutant: A string indicating the pollutant
- Emissions: Amount of PM2.5 emitted, in tons
- type: The type of source (point, non-point, on-road, or non-road)
- year: The year of emissions recorded
