# This script creates plot 3

# Load the data
powerData <- read.csv("powerData.csv", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "character"))

# Set the correct date & time formats
if(!require(lubridate)){
        install.packages("lubridate") 
}
library(lubridate)

powerData$Date_Time <- ymd_hms(powerData$Date_Time)

# Open PNG device
png(filename='plots/plot3.png')

# Make plot, 480x480 is the standard size
with(powerData, plot(Date_Time, Sub_metering_1,  
                     type = "l", 
                     ylab='Energy sub metering',
                     xlab=''))
with(points(powerData$Date_Time, powerData$Sub_metering_2, type = "l", col ="red"))
with(points(powerData$Date_Time, powerData$Sub_metering_3, type = "l", col ="blue"))
legend("topright", lty='solid' , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Turn off PNG device
dev.off()
