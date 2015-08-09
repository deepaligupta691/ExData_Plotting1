setwd('E:/study/exploratory data/exdata-data-household_power_consumption')

data = read.table('household_power_consumption.txt',sep=';',stringsAsFactors=F,header=T)
data1 = data[which(data$Date %in% c('1/2/2007' , '2/2/2007')),]

data1$Date = as.Date(data1$Date, format='%d/%m/%Y')
data1$Global_active_power = as.numeric(data1$Global_active_power)

library(ggplot2)

png(filename = "plot1.png", width = 480, height = 480)
hist(data1$Global_active_power, bandwidth=0.5,  xlim=c(0,6), xlab='Global active power (Kilowatts)',ylab='Frequency', main='Global Active Power', col='red')
dev.off()




