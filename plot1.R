##Set environment
setwd("./data")


## REad datafile
Consumpt <- file("household_power_consumption.txt")
Selecteddata <- read.table(text = grep("^[1,2]/2/2007", readLines(Consumpt), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

## Generate Plot 1 to default device
hist(Selecteddata$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")

## Convert plot 1 into plot1.ong file
dev.copy(png."plot1.png")

## Close device
dev.off
