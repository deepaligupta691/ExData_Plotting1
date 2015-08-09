setwd('E:/study/exploratory data/exdata-data-household_power_consumption')

data = read.table('household_power_consumption.txt',sep=';',stringsAsFactors=F,header=T)
data1 = data[which(data$Date %in% c('1/2/2007' , '2/2/2007')),]

data1$Date = as.Date(data1$Date, format='%d/%m/%Y')
data1$Time = strptime(paste(data1$Date,data1$Time,sep=' '), format='%Y-%m-%d %H:%M:%S')
data1$Global_active_power = as.numeric(data1$Global_active_power)

library(ggplot2)

png(filename = "plot2.png", width = 480, height = 480)
plot(data1$Time,data1$Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab='')
dev.off()


