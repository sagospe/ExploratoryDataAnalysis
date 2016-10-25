# Week 1

################################################################################
# Drawing Plot 2
################################################################################


# Loading needed libraries
library(dplyr)


# loading data
household <- read.table("./data/household_power_consumption.txt", header = TRUE, 
                        colClasses = "character", sep = ";")
household_filtered <- filter(household, Date == "1/2/2007" | Date == "2/2/2007")
rm(household)

# creating date & time column
household_filtered$DateTime <- strptime(paste(household_filtered$Date, 
                                              household_filtered$Time),
                                        format="%d/%m/%Y %H:%M:%S")
# drawing plot
with(household_filtered, 
     plot(DateTime, Global_active_power, type="l", xlab = "",
          ylab = "Global Active Power (kilowatts)"))

# saving the png file in home directory
dev.copy(png, file = "plot2.png", width = 480, height = 480) 
dev.off()
