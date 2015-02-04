# This script creates plot 1

# Load the data
powerData <- read.csv("powerData.csv")

# Open PNG device
png(filename='plots/plot1.png')

# Make plot, 480x480 is the standard size
hist(powerData$Global_active_power, 
     main='Global Active Power',
     xlab='Global Active Power (kilowatts)', 
     col='red')

# Turn off PNG device
dev.off()