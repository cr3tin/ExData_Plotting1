draw <- function(){
	library(dplyr)
	library(lubridate)
	data <- read.csv( "household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
	smallData <- filter( data, Date == '1/2/2007' | Date == '2/2/2007' )
	dateData <- mutate( smallData, Date_Time = dmy_hms(paste(Date,Time)))
	dev.new(width=480, height=480)
	plot(dateData$Date_Time,dateData$Global_active_power, type="o", pch="", ylab="Global Active Power (kilowatts)", xlab="")
	dev.copy(png,'plot2.png')
	dev.off()
}