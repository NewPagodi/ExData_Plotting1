library(sqldf)
f <- file("household_power_consumption.txt")
bigdf <- sqldf("select * from f", dbname = tempfile(), file.format = list(sep=";",header = T, row.names = F))

subdf=subset(bigdf,Date=="1/2/2007" | Date=="2/2/2007")
subdf$dt2 = strptime(paste(subdf$Date,subdf$Time),"%d/%m/%Y %H:%M:%S")


png("plot4.png",bg="transparent")
par(mfrow=c(2,2))
plot(subdf$dt2,subdf$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(subdf$dt2,subdf$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(subdf$dt2,subdf$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(subdf$dt2,subdf$Sub_metering_2,col="red")
lines(subdf$dt2,subdf$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty=c(1,1,1),lwd=c(2.5,2.5,2.5),bty = "n")
plot(subdf$dt2,subdf$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

par(mfrow=c(1,1))
dev.off()