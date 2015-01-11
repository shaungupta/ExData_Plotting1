power<- read.table("household_power_consumption.txt", sep=";", header=TRUE, as.is=TRUE)
power$Date<-as.Date(power[["Date"]], format="%d/%m/%Y")
power<-power[power[["Date"]]==as.Date("2007-02-01") | power[["Date"]]==as.Date("2007-02-02"),]
png(file="plot1.png")
hist(as.double(power$Global_active_power), xlab="Global Active Power (kilowatts)", col="red", breaks=12, main="Global Active Power")
dev.off()


