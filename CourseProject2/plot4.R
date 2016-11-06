## Course Project 2 for Exploratory Data Analysis

## Plot 4

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./FNEI_data/Source_Classification_Code.rds")


## Drawing Plot

## Across the United States, how have emissions from coal combustion-related 
## sources changed from 1999–2008?

## Loading needed libraries
library(dplyr)
library(ggplot2)

## Transforming column Year in a factor
NEI$year = factor(NEI$year)

## Getting the data
NEI_total <-  group_by(data = NEI, year, type) %>% 
        summarise(total.Emissions.tons = sum(Emissions))

## Drawing the plot
png(filename = "plot4.png")

qplot(year, 
      data = NEI_total_coal, 
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
