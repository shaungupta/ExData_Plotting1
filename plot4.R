power<- read.table("household_power_consumption.txt", sep=";", header=TRUE, as.is=TRUE)
power$Date<-as.Date(power[["Date"]], format="%d/%m/%Y")
power<-power[power[["Date"]]==as.Date("2007-02-01") | power[["Date"]]==as.Date("2007-02-02"),]
power$DateTime<-strptime(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")
png(file="plot4.png")
par(mfrow=c(2,2))
with(power, plot(DateTime, Global_active_power, typ="l", xlab="", ylab="Global Active Power"))
with(power, plot(DateTime, Voltage, typ="l", xlab="datetime", ylab="Voltage"))
with(power, plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type = "n"))
with(power, lines(DateTime, Sub_metering_1))
with(power, lines(DateTime, Sub_metering_2, col="red"))
with(power, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
with(power, plot(DateTime, Global_reactive_power, typ="l", xlab="datetime"))
dev.off()