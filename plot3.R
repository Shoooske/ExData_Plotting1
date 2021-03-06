Data <- file("household_power_consumption.txt")
EPC <- read.table(text = grep("^[1,2]/2/2007", readLines(Data), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

setTime <- strptime(paste(EPC$Date, EPC$Time, sep = ""), "%d/%m/%Y %H:%M:%S")
Data2 <- cbind(setTime, EPC)
 
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(Data2$setTime, Data2$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(Data2$setTime, Data2$Sub_metering_2, col=columnlines[2])
lines(Data2$setTime, Data2$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()