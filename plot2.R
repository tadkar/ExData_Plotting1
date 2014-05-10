##Read the data, use the option in read.csv to replace ? with NA

powerData <- read.csv("~/Exploratory Analysis/household_power_consumption.txt", sep=";",na.strings=c("","?"))
powerData$Date<-as.Date(powerData$Date,"%d/%m/%Y")

## Pick the relevant subset to work with, *much* faster
miniData<-powerData[powerData$Date %in% as.Date(c("2007-02-01","2007-02-02"))]

##create a helper variable with all the required date and time info in one variable
datetime<-as.POSIXct(paste(miniData$Date," ",miniData$Time),format="%Y-%m-%d %H:%M:%S")

plot(datetime,miniData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

##Alternative is to plot with the "n" option - basically no plot and then add the line
##plot(datetime,miniData$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
##lines(datetime,miniData$Global_active_power)

## Write output file
## default option is 480x480
dev.copy(png,"plot2.png")
dev.off()
