data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(data_url, destfile = "household_power_consumption.zip", method = "curl")
unzip("household_power_consumption.zip")
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot2.png")
plot(data$DateTime, data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()
