##Set environment
setwd("./data")

## REad datafile
alldata <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')

## Format the data to get the correct information
alldata$Date <- as.Date(alldata$Date, format = "%d/%m/%Y")

## Get a subset of the required information
data <- subset(alldata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## for,at the date ant time of the required info
datetime <- paste(as.Date(data$Date), data$Time)


## Plot 2 to screen
plot(data$Global_active_power ~ data$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## Convert plot 2 into plot2.png file
dev.copy(png, "plot2.png")

## Close device
dev.off()

