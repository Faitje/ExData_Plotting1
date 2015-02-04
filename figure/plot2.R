# This script creates plot 2

# Load the data
powerData <- read.csv("powerData.csv", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "character"))

# Set the correct date & time formats
if(!require(lubridate)){
        install.packages("lubridate") 
}
library(lubridate)

powerData$Date_Time <- ymd_hms(powerData$Date_Time)

# Open PNG device
png(filename='plots/plot2.png')

# Make plot, 480x480 is the standard size
plot(powerData$Date_Time, powerData$Global_active_power, 
     ylab='Global Active Power (kilowatts)',
     xlab='',
     type = "l")

# Turn off PNG device
dev.off()