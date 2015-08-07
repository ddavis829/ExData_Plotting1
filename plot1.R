plotGAP <- function() {
    # load in data
    data <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
    
    # convert Date field to POSIXct
    data$Date <- strptime(data$Date, "%d/%m/%Y")
    
    # convert GAP to numeric
    data$Global_active_power <- as.numeric(data$Global_active_power)
    
    # create subset for date range
    subdata <- subset(data, Date>=as.POSIXct("2007-02-01") & Date<as.POSIXct("2007-02-03"))
    
    png(filename = "plot1.png", width=480, height=480)
    hist(subdata$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
    dev.off()
}