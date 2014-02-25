data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
datafilter <- data[data$datetime >= "2007-02-01 00:00:00" &  data$datetime <= "2007-02-03 00:00:00", ]

plot(datafilter$datetime, datafilter$Sub_metering_1, type ="l", ylab = "Energy sub metering", xlab ="", cex.main = 1, cex.lab = 0.8, cex.axis = 0.8)
lines(datafilter$datetime, datafilter$Sub_metering_2, col = "red")
lines(datafilter$datetime, datafilter$Sub_metering_3, col = "blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , lty=1, col=c('black', 'red', 'blue'), bty='o', border = "black", cex = 0.8)
