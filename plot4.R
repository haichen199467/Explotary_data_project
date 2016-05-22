source('load_data.R')
subdata <- load()
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subdata$Global_active_power)
globalReactivePower <- as.numeric(subdata$Global_reactive_power)
voltage <- as.numeric(subdata$Voltage)
subMetering1 <- as.numeric(subdata$Sub_metering_1)
subMetering2 <- as.numeric(subdata$Sub_metering_2)
subMetering3 <- as.numeric(subdata$Sub_metering_3)

# start to plot
png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))

plot(datetime, globalActivePower, 
     type="l", 
     xlab="", 
     ylab="Global Active Power", 
     cex=0.2)

plot(datetime, subMetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=2.5, bty = "n",
       col=c("black", "red", "blue"))

plot(datetime, voltage, 
     type="l", 
     xlab="datetime", 
     ylab="Voltage", 
     cex=0.2)

plot(datetime, globalReactivePower, 
     type="l", 
     xlab="datetime", 
     ylab="Global_reactive_power", 
     cex=0.2)
dev.off()