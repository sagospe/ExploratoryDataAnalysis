# Week 1

################################################################################
# Drawing Plot 1
################################################################################


# Loading needed libraries
library(dplyr)


# loading data
household <- read.table("./data/household_power_consumption.txt", header = TRUE, 
                        colClasses = "character", sep = ";")
household_filtered <- filter(household, Date == "1/2/2007" | Date == "2/2/2007")
rm(household)

# drawing plot
with(household_filtered, hist(as.numeric(Global_active_power), col = "red", 
                              main = "Global Active Power", 
                              xlab = "Global Active Power (kilowatts)"))

# saving the png file in home directory
dev.copy(png, file = "plot1.png", width = 480, height = 480) 
dev.off()

