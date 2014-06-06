url <- "household_power_consumption.txt"
data <- read.table(file = url, header = TRUE, sep=";")

data$Time <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
startDate = as.Date("2007-02-01", format="%Y-%m-%d")
endDate = as.Date("2007-02-02", format="%Y-%m-%d")

data2 = data[data$Date <= endDate & data$Date >= startDate, ]
data2$Global_active_power = as.numeric(as.character(data2$Global_active_power))

png(filename="plot2.png")
plot(data2$Time, data2$Global_active_power,type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()

