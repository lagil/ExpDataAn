## Set working directory
setwd("./data")


## Load data file and select information from February 1 and 2, 2007
powerc <- file("household_power_consumption.txt")
selecteddata<- read.table(text = grep("^[1,2]/2/2007", readLines(powerc), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

## Format the date and time varaibles
selecteddata$Time <- strptime(do.call(paste0,selecteddata[c(1,2)]), "%d/%m/%Y%H:%M:%S")
selecteddata$Date <- as.Date(selecteddata$Date, "%d/%m/%Y")

## Plot the graphic
with (selecteddata, plot(Time, as.numeric(Sub_metering_1),  type = "l", ylab = "Energy Sub Metering" , xlab =""), axis(2,at= c(10,20,30,40)))
with (selecteddata, points(Time, as.numeric(Sub_metering_2), type="l", col="red"))
with (selecteddata, points(Time, as.numeric(Sub_metering_3), type="l", col="blue"))
legend("topright", pch = NA, lwd = 3, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Convert to a file
dev.copy(png,"plot3.png")

## Close the connection
dev.off()