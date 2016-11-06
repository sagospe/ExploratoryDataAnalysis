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

## Getting the data for emissions from coal combusion-related
SCC.coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE) &
        grepl("comb", SCC$Short.Name, ignore.case = TRUE), ]

NEI.merged <- merge(NEI, SCC.coal, by.x = "SCC", by.y = "SCC")

NEI.coal <- group_by(NEI.merged, year) %>% 
        summarise(total.Emissions.tons = sum(Emissions)/1000)

## Drawing the plot
png(filename = "plot4.png")

qplot(year, 
      data = NEI.coal, 
      geom = "bar", 
      weight = total.Emissions.tons, 
      main = expression("Total emissions from PM"[2.5]*" for coal combustion-related in USA"),
      xlab = "Years",
      ylab = expression("Amount of PM"[2.5]*" emitted, in thousands tons"))

# king png file
dev.off()
