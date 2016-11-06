## Course Project 2 for Exploratory Data Analysis

## Plot 2

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./FNEI_data/Source_Classification_Code.rds")


## Drawing Plot

## Have total emissions from PM2.5 decreased in the Baltimore City, 
## Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999to 2008? Use the base plotting system to make a plot answering this question.

## Loading needed libraries
library(dplyr)

## Transforming column Year in a factor
NEI$year = factor(NEI$year)

## Getting the data
NEI_Baltimore <- filter(NEI, fips == "24510") %>% 
        group_by(year) %>% 
        summarise(total.Emissions.tons = sum(Emissions))

## Drawing the plot
barplot(NEI_Baltimore$total.Emissions.tons,
        main=expression("Total emissions from PM"[2.5]*" in the Baltimore City, Maryland"),
        xlab="Years",
        ylab=expression("Amount of PM"[2.5]*" emitted, in tons"),
        names.arg=NEI_Baltimore$year)


# Mak,
        col = "blue"ing png file
dev.copy(png, file = "plot2.png")
dev.off()
