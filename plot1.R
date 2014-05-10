##Read the data, use the option in read.csv to replace ? with NA
## Replacement is also possible with 
##powerData[powerData=="?"]=NA
##The reverse operation would be
##powerData[is.na(powerData)]="?"
##as you can't check for equality with NA

powerData <- read.csv("~/Exploratory Analysis/household_power_consumption.txt", sep=";",na.strings=c("","?"))
powerData$Date<-as.Date(powerData$Date,"%d/%m/%Y")

## Pick the relevant subset to work with, *much* faster
miniData<-powerData[powerData$Date %in% as.Date(c("2007-02-01","2007-02-02"))]

##Draw and save the required plot
hist(miniData$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

## default option is 480x480
dev.copy(png,"plot1.png")
dev.off()
