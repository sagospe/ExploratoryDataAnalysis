## Course Project 2 for Exploratory Data Analysis

## Plot 3

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./FNEI_data/Source_Classification_Code.rds")


## Drawing Plot

## Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonr
## oad) variable, which of these four sources have seen decreases in emissions from 1999–2008
## for Baltimore City? Which have seen increases in emissions from 1999–2008?
## Use the ggplot2 plotting system to make a plot answer this question.

## Loading needed libraries
library(dplyr)
library(ggplot2)

## Transforming column Year in a factor
NEI$year = factor(NEI$year)

## Getting the data
NEI_Baltimore <- filter(NEI, fips == "24510") %>% 
        group_by(year, type) %>% 
        summarise(total.Emissions.tons = sum(Emissions))

## Drawing the plot
png(filename = "plot3.png", width = 807, height = 342)

qplot(year, 
      data = NEI_Baltimore, 
      facets = . ~ type, 
      geom="bar", 
      weight=total.Emissions.tons, 
      main=expression("Total emissions from PM"[2.5]*
                              " in the Baltimore City, Maryland"),
      xlab="Years",
      ylab = expression("Amount of PM"[2.5]*" emitted, in tons"),
      fill = type)



# king png file
dev.off()
