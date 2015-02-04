# This script creates plot 4

# Load the data
powerData <- read.csv("powerData.csv", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "character"))

# Set the correct date & time formats
if(!require(lubridate)){
        install.packages("lubridate") 
}
library(lubridate)

powerData$Date_Time <- ymd_hms(powerData$Date_Time)

# Open PNG device
png(filename='plots/plot4.png')

# Make plots
par(mfrow = c(2,2))
with(powerData, {
        
        # Top Left
        plot(Date_Time, Global_active_power,
             ylab='Global Active Power (kilowatts)',
             xlab='',
             type = "l")
        
        # Top Right
        plot(Date_Time, Voltage,  
             xlab='datetime',
             type = "l")
        
        # Bottom Left
        plot(Date_Time, Sub_metering_1,  
                             type = "l", 
                             ylab='Energy sub metering',
                             xlab='')
        lines(Date_Time, Sub_metering_2, col ="red")
        lines(Date_Time, Sub_metering_3, col ="blue")
        legend("topright", lty='solid' , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        # Bottom Right
        plot(Date_Time, Global_reactive_power, 
             xlab='datetime',
             type = "l")     
})

# Turn off PNG device
dev.off()

