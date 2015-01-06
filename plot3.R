library(sqldf)
f <- file("household_power_consumption.txt")
bigdf <- sqldf("select * from f", dbname = tempfile(), file.format = list(sep=";",header = T, row.names = F))

subdf=subset(bigdf,Date=="1/2/2007" | Date=="2/2/2007")
subdf$dt2 = strptime(paste(subdf$Date,subdf$Time),"%d/%m/%Y %H:%M:%S")

png("plot3.png",bg="transparent")
plot(subdf$dt2,subdf$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(subdf$dt2,subdf$Sub_metering_2,col="red")
lines(subdf$dt2,subdf$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),lwd=c(1,1,1))
dev.off()

