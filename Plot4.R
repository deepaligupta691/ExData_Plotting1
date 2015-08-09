setwd('E:/study/exploratory data/exdata-data-household_power_consumption')

data = read.table('household_power_consumption.txt',sep=';',stringsAsFactors=F,header=T)
data1 = data[which(data$Date %in% c('1/2/2007' , '2/2/2007')),]

data1$Date = as.Date(data1$Date, format='%d/%m/%Y')
data1$Time = strptime(paste(data1$Date,data1$Time,sep=' '), format='%Y-%m-%d %H:%M:%S')
data1$Global_active_power = as.numeric(data1$Global_active_power)
data1$voltage = as.numerc(data1$voltage)

png(filename = "plot4.png", width = 480, height = 480)
par("mfrow"=c(2,2))
plot(data1$Time,data1$Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab='', lwd=0.1)
plot(data1$Time,data1$Voltage, type='l', ylab='Voltage', xlab='datetime', lwd=0.1)
plot(data1$Time,data1$Sub_metering_1, type='l', ylab='Energy sub metering', xlab='', lwd=0.1)
lines(data1$Time,data1$Sub_metering_2, col='red', lwd=0.1)
lines(data1$Time,data1$Sub_metering_3, col='blue', lwd=0.1)
legend('topright',legend= c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),lty=1, col= c('black','red','blue'), bty='n')
plot(data1$Time, data1$Global_reactive_power, type='l', ylab = 'Global_reactive_power', xlab = 'datetime', lwd=0.1)
dev.off()


