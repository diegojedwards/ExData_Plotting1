data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
datafilter <- data[data$datetime >= "2007-02-01 00:00:00" &  data$datetime <= "2007-02-03 00:00:00", ]

par(mfrow = c(2,2))
plot(datafilter$datetime, datafilter$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", cex.lab = 0.8, cex.axis = 0.7)
plot(datafilter$datetime, datafilter$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", cex.lab = 0.8, cex.axis = 0.7)
plot(datafilter$datetime, datafilter$Sub_metering_1, type ="l", ylab = "Energy sub metering", xlab ="", cex.lab = 0.8, cex.axis = 0.7)
lines(datafilter$datetime, datafilter$Sub_metering_2, col = "red")
lines(datafilter$datetime, datafilter$Sub_metering_3, col = "blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , lty=1, col=c('black', 'red', 'blue'), bty='n', border = "black", cex = 0.6)
plot(datafilter$datetime, datafilter$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", cex.lab = 0.8, cex.axis = 0.7)