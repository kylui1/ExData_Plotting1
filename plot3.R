url <- "household_power_consumption.txt"
data <- read.table(file = url, header = TRUE, sep=";")

data$Time <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
startDate = as.Date("2007-02-01", format="%Y-%m-%d")
endDate = as.Date("2007-02-02", format="%Y-%m-%d")

data2 = data[data$Date <= endDate & data$Date >= startDate, ]
data2$Sub_metering_1 = as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 = as.numeric(as.character(data2$Sub_metering_2))

png(filename="plot3.png")
with(data2, plot(Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data2, lines(Time, Sub_metering_2, type="l", col="RED"))
with(data2, lines(Time, Sub_metering_3, type="l", col="BLUE"))
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),
       col=c("black","blue","red"), lty=1, lwd=1)
dev.off()
