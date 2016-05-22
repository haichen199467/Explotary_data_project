source('load_data.R')
subdata <- load()
subdata$datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(subdata$datetime,
     subdata$Global_active_power,
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power(kilowatts)")
dev.off()