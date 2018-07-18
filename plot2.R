library(data.table)

#Set working directory
setwd("D:/Desktop/Data Science/Module4ExploratoryDataAnalysis/CourseProject1")

#Read data from file and subset data from the dates 2007-02-01 and 2007-02-02
data <- fread("household_power_consumption.txt")
sub_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007"]
data_date <- as.POSIXct(strptime(paste(sub_data$Date, sub_data$Time), "%d/%m/%Y %H:%M:%S"))
sub_data <- cbind(sub_data, data_date)

#Plot2
plot(sub_data$data_date, sub_data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, 'D:/Desktop/Data Science/Module4ExploratoryDataAnalysis/CourseProject1/plot2.png', height = 480, width = 480)
dev.off()