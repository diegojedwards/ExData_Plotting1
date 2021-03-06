data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
datafilter <- data[data$datetime >= "2007-02-01 00:00:00" &  data$datetime <= "2007-02-03 00:00:00", ]

plot(datafilter$datetime, datafilter$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", cex.main = 1, cex.lab = 0.8, cex.axis = 0.8)
