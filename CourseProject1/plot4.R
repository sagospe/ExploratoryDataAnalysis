# Week 1

################################################################################
# Drawing Plot 4
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

# setting the canvas
par(mfrow = c(2, 2))


# drawing plot 1,1
with(household_filtered, 
     plot(DateTime, Global_active_power, type="l", xlab = "",
          ylab = "Global Active Power (kilowatts)"))

# drawing plot 2,1
with(household_filtered, 
     plot(DateTime, Voltage, type="l", xlab = "datetime",
          ylab = "Voltage"))

# drawing plot 1,2
with(household_filtered, 
     plot(DateTime, Sub_metering_1, type="l", xlab = "", col = "black",
          ylab = "Energy Sub Metering"))
with(household_filtered, 
     lines(DateTime, Sub_metering_1, type="l", xlab = "", col = "black",
           ylab = "Energy Sub Metering"))
with(household_filtered, 
     lines(DateTime, Sub_metering_2, type="l", xlab = "", col = "red",
           ylab = "Energy Sub Metering"))
with(household_filtered, 
     lines(DateTime, Sub_metering_3, type="l", xlab = "", col = "blue",
           ylab = "Energy Sub Metering"))

legend("topright", 
       lty = c(1,1,1),
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n",
       cex = 0.6)



# drawing plot 2,2
with(household_filtered, 
     plot(DateTime, Global_reactive_power, type="l", xlab = "datetime"))




# saving the png file in home directory
dev.copy(png, file = "plot4.png", width = 480, height = 480) 
dev.off()
