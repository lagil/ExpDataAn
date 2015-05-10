## Set working directory
setwd("./data")


## Load data file and select information from February 1 and 2, 2007
powerc <- file("household_power_consumption.txt")
selecteddata<- read.table(text = grep("^[1,2]/2/2007", readLines(powerc), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

## Format date and time
selecteddata$Time <- strptime(do.call(paste0,selecteddata[c(1,2)]), "%d/%m/%Y%H:%M:%S")
selecteddata$Date <- as.Date(selecteddata$Date, "%d/%m/%Y")

## Format the graph and margins
par(mfrow = c(2, 2), mar = c(4,4,2,1), oma = c(0,0,2,0))

## Starting the plotting process
with (selecteddata ,{
     plot (x=Time, y=as.numeric(Global_active_power)/500, type = "l" ,ylab = "Global Active Power" , xlab ="")
     plot (x=Time, y=as.numeric(Voltage), type = "l" ,ylab = "Voltage" , xlab ="DateTime")
     plot (x=Time, y=as.numeric(Sub_metering_1),  type = "l", ylab = "Energy Sub Metering" , xlab ="")
     points(x=Time, y=as.numeric(Sub_metering_2), type="l", col="red")
     points(x=Time, y=as.numeric(Sub_metering_3), type="l", col="blue")
     legend("topright", pch = NA, lwd = 3, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     plot (x=Time, y=as.numeric(Global_reactive_power), type = "l" ,ylab = "Global Reactive Power" , xlab ="DateTime")
})

## Convert to plot4.png file
dev.copy(png,"plot4.png")

## Close connection
dev.off()

