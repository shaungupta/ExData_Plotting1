power<- read.table("household_power_consumption.txt", sep=";", header=TRUE, as.is=TRUE)
power$Date<-as.Date(power[["Date"]], format="%d/%m/%Y")
power<-power[power[["Date"]]==as.Date("2007-02-01") | power[["Date"]]==as.Date("2007-02-02"),]
power$DateTime<-strptime(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")
png(file="plot2.png")
with(power, plot(DateTime, Global_active_power, typ="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()