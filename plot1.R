library(sqldf)
f <- file("household_power_consumption.txt")
bigdf <- sqldf("select * from f", dbname = tempfile(), file.format = list(sep=";",header = T, row.names = F))

subdf=subset(bigdf,Date=="1/2/2007" | Date=="2/2/2007")

png("plot1.png",bg="transparent")
hist(subdf$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",ylab="Frequency" ,main="Global Active Power")
dev.off()