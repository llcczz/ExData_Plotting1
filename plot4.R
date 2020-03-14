data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(data_url, destfile = "household_power_consumption.zip", method = "curl")
unzip("household_power_consumption.zip")
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot4.png")
par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power, type="l", ylab = "Global Active Power", xlab="")
plot(data$DateTime, data$Voltage, type="l", ylab = "Voltage", xlab="datetime")
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
points(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1)
plot(data$DateTime, data$Global_reactive_power, type="l", ylab = "Global Reactive Power", xlab="datetime")
dev.off()


