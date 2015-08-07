plotAll <- function() {
    # load in data
    data <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
    
    # convert Date field to POSIXct
    data$Date <- strptime(data$Date, "%d/%m/%Y")
    
    # convert GAP to numeric
    data$Global_active_power <- as.numeric(data$Global_active_power)
    
    # create subset for date range
    subdata <- subset(data, Date>=as.POSIXct("2007-02-01") & Date<as.POSIXct("2007-02-03"))
    
    png(filename = "plot4.png", width=480, height=480)
    
    # set 2x2 graphics
    par(mfrow = c(2,2))
    
    # plot global active power
    plot(subdata$Global_active_power, type="l", xlab="", xaxt="n", ylab="Global Active Power (kilowatts)")
    axis(1, at = c(1, 1440, 2880), labels=c("Thurs", "Fri", "Sat"), las=0)
    
    # plot voltage
    plot(subdata$Voltage, type="l", ylab="Voltage", xlab="datetime", xaxt="n")
    axis(1, at = c(1, 1440, 2880), labels=c("Thurs", "Fri", "Sat"), las=0)
    
    # plot energy sub metering
    plot(subdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", xaxt="n")
    lines(subdata$Sub_metering_2, col="red")
    lines(subdata$Sub_metering_3, col="blue")
    axis(1, at = c(1, 1440, 2880), labels=c("Thurs", "Fri", "Sat"), las=0)
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty="n")
    
    # plot global reactive power
    plot(subdata$Global_reactive_power, type="l", xlab="datetime", xaxt="n", ylab="Global_reactive_power")
    axis(1, at = c(1, 1440, 2880), labels=c("Thurs", "Fri", "Sat"), las=0)
    
    dev.off()
}