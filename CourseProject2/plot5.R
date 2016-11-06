## Course Project 2 for Exploratory Data Analysis

## Plot 5

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./FNEI_data/Source_Classification_Code.rds")


## Drawing Plot

## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## Loading needed libraries
library(dplyr)
library(ggplot2)

## Transforming column Year in a factor
NEI$year = factor(NEI$year)

## Getting the data for emissions from motor vehicle sources & specific counties
SCC.vehicles <- SCC[grepl("vehicle", SCC$Short.Name, ignore.case = TRUE) |
                            grepl("motorcycle", SCC$Short.Name, ignore.case = TRUE), ]
NEI.Baltimore <- NEI[NEI$fips == "24510", ] ## 24510 == Baltimore City, Maryland

## Created a merged data frame
NEI.merged <- merge(NEI.Baltimore, SCC.vehicles, by.x = "SCC", by.y = "SCC")
n 
## Grouping by year, and getting the sum of each group (year)
NEI.Baltimore.LosAngeles.vehicle <- group_by(NEI.merged, year) %>% 
        summarise(total.Emissions.tons = sum(Emissions))

## Drawing the plot
png(filename = "plot6.png")

qplot(year, 
      data = NEI.Baltimore.vehicle, 
      geom = "bar", 
      weight = total.Emissions.tons, 
      main = expression("Total emissions from PM"[2.5]*" for motor vehicle sources in Baltimore City, Maryland"),
      xlab = "Years",
      ylab = expression("Amount of PM"[2.5]*" emitted, in tons"))

# king png file
dev.off()
