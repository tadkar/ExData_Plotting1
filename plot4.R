##Read the data, use the option in read.csv to replace ? with NA

powerData <- read.csv("~/Exploratory Analysis/household_power_consumption.txt", sep=";",na.strings=c("","?"))
powerData$Date<-as.Date(powerData$Date,"%d/%m/%Y")

## Pick the relevant subset to work with, *much* faster
miniData<-powerData[powerData$Date %in% as.Date(c("2007-02-01","2007-02-02"))]

## Found this website helpful
## http://www.statmethods.net/advgraphs/layout.html


## Start a new 2x2 panel to plot
par(mfrow=c(2,2))

## the sequence is along the rows first, then along the columns
## just like English writing in a book
## move on to the next plot each time plot is called

## Top left plot
plot(datetime,miniData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

##Top right plot
plot(datetime,miniData$Voltage,type="l",xlab="datetime",ylab="Voltage")

## Bottom left plot 
## TODO Possibly fiddle with cex parameter to get closer match to example
plot(datetime,miniData$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(datetime,miniData$Sub_metering_2,col="red")
lines(datetime,miniData$Sub_metering_3,col="blue")
legend("topright",title="",legend=names(miniData)[grep("Sub*",names(miniData))], seg.len=2.0, lwd=1,col=c("black","red","blue"),bty="n",cex=0.5)

## Bottom right plot
plot(datetime,miniData$Global_reactive_power,type="l")

dev.copy(png,"plot4.png")
dev.off()
