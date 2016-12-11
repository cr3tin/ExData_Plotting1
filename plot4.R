draw <- function(){
	library(dplyr)
	library(lubridate)
	data <- read.csv( "household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
	smallData <- filter( data, Date == '1/2/2007' | Date == '2/2/2007' )
	dateData <- mutate( smallData, Date_Time = dmy_hms(paste(Date,Time)))
	dev.new(width=480, height=480)

	par(mfcol = c(2,2))
	plot(dateData$Date_Time,dateData$Global_active_power, type="o", pch="", ylab="Global Active Power (kilowatts)", xlab="")
	plot(dateData$Date_Time,dateData$Sub_metering_1, type="o", pch="", ylab="Energy sub metering", xlab="")
	lines(dateData$Date_Time,dateData$Sub_metering_2, type="o", pch="", col="Red")
	lines(dateData$Date_Time,dateData$Sub_metering_3, type="o", pch="", col="Blue")
	legend("topright", pch="-", col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	plot(dateData$Date_Time,dateData$Voltage, type="o", pch="", ylab="Voltage", xlab="datetime")
	plot(dateData$Date_Time,dateData$Global_reactive_power, type="o", pch="", ylab="Global_reactive_power", xlab="datetime")

	dev.copy(png,'plot4.png')
	dev.off()
}