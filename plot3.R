plotESB <- function() {
    # load in data
    data <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
    
    # convert Date field to POSIXct
    data$Date <- strptime(data$Date, "%d/%m/%Y")
    
    # convert GAP to numeric
    data$Global_active_power <- as.numeric(data$Global_active_power)
    
    # create subset for date range
    subdata <- subset(data, Date>=as.POSIXct("2007-02-01") & Date<as.POSIXct("2007-02-03"))
    
    png(filename = "plot3.png", width=480, height=480)
    plot(subdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", xaxt="n")
    lines(subdata$Sub_metering_2, col="red")
    lines(subdata$Sub_metering_3, col="blue")
    axis(1, at = c(1, 1440, 2880), labels=c("Thurs", "Fri", "Sat"), las=0)
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
    dev.off()
}