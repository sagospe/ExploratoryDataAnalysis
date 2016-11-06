## Course Project 2 for Exploratory Data Analysis

## Plot 1

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./FNEI_data/Source_Classification_Code.rds")


## Drawing Plot 1

## Have total emissions from PM2.5 decreased in the United States from 
## 1999 to 2008? Using the base plotting system, make a plot showing the total 
## PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.


## Loading needed libraries
library(dplyr)

## Transforming column Year in a factor
NEI$year = factor(NEI$year)

## Getting the data
## Due to amount of Emissions is high we're using tons unit
NEI_total <- group_by(NEI, year) %>% 
        summarise(total.Emissions.million.tons = sum(Emissions)/1000000)

## Drawing the plot

barplot(NEI_total$total.Emissions.million.tons,
        main=expression("Total emissions from PM"[2.5]*" in the United States"),
        xlab="Years",
        ylab=expression("Amount of PM"[2.5]*" emitted, in million tons"),
        names.arg=NEI_total$year)


# Making png file
dev.copy(png, file = "plot1.png")
dev.off()