# This script prepares the data for all the plots
if (!file.exists("powerData.csv")) {
        
        # If you do not already have the data, download & unzip
        if (!file.exists('household_power_consumption.txt')) {
                download.file(paste0('https://d396qusza40orc.cloudfront.net/',
                                 'exdata%2Fdata%2Fhousehold_power_consumption.zip'),
                        method='curl', destfile='raw-power-data.zip')
                unzip('raw-power-data.zip')
        }
        
        # Load the data
        powerDataAll <- read.table("household_power_consumption.txt", 
                        header = TRUE,
                        sep = ";",
                        na.strings = "?",
                        colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

        # Filter for 2007-02-01 and 2007-02-02
        powerData <- subset(powerDataAll, Date %in% c("1/2/2007", "2/2/2007"))

        # Set the correct date & time formats
        if(!require(lubridate)){
                install.packages("lubridate") 
        }
        library(lubridate)

        powerData$Date_Time <- paste(powerData$Date, powerData$Time, sep = " ")
        powerData$Date_Time <- dmy_hms(powerData$Date_Time)

        # Save file
        write.csv(powerData, "powerData.csv", row.names = FALSE)
} 
