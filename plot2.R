library(sqldf)
f <- file("household_power_consumption.txt")
bigdf <- sqldf("select * from f", dbname = tempfile(), file.format = list(sep=";",header = T, row.names = F))

subdf=subset(bigdf,Date=="1/2/2007" | Date=="2/2/2007")
subdf$dt2 = strptime(paste(subdf$Date,subdf$Time),"%d/%m/%Y %H:%M:%S")

png("plot2.png",bg="transparent")
plot(subdf$dt2,subdf$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()