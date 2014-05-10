##Read the data, use the option in read.csv to replace ? with NA

powerData <- read.csv("~/Exploratory Analysis/household_power_consumption.txt", sep=";",na.strings=c("","?"))
powerData$Date<-as.Date(powerData$Date,"%d/%m/%Y")

## Pick the relevant subset to work with, *much* faster
miniData<-powerData[powerData$Date %in% as.Date(c("2007-02-01","2007-02-02"))]

