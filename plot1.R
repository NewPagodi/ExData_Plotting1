#if the needed file isn't in the working directory
#unzip or dl as needed.
if (!file.exists("household_power_consumption.txt")){
  if (!file.exists("exdata_data_household_power_consumption.zip")){
    message("Downloading data")
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="exdata_data_household_power_consumption.zip")
    unzip("exdata_data_household_power_consumption.zip")
  }
  else{
    unzip("exdata_data_household_power_consumption.zip")
  }
}


library(sqldf)
f <- file("household_power_consumption.txt")
bigdf <- sqldf("select * from f", dbname = tempfile(), file.format = list(sep=";",header = T, row.names = F))

subdf=subset(bigdf,Date=="1/2/2007" | Date=="2/2/2007")

png("plot1.png",bg="transparent")
hist(subdf$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",ylab="Frequency" ,main="Global Active Power")
dev.off()
