library(data.table)

#Set working directory
setwd("D:/Desktop/Data Science/Module4ExploratoryDataAnalysis/CourseProject1")

#Read data from file and subset data from the dates 2007-02-01 and 2007-02-02
data <- fread("household_power_consumption.txt")
sub_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007"]
data_date <- as.POSIXct(strptime(paste(sub_data$Date, sub_data$Time),"%d/%m/%Y %H:%M:%S"))
sub_data <- cbind(sub_data, data_date)

#Plot4

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

#Top-left
plot(sub_data$data_date, sub_data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#Top-right
plot(sub_data$data_date, sub_data$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

#Bottom-left
plot(sub_data$data_date, sub_data$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
lines(sub_data$data_date, sub_data$Sub_metering_2, col = "red")
lines(sub_data$data_date, sub_data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Bottom-right
plot(sub_data$data_date, sub_data$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_rective_power")

dev.copy(png, 'D:/Desktop/Data Science/Module4ExploratoryDataAnalysis/CourseProject1/plot4.png', height=480, width=480)
dev.off()