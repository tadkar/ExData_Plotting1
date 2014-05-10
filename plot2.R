datetime<-as.POSIXct(paste(miniData$Date," ",miniData$Time),format="%Y-%m-%d %H:%M:%S")

plot(datetime,miniData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

##Alternative is to plot with the "n" option - basically no plot and then add the line
##plot(datetime,miniData$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
##lines(datetime,miniData$Global_active_power)

##Write the output file
dev.copy(png,"plot2.png")
dev.off()
