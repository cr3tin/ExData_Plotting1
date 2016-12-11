draw <- function(){
	library(dplyr)
	library(lubridate)
	data <- read.csv( "household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
	smallData <- filter( data, Date == '1/2/2007' | Date == '2/2/2007' )
	dateData <- mutate( smallData, Date = dmy(Date), Time = hms(Time) )
	dev.new(width=480, height=480)
	hist(dateData$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power",col="Red")
	dev.copy(png,'plot1.png')
	dev.off()
}