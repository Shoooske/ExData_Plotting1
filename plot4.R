Data <- file("household_power_consumption.txt")
EPC <- read.table(text = grep("^[1,2]/2/2007", readLines(Data), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

setTime <- strptime(paste(EPC$Date, EPC$Time, sep = ""), "%d/%m/%Y %H:%M:%S")
Data2 <- cbind(setTime, EPC)

labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))       
       
plot(Data2$setTime, Data2$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(Data2$setTime, Data2$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(Data2$setTime, Data2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Data2$setTime, Data2$Sub_metering_2, type="l", col="red")
lines(Data2$setTime, Data2$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(Data2$setTime, Data2$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
